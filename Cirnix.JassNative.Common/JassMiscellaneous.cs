﻿using System;
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

        private delegate JassInteger BitPrototype(JassInteger x, JassInteger y);
        private static JassInteger BitOr(JassInteger x, JassInteger y) => x | y;
        private static JassInteger BitAnd(JassInteger x, JassInteger y) => x & y;
        private static JassInteger BitXor(JassInteger x, JassInteger y) => x ^ y;

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

        internal static void Initialize()
        {
            Natives.Add(new WriteLogPrototype(WriteLog));
            Natives.Add(new MiscRVPrototype(WriteLogReal));
            Natives.Add(new GetLocalDateTimePrototype(GetLocalDateTime));
            Natives.Add(new MiscVIPrototype(GetLocalUnixTime));
            Natives.Add(new BitPrototype(BitOr), false);
            Natives.Add(new BitPrototype(BitAnd), false);
            Natives.Add(new BitPrototype(BitXor), false);
            Natives.Add(new MiscVRPrototype(GetMaxAttackSpeed));
            Natives.Add(new MiscRVPrototype(SetMaxAttackSpeed));
            Natives.Add(new MiscVBPrototype(IsReplayMode), false);
            Natives.Add(new MiscVBPrototype(IsHostPlayer), false);
            Natives.Add(new MiscVIPrototype(GetSyncDelay));
            Natives.Add(new MiscIVPrototype(SetSyncDelay));
        }

        internal static void OnGameLoad()
        {
            GameDll = Kernel32.GetModuleHandle("Game.dll");
            StormDll = Kernel32.GetModuleHandle("Storm.dll");
        }

        internal static void OnMapEnd() => Patch(GameDll + 0xD33DA4, 5f);
    }
}