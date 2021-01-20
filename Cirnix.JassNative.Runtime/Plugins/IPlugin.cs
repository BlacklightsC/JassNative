namespace Cirnix.JassNative.Runtime.Plugin
{
    public interface IPlugin : IMapPlugin
    {
        /// <summary>워크래프트가 초기화 되기 전 이벤트</summary>
        void Initialize();

        /// <summary>Game.dll이 로드 된 직후 이벤트</summary>
        void OnGameLoad();
    }
}
