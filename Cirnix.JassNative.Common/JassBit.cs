using System;

using Cirnix.JassNative.JassAPI;

namespace Cirnix.JassNative.Common
{
    internal static class JassBit
    {
        private delegate JassInteger BitPrototype(JassInteger x, JassInteger y);
        private static JassInteger BitOr(JassInteger x, JassInteger y) => x | y;
        private static JassInteger BitAnd(JassInteger x, JassInteger y) => x & y;
        private static JassInteger BitXor(JassInteger x, JassInteger y) => x ^ y;
        private static JassInteger BitShiftL(JassInteger x, JassInteger y) => x << y;
        private static JassInteger BitShiftR(JassInteger x, JassInteger y) => x >> y;


        private delegate JassRealRet I2RPrototype(JassInteger i);
        private static JassRealRet I2R(JassInteger i) => BitConverter.ToSingle(BitConverter.GetBytes(i), 0);

        private delegate JassInteger R2IPrototype(JassRealArg r);
        private static JassInteger R2I(JassRealArg r) => BitConverter.ToInt32(BitConverter.GetBytes(r), 0);

        internal static void Initialize()
        {
            Natives.Add(new BitPrototype(BitOr), false);
            Natives.Add(new BitPrototype(BitAnd), false);
            Natives.Add(new BitPrototype(BitXor), false);
            Natives.Add(new BitPrototype(BitShiftL), false);
            Natives.Add(new BitPrototype(BitShiftR), false);
            Natives.Add(new I2RPrototype(I2R));
            Natives.Add(new R2IPrototype(R2I));
        }
    }
}
