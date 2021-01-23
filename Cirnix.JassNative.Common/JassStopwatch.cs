using System.Collections.Generic;
using System.Diagnostics;

using Cirnix.JassNative.JassAPI;

namespace Cirnix.JassNative.Common
{
    internal static class JassStopwatch
    {
        private static int SwId = 0;
        private static readonly Dictionary<int, Stopwatch> list = new Dictionary<int, Stopwatch>();

        private delegate JassInteger StopwatchCreatePrototype();
        private static JassInteger StopwatchCreate()
        {
            list[++SwId] = new Stopwatch();
            return SwId;
        }
        private delegate void StopwatchIVPrototype(JassInteger id);
        private static void StopwatchStart(JassInteger id)
        {
            if (list.ContainsKey(id))
                list[id].Start();
        }
        private static void StopwatchPause(JassInteger id)
        {
            if (list.ContainsKey(id))
                list[id].Stop();
        }
        private static void StopwatchReset(JassInteger id)
        {
            if (list.ContainsKey(id))
                list[id].Reset();
        }
        private static void StopwatchDestroy(JassInteger id)
            => list.Remove(id);

        private delegate JassInteger StopwatchElapsedPrototype(JassInteger id);
        private static JassInteger StopwatchElapsedMS(JassInteger id)
            => list.ContainsKey(id) ? list[id].ElapsedMilliseconds : 0;
        private static JassInteger StopwatchElapsedSecond(JassInteger id)
            => list.ContainsKey(id) ? list[id].Elapsed.Seconds : 0;
        private static JassInteger StopwatchElapsedMinute(JassInteger id)
            => list.ContainsKey(id) ? list[id].Elapsed.Minutes : 0;
        private static JassInteger StopwatchElapsedHour(JassInteger id)
            => list.ContainsKey(id) ? list[id]?.Elapsed.Hours : 0;

        private delegate JassRealRet StopwatchElapsedTickPrototype(JassInteger id);
        private static JassRealRet StopwatchTick(JassInteger id)
            => list.ContainsKey(id) ? (float)list[id]?.ElapsedTicks : 0f;

        internal static void Initialize()
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

        internal static void OnMapEnd()
        {
            SwId = 0;
            list.Clear();
        }
    }
}
