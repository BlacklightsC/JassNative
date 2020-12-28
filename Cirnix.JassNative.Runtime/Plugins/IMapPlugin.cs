namespace Cirnix.JassNative.Runtime.Plugin
{
    public interface IMapPlugin
    {
        void OnMapStart();

        void OnEngineStart();

        void OnEngineEnd();

        void OnMapEnd();
    }
}
