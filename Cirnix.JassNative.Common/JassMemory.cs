using System;

using Cirnix.JassNative.JassAPI;
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
        }
    }
}