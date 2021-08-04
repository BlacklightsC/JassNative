using System;
using System.Runtime.InteropServices;

namespace Cirnix.JassNative.WarAPI.Types
{
    [StructLayout(LayoutKind.Sequential, Size = 40)]
    public struct Variable
    {
        public int Hash;
        public unsafe HT_Bucket* Parent;
        public unsafe Variable* Next;
        public IntPtr field000C;
        public IntPtr field0010;
        public StringPtr Name;
        public JassType Type;
        public byte field0019;
        public short field001A;
        public JassType Type2;
        public byte field001D;
        public short field001E;
        public IntPtr Value;
        [MarshalAs(UnmanagedType.Bool)] public bool IsFunctionArgument;

        public unsafe IntPtr AsIntPtr()
        {
            fixed (Variable* variablePtr = &this)
                return new IntPtr(variablePtr);
        }
    }
}