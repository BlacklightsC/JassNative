namespace Cirnix.JassNative.Runtime.Plugin
{
    public interface IPlugin : IMapPlugin
    {
        void Initialize();

        void OnGameLoad();
    }
}
