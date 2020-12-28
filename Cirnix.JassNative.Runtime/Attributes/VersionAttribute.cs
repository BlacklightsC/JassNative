using System;

namespace Cirnix.JassNative.Runtime.Plugin
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = true)]
    public sealed class VersionAttribute : Attribute
    {
        private readonly string version;
        public Version Version => new Version(version);

        public VersionAttribute(string version)
        {
            this.version = version;
        }

    }
}
