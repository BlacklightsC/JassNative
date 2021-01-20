using System.Collections.Generic;
using System.Diagnostics;

using Cirnix.JassNative.JassAPI;
using Cirnix.JassNative.Runtime.Plugin;

namespace Cirnix.JassNative.Common
{
    public sealed class JassStopwatch : IPlugin
    {
        private int SwId = 0;
        private Dictionary<int, Stopwatch> list = new Dictionary<int, Stopwatch>();

        private delegate JassInteger StopwatchCreatePrototype();
        private JassInteger StopwatchCreate()
        {
            list[++SwId] = new Stopwatch();
            return SwId;
        }
        private delegate void StopwatchIVPrototype(JassInteger id);
        private void StopwatchStart(JassInteger id)
        {
            if (list.ContainsKey(id))
                list[id].Start();
        }
        private void StopwatchPause(JassInteger id)
        {
            if (list.ContainsKey(id))
                list[id].Stop();
        }
        private void StopwatchReset(JassInteger id)
        {
            if (list.ContainsKey(id))
                list[id].Reset();
        }
        private void StopwatchDestroy(JassInteger id)
        {
            list.Remove(id);
        }

        private delegate JassInteger StopwatchElapsedPrototype(JassInteger id);
        private JassInteger StopwatchElapsedMS(JassInteger id)
        {
            return list.ContainsKey(id) ? list[id].ElapsedMilliseconds : 0;
        }
        private JassInteger StopwatchElapsedSecond(JassInteger id)
        {
            return list.ContainsKey(id) ? list[id].Elapsed.Seconds : 0;
        }
        private JassInteger StopwatchElapsedMinute(JassInteger id)
        {
            return list.ContainsKey(id) ? list[id].Elapsed.Minutes : 0;
        }
        private JassInteger StopwatchElapsedHour(JassInteger id)
        {
            return list.ContainsKey(id) ? list[id]?.Elapsed.Hours : 0;
        }

        private delegate JassRealRet StopwatchElapsedTickPrototype(JassInteger id);
        private JassRealRet StopwatchTick(JassInteger id)
        {
            return list.ContainsKey(id) ? (float)list[id]?.ElapsedTicks : 0f;
        }

        public void Initialize()
        {
            Natives.Add(new StopwatchCreatePrototype(StopwatchCreate));
            Natives.Add(new StopwatchIVPrototype(StopwatchStart));
            Natives.Add(new StopwatchIVPrototype(StopwatchPause));
            Natives.Add(new StopwatchIVPrototype(StopwatchReset));
            Natives.Add(new StopwatchIVPrototype(StopwatchDestroy));
            Natives.Add(new StopwatchElapsedPrototype(StopwatchElapsedMS));
            Natives.Add(new StopwatchElapsedPrototype(StopwatchElapsedSecond));
            Natives.Add(new StopwatchElapsedPrototype(StopwatchElapsedMinute));
            Natives.Add(new StopwatchElapsedPrototype(StopwatchElapsedHour));
            Natives.Add(new StopwatchElapsedTickPrototype(StopwatchTick));
        }

        public void OnGameLoad() { }

        public void OnMapLoad()
        {
            SwId = 0;
            list.Clear();
        }

        public void OnMapEnd()
        {
            SwId = 0;
            list.Clear();
        }

        public void OnProgramExit() { }
    }
}
