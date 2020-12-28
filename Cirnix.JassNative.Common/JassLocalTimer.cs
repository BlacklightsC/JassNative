using System.Collections.Generic;
using System.Timers;

using Cirnix.JassNative.JassAPI;
using Cirnix.JassNative.Runtime.Plugin;

namespace Cirnix.JassNative.Common
{
    [Requires(typeof(JassAPIPlugin))]
    public sealed class JassLocalTimer : IPlugin
    {
        internal sealed class LocalTimer : Timer { internal string Callback = null; }

        private int timerId = 0;
        private Dictionary<int, LocalTimer> list = new Dictionary<int, LocalTimer>();

        private delegate JassInteger LocalTimerVIPrototype();
        private delegate void LocalTimerIVPrototype(JassInteger whichTimer);
        private delegate void LocalTimerStartPrototype(JassInteger whichTimer, JassRealArg timeout, JassBoolean periodic, JassStringArg func);
        private JassInteger CreateLocalTimer()
        {
            list[++timerId] = new LocalTimer();
            return timerId;
        }
        private void DestroyLocalTimer(JassInteger whichTimer)
        {
            if (list.ContainsKey(whichTimer))
            {
                list[whichTimer].Close();
                list.Remove(whichTimer);
            }
        }
        private void LocalTimerCallback(object sender, ElapsedEventArgs e)
        {
            Script.ExecuteFunc(((LocalTimer)sender).Callback);
        }
        private void LocalTimerStart(JassInteger whichTimer, JassRealArg timeout, JassBoolean periodic, JassStringArg func)
        {
            if (list.ContainsKey(whichTimer))
            {
                LocalTimer t = list[whichTimer];
                t.Stop();
                t.Interval = timeout;
                t.AutoReset = periodic;
                t.Callback = func;
                if (string.IsNullOrEmpty(t.Callback))
                    t.Elapsed -= LocalTimerCallback;
                else
                    t.Elapsed += LocalTimerCallback;
                t.Start();
            }
        }
        private void LocalTimerStop(JassInteger whichTimer)
        {
            if (list.ContainsKey(whichTimer))
                list[whichTimer].Stop();
        }

        public void Initialize()
        {
            Natives.Add(new LocalTimerVIPrototype(CreateLocalTimer));
            Natives.Add(new LocalTimerIVPrototype(DestroyLocalTimer));
            Natives.Add(new LocalTimerStartPrototype(LocalTimerStart));
            Natives.Add(new LocalTimerIVPrototype(LocalTimerStop));
        }
        public void OnGameLoad() { }

        public void OnMapStart()
        {
            timerId = 0;
            foreach (var item in list)
                item.Value.Close();
            list.Clear();
        }

        public void OnEngineStart() { }

        public void OnEngineEnd() { }

        public void OnMapEnd()
        {
            timerId = 0;
            foreach (var item in list)
                item.Value.Close();
            list.Clear();
        }
    }
}
