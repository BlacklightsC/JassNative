using System.Diagnostics;
using Cirnix.JassNative.Runtime.Plugin;

namespace Cirnix.JassNative.WarAPI
{
    public class WarAPIPlugin : IPlugin
    {
        public void Initialize() { }

        public void OnGameLoad()
        {
            Trace.WriteLine("Initializing addresses . . .");
            Trace.Indent();
            Stopwatch stopwatch = Stopwatch.StartNew();
            GameAddresses.Initialize();
            stopwatch.Stop();
            Trace.WriteLine("Done! (" + stopwatch.Elapsed.TotalMilliseconds.ToString("0.00") + " ms)");
            Trace.Unindent();
            Trace.WriteLine("Initializing functions . . .");
            Trace.Indent();
            stopwatch.Restart();
            GameFunctions.Initialize();
            stopwatch.Stop();
            Trace.WriteLine("Done! (" + stopwatch.Elapsed.TotalMilliseconds.ToString("0.00") + " ms)");
            Trace.Unindent();
            //Trace.WriteLine("Initializing game api . . .");
            //Trace.Indent();
            //stopwatch.Restart();
            //Game.Initialize();
            //stopwatch.Stop();
            //Trace.WriteLine("Done! (" + stopwatch.Elapsed.TotalMilliseconds.ToString("0.00") + " ms)");
            //Trace.Unindent();
        }

        public void OnMapLoad() { }

        public void OnMapEnd() { }

        public void OnProgramExit() { }
    }
}
