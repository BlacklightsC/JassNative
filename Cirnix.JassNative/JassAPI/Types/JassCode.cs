using System;

namespace Cirnix.JassNative.JassAPI
{
    [JassType("C")]
    [Serializable]
    public struct JassCode
    {
        // 하단 오프셋의 배열 인덱스를 저장함 (CE)
        // [[[[[Game.dll+D0DEF8]+14]+90]+4]+2888]+8
        public readonly IntPtr Handle;

        public JassCode(IntPtr handle)
        {
            this.Handle = handle;
        }

        public override string ToString()
        {
            return this.Handle.ToString();
        }

        public string ToString(string format)
        {
            return this.Handle.ToString(format);
        }
    }
}