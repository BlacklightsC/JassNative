using System;

namespace Cirnix.JassNative.Runtime.Plugin
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = true)]
    public sealed class AuthorAttribute : Attribute
    {
        public string Name { get; }

        public AuthorAttribute(string name)
        {
            this.Name = name;
        }
    }
}
