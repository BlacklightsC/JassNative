using System;

using Cirnix.JassNative.JassAPI;
using Cirnix.JassNative.Runtime.Utilities.UnmanagedCalls;
using Cirnix.JassNative.Runtime.Windows;

using static Cirnix.JassNative.Runtime.Utilities.Memory;

namespace Cirnix.JassNative.Common
{
    internal static class JassMemory
    {
        private delegate JassInteger MemorySI(JassStringArg s);
        private delegate JassInteger MemoryIII(JassInteger i_1, JassInteger i_2);
        private delegate JassInteger MemoryII(JassInteger i);
        private delegate void MemoryIIV(JassInteger i_1, JassInteger i_2);
        private delegate JassRealRet MemoryIR(JassInteger i);
        private delegate void MemoryIRV(JassInteger i, JassRealArg r);
        private delegate JassStringRet MemoryIIS(JassInteger i_1, JassInteger i_2);
        private delegate void MemoryISV(JassInteger i, JassStringArg s);
        private static JassInteger GetModuleHandle(JassStringArg moduleName)
            => Kernel32.GetModuleHandle(moduleName).ToInt32();

        private static JassInteger FindModuleHandle(JassInteger offset, JassInteger signature)
            => FollowPointer(new IntPtr(offset), signature).ToInt32();

        private static JassInteger MemoryGetByte(JassInteger offset)
        {
            byte[] buffer = ForceRead(new IntPtr(offset), 1);
            return buffer == null ? 0 : buffer[0];
        }

        private static void MemorySetByte(JassInteger offset, JassInteger value)
            => Patch(new IntPtr(offset), (byte)value);

        private static JassInteger MemoryGetInteger(JassInteger offset)
            => ForceReadInt(new IntPtr(offset));

        private static void MemorySetInteger(JassInteger offset, JassInteger value)
            => Patch(new IntPtr(offset), value);

        private static JassRealRet MemoryGetReal(JassInteger offset)
            => ForceReadFloat(new IntPtr(offset));

        private static void MemorySetReal(JassInteger offset, JassRealArg value)
            => Patch(new IntPtr(offset), value);

        private static JassStringRet MemoryGetString(JassInteger offset, JassInteger length)
        {
            if (length > 0)
                return ReadString(new IntPtr(offset), length);
            else
                return ReadString(new IntPtr(offset));
        }

        private static void MemorySetString(JassInteger offset, JassStringArg value)
            => WriteString(new IntPtr(offset), value);

        private const int ProcCallKey = 0x0DA7883F; // StringHash("jass")
        private delegate JassBoolean ProcCallPrototype(JassInteger callConv, JassInteger address, JassHashTable ht);
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
                        case 'B': param[i] = Natives.LoadBoolean(ht, ProcCallKey, i + 1) ? 1 : 0; break;
                        case 'S': param[i] = Natives.LoadStrPtr(ht, ProcCallKey, i + 1).ToInt32(); break;
                    }
                switch (callConv)
                {
                    case 1:
                        switch (returns)
                        {
                            case 'V': Cdecl.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, Cdecl.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, Cdecl.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, Cdecl.Invoke<int>(ptr, param) > 0); break;
                        }
                        break;
                    case 2:
                        switch (returns)
                        {
                            case 'V': StdCall.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, StdCall.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, StdCall.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, StdCall.Invoke<int>(ptr, param) > 0); break;
                        }
                        break;
                    case 3:
                        switch (returns)
                        {
                            case 'V': FastCall.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, FastCall.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, FastCall.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, FastCall.Invoke<int>(ptr, param) > 0); break;
                        }
                        break;
                    case 4:
                        switch (returns)
                        {
                            case 'V': ThisCall.Invoke<IntPtr>(ptr, param); break;
                            case 'I': Natives.SaveInteger(ht, ProcCallKey, 0, ThisCall.Invoke<int>(ptr, param)); break;
                            case 'R': Natives.SaveReal(ht, ProcCallKey, 0, ThisCall.Invoke<float>(ptr, param)); break;
                            case 'B': Natives.SaveBoolean(ht, ProcCallKey, 0, ThisCall.Invoke<int>(ptr, param) > 0); break;
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
            Natives.Add(new MemorySI(GetModuleHandle));
            Natives.Add(new MemoryIII(FindModuleHandle));
            Natives.Add(new MemoryII(MemoryGetByte));
            Natives.Add(new MemoryIIV(MemorySetByte));
            Natives.Add(new MemoryII(MemoryGetInteger));
            Natives.Add(new MemoryIIV(MemorySetInteger));
            Natives.Add(new MemoryIR(MemoryGetReal));
            Natives.Add(new MemoryIRV(MemorySetReal));
            Natives.Add(new MemoryIIS(MemoryGetString));
            Natives.Add(new MemoryISV(MemorySetString));
            Natives.Add(new ProcCallPrototype(ProcCall));
        }
    }
}