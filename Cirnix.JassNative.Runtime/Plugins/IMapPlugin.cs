namespace Cirnix.JassNative.Runtime.Plugin
{
    public interface IMapPlugin
    {
        /// <summary>맵이 로드될 경우 이벤트 (다운로드가 완료되어야 함)</summary>
        void OnMapLoad();

        /// <summary>맵에서 나올 경우 이벤트 (점수창 까지 나와야 함)</summary>
        void OnMapEnd();

        /// <summary>게임 내에서 프로그램이 종료될 경우 이벤트 (인게임의 프로그램 종료 여야함)</summary>
        void OnProgramExit();
    }
}
