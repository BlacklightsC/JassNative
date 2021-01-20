using Cirnix.JassNative.InterfaceAPI;
using Cirnix.JassNative.JassAPI;
using Cirnix.JassNative.Runtime;
using Cirnix.JassNative.Runtime.Plugin;
using Cirnix.JassNative.WarAPI;

namespace Cirnix.JassNative.JassDebugger
{
    [Requires(typeof(InterfaceAPIPlugin))]
	[Requires(typeof(JassAPIPlugin))]
	[Requires(typeof(WarAPIPlugin))]
	public class JassDebuggerPlugin : IPlugin
	{
		public void Initialize() { }

		public void OnGameLoad()
		{
			if (PluginSystem.IsDebugging)
				JassDebugger.OnGameLoad();
		}

		public void OnMapLoad() { }

		public void OnMapEnd() { }

		public void OnProgramExit() { }
	}
}
