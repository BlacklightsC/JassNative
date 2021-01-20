using System.Diagnostics;
using Cirnix.JassNative.Runtime.Plugin;
using Cirnix.JassNative.WarAPI;

namespace Cirnix.JassNative.InterfaceAPI
{
	[Requires(typeof(WarAPIPlugin))]
	public class InterfaceAPIPlugin : IPlugin
	{
		public void Initialize() { }

		public void OnGameLoad()
		{
			Trace.WriteLine("Initializing interface api . . .");
			Trace.Indent();
			Stopwatch stopwatch = Stopwatch.StartNew();
			Interface.Initialize();
			stopwatch.Stop();
			Trace.WriteLine($"Done! ({stopwatch.Elapsed.TotalMilliseconds:0.00} ms)");
			Trace.Unindent();
		}

		public void OnMapLoad() { }

		public void OnMapEnd() { }

		public void OnProgramExit() { }
	}
}
