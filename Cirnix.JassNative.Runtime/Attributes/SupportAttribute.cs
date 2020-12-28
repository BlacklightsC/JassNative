using System;

namespace Cirnix.JassNative.Runtime.Plugin
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = true)]
    public sealed class SupportAttribute : Attribute
    {
        private readonly string version;
        public Version Version => new Version(version);

        public SupportRange State { get; }

        public bool IsSupported { get; }

        public bool IsTested { get; }

        public SupportAttribute(string version, SupportRange range, bool isSupported, bool isTested)
        {
            this.version = version;
            this.State = range;
            this.IsSupported = isSupported;
            this.IsTested = isTested;
        }
    }

    [Flags]
    public enum SupportRange : byte
    {
        None = 0x00,

        Below = 1 << 1,
        Current = 1 << 2,
        Above = 1 << 3,
    }
}
