using System;
using System.Diagnostics;

using Cirnix.JassNative.JassAPI;
using Cirnix.JassNative.Runtime.Utilities.UnmanagedCalls;
using Cirnix.JassNative.Runtime.Windows;

using static Cirnix.JassNative.Runtime.Utilities.Memory;

namespace Cirnix.JassNative.Common
{
    internal static class JassMiscellaneous
    {
        private static IntPtr GameDll;
        private static IntPtr StormDll;

        private delegate void MiscRVPrototype(JassRealArg r);
        private delegate void MiscIVPrototype(JassInteger i);
        private delegate JassRealRet MiscVRPrototype();
        private delegate JassInteger MiscVIPrototype();
        private delegate JassBoolean MiscVBPrototype();
        private delegate void WriteLogPrototype(JassStringArg str);
        private static void WriteLog(JassStringArg str) => Trace.WriteLine(str.ToString());

        private static void WriteLogReal(JassRealArg r) => Trace.WriteLine((float)r);

        private delegate JassStringRet GetLocalDateTimePrototype();
        private static JassStringRet GetLocalDateTime() => DateTime.Now.ToString();
        private static JassInteger GetLocalUnixTime()
        {
            try
            {
                return DateTimeOffset.Now.ToUnixTimeSeconds();
            }
            catch
            {
                return 0;
            }
        }

        private static JassRealRet GetMaxAttackSpeed() => ForceReadFloat(GameDll + 0xD33DA4);

        private static void SetMaxAttackSpeed(JassRealArg speed) => Patch(GameDll + 0xD33DA4, speed);

        private static JassBoolean IsReplayMode() => StdCall.Invoke<bool>(GameDll + 0x35FDD0);
        private static JassBoolean IsHostPlayer()
            => ForceReadInt(FollowPointer(StormDll + 0x58160, 0x07657F4C) + 0x214) == 2;
        private static JassInteger GetSyncDelay()
            => ForceReadInt(FollowPointer(StormDll + 0x58330, 0x68DBD6C0) + 0x2F0);

        private static void SetSyncDelay(JassInteger delay)
        {
            int value = delay;
            value = value <= 10 ? 10 : value >= 550 ? 550 : value;
            IntPtr ptr = FollowPointer(StormDll + 0x58330, 0x68DBD6C0);
            if (ptr == IntPtr.Zero) return;
            else ptr += 0x2F0;
            for (int i = 0; i <= 0x440; i += 0x220)
                Patch(ptr + i, value);
        }

        // 0x424E4554 'BNET'
        // 0x5443504E 'TCPN'
        // 0x4C4F4F50 'LOOP'
        // 0x4E4F4E45 'NONE'
        private static JassInteger GetConnectionState() => Cdecl.Invoke<int>(GameDll + 0x35F6D0);

        private const int ProcCallKey = 0x0DA7883F; // StringHash("jass")
        private delegate JassBoolean PrcoCallPrototype(JassInteger callConv, JassInteger address, JassHashTable ht);
        private static JassBoolean ProcCall(JassInteger callConv, JassInteger address, JassHashTable ht)
        {
            if (ht.Handle == IntPtr.Zero) return false;
            try
            {
                IntPtr ptr = new IntPtr(address);
                string Params = Natives.LoadStr(ht, ProcCallKey, 0);
                string takes = Params.Substring(1, Params.IndexOf(')') - 1);
                char returns = Params[Params.Length - 1];
                object[] param = new object[takes.Length];
                for (int i = 0; i < takes.Length; i++)
                    switch (takes[i])
                    {
                        case 'I': param[i] = Natives.LoadInteger(ht, ProcCallKey, i + 1); break;
                        case 'R': param[i] = Natives.LoadReal(ht, ProcCallKey, i + 1); break;
                        case 'B': param[i] = Natives.LoadBoolean(ht, ProcCallKey, i + 1); break;
                        case 'S': param[i] = Natives.LoadStr(ht, ProcCallKey, i + 1); break;
                    }
                switch (callConv)
                {
                    case 1:
                        switch (returns)
                        {
                            case 'V': Cdecl.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, Cdecl.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, Cdecl.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, Cdecl.Invoke<bool>(ptr, param)); break;
                        }
                        break;
                    case 2:
                        switch (returns)
                        {
                            case 'V': StdCall.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, StdCall.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, StdCall.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, StdCall.Invoke<bool>(ptr, param)); break;
                        }
                        break;
                    case 3:
                        switch (returns)
                        {
                            case 'V': FastCall.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, FastCall.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, FastCall.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, FastCall.Invoke<bool>(ptr, param)); break;
                        }
                        break;
                    case 4:
                        switch (returns)
                        {
                            case 'V': ThisCall.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, ThisCall.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, ThisCall.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, ThisCall.Invoke<bool>(ptr, param)); break;
                        }
                        break;
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        internal static void Initialize()
        {
            Natives.Add(new WriteLogPrototype(WriteLog));
            Natives.Add(new MiscRVPrototype(WriteLogReal));
            Natives.Add(new GetLocalDateTimePrototype(GetLocalDateTime));
            Natives.Add(new MiscVIPrototype(GetLocalUnixTime));
            Natives.Add(new MiscVRPrototype(GetMaxAttackSpeed));
            Natives.Add(new MiscRVPrototype(SetMaxAttackSpeed));
            Natives.Add(new MiscVBPrototype(IsReplayMode), false);
            Natives.Add(new MiscVBPrototype(IsHostPlayer), false);
            Natives.Add(new MiscVIPrototype(GetSyncDelay));
            Natives.Add(new MiscIVPrototype(SetSyncDelay));
            Natives.Add(new MiscVIPrototype(GetConnectionState));
            Natives.Add(new PrcoCallPrototype(ProcCall));
        }

        internal static void OnGameLoad()
        {
            GameDll = Kernel32.GetModuleHandle("Game.dll");
            StormDll = Kernel32.GetModuleHandle("Storm.dll");
        }

        internal static void OnMapEnd() => Patch(GameDll + 0xD33DA4, 5f);
    }
}