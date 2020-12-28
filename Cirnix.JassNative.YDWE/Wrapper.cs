using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;

using Cirnix.JassNative.Runtime;
using Cirnix.JassNative.Runtime.Windows;

namespace Cirnix.JassNative.YDWE
{
    internal static class Wrapper 
    {
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate void InitializePrototype();
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool SetWindowPrototype(IntPtr hWnd);

        private static Dictionary<string, IntPtr> plugins = new Dictionary<string, IntPtr>();

        private static IntPtr LoadLibraryA(string path)
        {
            IntPtr BaseAddr = Kernel32.LoadLibrary(path);
            if (BaseAddr == IntPtr.Zero)
                Trace.WriteLine($"{path} Load Failed!");
            else
                Trace.WriteLine($"0x{BaseAddr.ToString("X8")} : {path} Loaded!");
            return BaseAddr;
        }

        internal static void LoadYDWE()
        {
            string YDPath = $"{PluginSystem.HackPath}\\YDWE";
            try
            {
                if (!Directory.Exists(YDPath))
                    Trace.WriteLine("YD isn't exist, passed initialize");
                else
                {
                    foreach (var item in File.ReadAllLines($"{YDPath}\\bin\\loadfiles.txt"))
                        if (item.Equals("{plugins}", StringComparison.OrdinalIgnoreCase))
                            foreach (var plugin in File.ReadAllLines($"{YDPath}\\plugin\\warcraft3\\loadfiles.txt"))
                            {
                                IntPtr BaseAddr = LoadLibraryA($"{YDPath}\\plugin\\warcraft3\\{plugin}");
                                if (BaseAddr != IntPtr.Zero)
                                {
                                    plugins.Add(plugin, BaseAddr);
                                    if (plugin == "dzclient_api.dll")
                                    {
                                        CreateWindowHook.CreateWindowEvent = hWnd =>
                                        {
                                            IntPtr procAddr = Kernel32.GetProcAddress(BaseAddr, "SetWindow");
                                            if (procAddr != IntPtr.Zero)
                                                Marshal.GetDelegateForFunctionPointer<SetWindowPrototype>(procAddr)(hWnd);
                                        };
                                    }
                                }
                            }
                        else
                            LoadLibraryA($"{YDPath}\\bin\\{item}");
                }
            }
            catch
            {
                Trace.WriteLine("Library Load Failed!");
            }
        }

        internal static void Initialize()
        {
            try
            {
                foreach (var item in Directory.GetFiles($"{PluginSystem.HackPath}\\Mixtape"))
                    if (Path.GetExtension(item).Equals(".dll", StringComparison.OrdinalIgnoreCase))
                        LoadLibraryA(item);
                foreach (var plugin in plugins)
                {
                    if (plugin.Key != "dzclient_api.dll")
                    {
                        Trace.WriteLine($"Initializing {plugin.Key} . . .");
                        IntPtr procAddr = Kernel32.GetProcAddress(plugin.Value, "Initialize");
                        if (procAddr != IntPtr.Zero)
                            Marshal.GetDelegateForFunctionPointer<InitializePrototype>(procAddr)();
                    }
                    else if (PluginSystem.IsDebugging)
                    {
                        IntPtr ptr = plugin.Value + 0xB950;
                        if (Kernel32.VirtualProtect(ptr, 1, 0x40, out uint lpflOldProtect))
                        {
                            Marshal.WriteByte(ptr, 0x55);
                            Kernel32.VirtualProtect(ptr, 1, lpflOldProtect, out _);
                        }
                    }
                }
                Trace.WriteLine("Successed!");
            }
            catch
            {
                Trace.WriteLine("Initialize Failed!");
            }
        }

        internal static void StateReset()
        {
            if (plugins.ContainsKey("dzclient_api.dll"))
                Marshal.WriteInt32(plugins["dzclient_api.dll"] + 0x3365C, 0);
        }
    }
}
