using Cirnix.JassNative.Runtime.Plugin;

namespace Cirnix.JassNative.Common
{
    public sealed class Main : IPlugin
    {
        public void Initialize()
        {
            JassBit.Initialize();
            JassMemory.Initialize();
            JassMiscellaneous.Initialize();
            JassStopwatch.Initialize();
            JassString.Initialize();
        }

        public void OnGameLoad()
        {
            JassMiscellaneous.OnGameLoad();
        }

        public void OnMapLoad() { }

        public void OnMapEnd()
        {
            JassMiscellaneous.OnMapEnd();
            JassStopwatch.OnMapEnd();
            JassString.OnMapEnd();
        }

        public void OnProgramExit() { }
    }
}
