using System;

namespace Cirnix.JassNative.Runtime.Plugin
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = true)]
    public sealed class DescriptionAttribute : Attribute
    {
        public string Text { get; }

        public DescriptionAttribute(string text)
        {
            this.Text = text;
        }

    }
}
