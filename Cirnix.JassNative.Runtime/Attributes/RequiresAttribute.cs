using System;

namespace Cirnix.JassNative.Runtime.Plugin
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = true)]
    public sealed class RequiresAttribute : Attribute
    {
        public Type Type { get; }

        public RequiresAttribute(Type type)
        {
            Type = type;
        }
    }
}
