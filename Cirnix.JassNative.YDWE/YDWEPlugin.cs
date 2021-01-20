using System.Diagnostics;

using Cirnix.JassNative.Runtime.Plugin;

namespace Cirnix.JassNative.YDWE
{
    public class YDWEPlugin : IPlugin
    {
        public void Initialize()
        {
            DummyFunction.Initialize();
            Wrapper.LoadYDWE();
        }

        public void OnGameLoad()
        {
            Trace.WriteLine("Initializing CreateWindowHook . . .");
            Trace.Indent();
            Stopwatch stopwatch = Stopwatch.StartNew();
            CreateWindowHook.Initialize();
            stopwatch.Stop();
            Trace.WriteLine("Done! (" + stopwatch.Elapsed.TotalMilliseconds.ToString("0.00") + " ms)");
            Trace.Unindent();
            Trace.WriteLine("Initializing YDWE . . .");
            Trace.Indent();
            stopwatch.Restart();
            Wrapper.Initialize();
            stopwatch.Stop();
            Trace.WriteLine("Done! (" + stopwatch.Elapsed.TotalMilliseconds.ToString("0.00") + " ms)");
            Trace.Unindent();
        }

        public void OnMapLoad() { }

        public void OnMapEnd()
        {
            Wrapper.StateReset();
        }

        public void OnProgramExit() { }
    }
}
