using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

using Cirnix.JassNative.Runtime.Utilities;
using Cirnix.JassNative.Runtime.Windows;

namespace Cirnix.JassNative.YDWE
{
    internal static class CreateWindowHook
    {
        [DllImport("user32")] private static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

        [UnmanagedFunctionPointer(CallingConvention.ThisCall)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private unsafe delegate bool sub_6F16E920Prototype(IntPtr* @this, uint dwExStyle, uint dwStyle, int a4, int a5, int a6, int a7, byte a8);
        private static sub_6F16E920Prototype Real_sub_6F16E920;
        internal static Action<IntPtr> CreateWindowEvent;

        private unsafe static bool Fake_sub_6F16E920(IntPtr* @this, uint dwExStyle, uint dwStyle, int a4, int a5, int a6, int a7, byte a8)
        {
            bool ret = Real_sub_6F16E920(@this, dwExStyle, dwStyle, a4, a5, a6, a7, a8);
            IntPtr hWnd = FindWindow("Warcraft III", "Warcraft III");
            Trace.WriteLine($"hWnd = 0x{hWnd.ToString("X8")}");
            if (ret && hWnd != IntPtr.Zero && CreateWindowEvent != null)
                CreateWindowEvent(hWnd);
            return ret;
        }

        internal unsafe static void Initialize()
        {
            Real_sub_6F16E920 = Memory.InstallHook(Kernel32.GetModuleHandle("Game.dll") + 0x16E920, new sub_6F16E920Prototype(Fake_sub_6F16E920), true, false);
        }
    }
}
