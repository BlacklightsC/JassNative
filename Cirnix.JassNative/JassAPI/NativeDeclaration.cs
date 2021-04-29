using System;

using Cirnix.JassNative.Runtime.Utilities;

namespace Cirnix.JassNative.JassAPI
{
    public class NativeDeclaration
    {
        internal readonly IntPtr FunctionPtr;
        public readonly Delegate Function;
        public readonly string Name;
        public readonly string Prototype;

        public NativeDeclaration(IntPtr address)
        {
            Prototype = Memory.ReadString(Memory.Read<IntPtr>(address, 1));
            Name = Memory.ReadString(Memory.Read<IntPtr>(address, 6));
            FunctionPtr = Memory.Read<IntPtr>(address, 11);
        }

        public NativeDeclaration(IntPtr function, string name, string prototype)
        {
            FunctionPtr = function;
            Name = name;
            Prototype = prototype;
        }

        public NativeDeclaration(Delegate function, string name, string prototype)
        {
            Function = function;
            FunctionPtr = Utility.FunctionAsPtr(function);
            Name = name;
            Prototype = prototype;
        }

        public T ToDelegate<T>() where T : class
        {
            return Utility.PtrAsFunction<T>(FunctionPtr);
        }
    }
}
