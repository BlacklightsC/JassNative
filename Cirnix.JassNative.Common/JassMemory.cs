using System;

using Cirnix.JassNative.JassAPI;
using Cirnix.JassNative.Runtime.Plugin;
using Cirnix.JassNative.Runtime.Windows;

using static Cirnix.JassNative.Runtime.Utilities.Memory;

namespace Cirnix.JassNative.Common
{
    [Requires(typeof(JassAPIPlugin))]
    public sealed class JassMemory : IPlugin
    {
        private delegate JassInteger MemorySI(JassStringArg s);
        private delegate JassInteger MemoryIII(JassInteger i_1, JassInteger i_2);
        private delegate JassInteger MemoryII(JassInteger i);
        private delegate void MemoryIIV(JassInteger i_1, JassInteger i_2);
        private delegate JassRealRet MemoryIR(JassInteger i);
        private delegate void MemoryIRV(JassInteger i, JassRealArg r);
        private JassInteger GetModuleHandle(JassStringArg moduleName)
        {
            return Kernel32.GetModuleHandle(moduleName).ToInt32();
        }
        private JassInteger FindModuleHandle(JassInteger offset, JassInteger signature)
        {
            return FollowPointer(new IntPtr(offset), signature).ToInt32();
        }

        private JassInteger MemoryGetByte(JassInteger offset)
        {
            byte[] buffer = ForceRead(new IntPtr(offset), 1);
            return buffer == null ? 0 : buffer[0];
        }
        private void MemorySetByte(JassInteger offset, JassInteger value)
        {
            Patch(new IntPtr(offset), (byte)value);
        }

        private JassInteger MemoryGetInteger(JassInteger offset)
        {
            return ForceReadInt(new IntPtr(offset));
        }
        private void MemorySetInteger(JassInteger offset, JassInteger value)
        {
            Patch(new IntPtr(offset), value);
        }

        private JassRealRet MemoryGetReal(JassInteger offset)
        {
            return ForceReadFloat(new IntPtr(offset));
        }
        private void MemorySetReal(JassInteger offset, JassRealArg value)
        {
            Patch(new IntPtr(offset), value);
        }

        public void Initialize()
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

        public void OnGameLoad() { }

        public void OnMapStart() { }

        public void OnEngineStart() { }

        public void OnEngineEnd() { }

        public void OnMapEnd() { }
    }
}