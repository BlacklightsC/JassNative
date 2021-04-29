using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Windows;

using Cirnix.JassNative.Runtime.Plugin;
using Cirnix.JassNative.Runtime.Utilities;
using Cirnix.JassNative.Runtime.Windows;

namespace Cirnix.JassNative.Runtime
{
    public static class PluginSystem
    {
        public static string HackPath { get; internal set; }

        public static bool IsDebugging { get; internal set; }

        public static event Action TimerCallback;

        private static List<IPlugin> plugins = new List<IPlugin>();

        //private static List<IMapPlugin> mapPlugins = new List<IMapPlugin>();

        private static Dictionary<string, string> assemblies = new Dictionary<string, string>();

        private static Timer CheckTimer;
        private static IntPtr GameDll;
        public static bool Initialized = false;

        internal static void InitSystem()
        {
            CheckTimer = new Timer(item =>
            {
                IntPtr ptr = Kernel32.GetModuleHandle("speedhack-i386.dll");
                if (ptr == IntPtr.Zero) ptr = Kernel32.GetModuleHandle("inproc.dll");
                if (ptr == IntPtr.Zero) ptr = Kernel32.GetModuleHandle("Speeder.dll");
                if (ptr != IntPtr.Zero)
                {
                    CheckTimer.Change(Timeout.Infinite, Timeout.Infinite);
                    TimerCallback?.Invoke();
                    Thread.Sleep(5000);
                    Kernel32.FreeLibrary(ptr);
                    //Process.GetCurrentProcess().Kill();
                    //byte[] buffer = BitConverter.GetBytes(1.0f);
                    //for (int i = 0; i < 4; i++)
                    //    Marshal.WriteByte(ptr + 0x2D920, i, buffer[i]);
                }
                else if (Initialized)
                {
                    if (Memory.ForceRead(GameDll + 0x210373, 1)[0] != 0x23
                    ||  Memory.ForceRead(GameDll + 0x2104FF, 1)[0] != 0x75
                    ||  Memory.ForceRead(GameDll + 0x2A1373, 1)[0] != 0x85
                    ||  Memory.ForceRead(GameDll + 0x2A1376, 1)[0] != 0x84
                    ||  Memory.ForceRead(GameDll + 0x2A1386, 1)[0] != 0x85
                    ||  Memory.ForceRead(GameDll + 0x2A1389, 1)[0] != 0x84
                    ||  Memory.ForceRead(GameDll + 0x3C2373, 1)[0] != 0x74
                    ||  Memory.ForceRead(GameDll + 0x3E4048, 1)[0] != 0x74
                    ||  Memory.ForceRead(GameDll + 0x3E4089, 1)[0] != 0x08
                    ||  Memory.ForceRead(GameDll + 0x40AC9A, 1)[0] != 0x23
                    ||  Memory.ForceRead(GameDll + 0x558237, 1)[0] != 0x84
                    ||  Memory.ForceRead(GameDll + 0x6A2F03, 1)[0] != 0x75
                    ||  Memory.ForceRead(GameDll + 0x6BFD17, 1)[0] != 0xC3
                    ||  Memory.ForceRead(GameDll + 0x6BFFDE, 1)[0] != 0x75
                    ||  Memory.ForceRead(GameDll + 0x791D1D, 1)[0] != 0x66
                    ||  Memory.ForceRead(GameDll + 0x791D3E, 1)[0] != 0x85)
                    {
                        TimerCallback?.Invoke();
                        Thread.Sleep(5000);
                        Process.GetCurrentProcess().Kill();
                    }
                }
            });
            CheckTimer.Change(300000, 60000);
            Initialized = true;
        }

        internal static void LoadPlugins(string folder)
        {
            try
            {
                var list = new DependencySorter<string>();
                Trace.WriteLine("Locating plugins . . .");
                Trace.Indent();
                var sw = Stopwatch.StartNew();
                foreach (var file in Directory.GetFiles(folder, "*.dll", SearchOption.AllDirectories))
                {
                    try
                    {
                        string fileName = Path.GetFileName(file);
                        if (fileName == "Cirnix.JassNative.Runtime.dll") continue;
                        string version = "null";
                        try
                        {
                            version = FileVersionInfo.GetVersionInfo(file).FileVersion;
                        }
                        catch { }
                        Trace.WriteLine($"File: {fileName} ({version})");
                        Trace.Indent();
                        var assembly = Assembly.ReflectionOnlyLoadFrom(file);
                        foreach (var type in assembly.GetTypes().Where(t => t.Implements<IPlugin>()))
                        {
                            try
                            {
                                Trace.WriteLine("Type: " + type.FullName);
                                assemblies.Add(type.FullName, file);
                                list.AddObjects(type.FullName);
                                Trace.Indent();
                                foreach (var requires in type.GetRequires())
                                {
                                    list.SetDependencies(type.FullName, requires);
                                    Trace.WriteLine("Requires: " + requires);
                                }
                                Trace.Unindent();
                            }
                            catch (Exception e)
                            {
                                Trace.WriteLine("Exception: " + e.Message);
                            }
                        }
                        Trace.Unindent();
                    }
                    catch (ReflectionTypeLoadException e)
                    {
                        Trace.WriteLine("Exception: " + e);
                        Trace.Indent();
                        foreach (var exception in e.LoaderExceptions)
                            Trace.WriteLine("LoaderException: " + exception);
                        Trace.Unindent();
                    }
                }
                sw.Stop();
                Trace.WriteLine($"Done! ({sw.Elapsed.TotalMilliseconds:0.00} ms)");
                Trace.Unindent();

                Trace.WriteLine("Loading plugin assemblies and instanciating types. . .");
                Trace.Indent();
                sw.Restart();
                foreach (var s in list.Sort())
                {
                    Trace.WriteLine($"Loading assembly '{Path.GetFileName(assemblies[s])}' for type '{s}'");
                    try
                    {
                        var hObj = Activator.CreateInstance(assemblies[s], s);
                        plugins.Add((IPlugin)hObj.Unwrap());
                    }
                    catch (TargetInvocationException e)
                    {
                        if (e.InnerException is FileNotFoundException)
                            Trace.WriteLine(e.InnerException.Message);
                        else throw e;
                    }
                }
                sw.Stop();
                Trace.WriteLine($"Done! ({sw.Elapsed.TotalMilliseconds:0.00} ms)");
                Trace.Unindent();

                Trace.WriteLine("Initializing plugins . . .");
                Trace.Indent();
                sw.Restart();
                foreach (var plugin in plugins)
                {
                    Trace.WriteLine("Initializing " + plugin.GetType().FullName);
                    Trace.Indent();
                    try
                    {
                        plugin.Initialize();
                    }
                    catch (Exception e)
                    {
                        Trace.WriteLine(e);
                    }
                    Trace.Unindent();
                }
                sw.Stop();
                Trace.WriteLine($"Done! ({sw.Elapsed.TotalMilliseconds:0.00} ms)");
                Trace.Unindent();
            }
            catch (Exception exception)
            {
                MessageBox.Show(
                    $"Fatal exception!{Environment.NewLine}{exception}{Environment.NewLine}Aborting execution!",
                    $"{typeof(PluginSystem)}.Initialize()", MessageBoxButton.OK, MessageBoxImage.Error);
                Process.GetCurrentProcess().Kill();
            }
        }

        internal static void OnGameLoad()
        {
            try
            {
                Trace.WriteLine("OnGameLoad plugins . . .");
                Trace.Indent();
                var sw = Stopwatch.StartNew();
                GameDll = Kernel32.GetModuleHandle("Game.dll");
                foreach (var plugin in plugins)
                {
                    try
                    {
                        plugin.OnGameLoad();
                    }
                    catch (Exception e)
                    {
                        Trace.WriteLine($"OnGameLoad({plugin}): {e}");
                    }
                }
                sw.Stop();
                Trace.WriteLine($"Done! ({sw.Elapsed.TotalMilliseconds:0.00} ms)");
                Trace.Unindent();
            }
            catch (Exception exception)
            {
                MessageBox.Show(
                    $"Fatal exception!{Environment.NewLine}{exception}{Environment.NewLine}Aborting execution!",
                    $"{typeof(PluginSystem)}.OnGameLoad()", MessageBoxButton.OK, MessageBoxImage.Error);
                Process.GetCurrentProcess().Kill();
            }
        }

        public static void OnMapLoad()
        {
            /*
            using (var listfileStream = new StormFileStream(SFile.OpenFileEx(IntPtr.Zero, "(listfile)", 0)))
            using (var listfileReader = new StreamReader(listfileStream))
            {
                //Trace.WriteLine("Files");
                var listfile = listfileReader.ReadToEnd();
                var files = listfile.Replace("\r\n", "*").Replace("\r", "*").Replace("\n", "*").Split('*');
                for (var i = 0; i < files.Length - 1; i++)
                {
                    //Trace.WriteLine($" * '{files[i]}'");
                    if (files[i].EndsWith(".dll"))
                    {
                        using (var pluginStream = new StormFileStream(SFile.OpenFileEx(IntPtr.Zero, files[i], 0)))
                        {
                            var pluginBuffer = new byte[pluginStream.Length];
                            pluginStream.Read(pluginBuffer, 0, pluginBuffer.Length);
                            var pluginAssembly = Assembly.Load(pluginBuffer);
                            foreach (var t in pluginAssembly.GetTypes())
                                if (typeof(IMapPlugin).IsAssignableFrom(t))
                                    mapPlugins.Add((IMapPlugin)Activator.CreateInstance(t));
                        }
                    }
                }
            }
            */

            //foreach (var mapPlugin in mapPlugins)
            //    mapPlugin.OnMapLoad();
            foreach (var plugin in plugins)
                plugin.OnMapLoad();
        }

        internal static void OnMapEnd()
        {
            foreach (var plugin in plugins)
                plugin.OnMapEnd();
            //foreach (var mapPlugin in mapPlugins)
            //    mapPlugin.OnMapEnd();
            //mapPlugins.Clear();
        }

        internal static void OnProgramExit()
        {
            foreach (var plugin in plugins)
                plugin.OnProgramExit();
            //foreach (var mapPlugin in mapPlugins)
            //    mapPlugin.OnProgramExit();
        }
    }
}
