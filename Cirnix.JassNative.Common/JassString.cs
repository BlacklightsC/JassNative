using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

using Cirnix.JassNative.JassAPI;

namespace Cirnix.JassNative.Common
{
    internal static class JassString
    {
        private delegate JassInteger StringSSI(JassStringArg s_1, JassStringArg s_2);
        private delegate JassStringRet StringSS(JassStringArg s);
        private delegate JassStringRet StringSSS(JassStringArg s_1, JassStringArg s_2);
        private delegate JassStringRet StringSSIS(JassStringArg s_1, JassStringArg s_2, JassInteger i);

        private static JassInteger StringPos(JassStringArg str, JassStringArg sub) => str.ToString()?.IndexOf(sub);

        private static JassStringRet StringReverse(JassStringArg str)
        {
            char[] arr = (str.ToString() ?? string.Empty).ToCharArray();
            Array.Reverse(arr);
            return new string(arr);
        }

        private static JassStringRet StringTrim(JassStringArg str) => str.ToString()?.Trim();
        private static JassStringRet StringTrimStart(JassStringArg str) => str.ToString()?.TrimStart();
        private static JassStringRet StringTrimEnd(JassStringArg str) => str.ToString()?.TrimEnd();

        private static JassStringRet StringRegex(JassStringArg str, JassStringArg regex, JassInteger index)
        {
            string Str = str.ToString(), Reg = regex.ToString();
            if (Str == null || Reg == null) return string.Empty;
            MatchCollection matches = Regex.Matches(Str, Reg);
            return 0 <= index && index < matches.Count ? matches[index].Value : string.Empty;
        }

        private static JassInteger StringCount(JassStringArg str, JassStringArg sub)
        {
            string Str = str.ToString(), Sub = sub.ToString();
            if (Str == null || Sub == null) return 0;
            return Regex.Matches(Str, Sub).Count;
        }

        private delegate JassBoolean StringContainsPrototype(JassStringArg str, JassStringArg sub);
        private static JassBoolean StringContains(JassStringArg str, JassStringArg sub)
        {
            string Str = str.ToString(), Sub = sub.ToString();
            if (Str == null || Sub == null) return false;
            return Str.Contains(Sub);
        }

        private static JassStringRet StringSplit(JassStringArg str, JassStringArg sub, JassInteger index)
        {
            string Str = str.ToString();
            if (string.IsNullOrEmpty(Str)) return string.Empty;
            string[] array = Str.Split(new string[] { sub }, StringSplitOptions.None);
            return 0 <= index && index < array.Length ? array[index] : string.Empty;
        }

        private delegate JassStringRet StringReplacePrototype(JassStringArg str, JassStringArg old, JassStringArg newstr);
        private static JassStringRet StringReplace(JassStringArg str, JassStringArg old, JassStringArg newstr)
        {
            return str.ToString()?.Replace(old.ToString() ?? string.Empty, newstr.ToString() ?? string.Empty) ?? string.Empty;
        }

        private delegate JassStringRet StringInsertPrototype(JassStringArg str, JassInteger index, JassStringArg val);
        private static JassStringRet StringInsert(JassStringArg str, JassInteger index, JassStringArg val)
        {
            int idx = index >= 0 ? (int)index : 0;
            return (str.ToString() ?? string.Empty).PadRight(idx).Insert(idx, val.ToString() ?? string.Empty);
        }

        private delegate JassStringRet StringSubPrototype(JassStringArg str, JassInteger start, JassInteger length);
        private static JassStringRet StringSub(JassStringArg str, JassInteger start, JassInteger length)
        {
            string Str = str.ToString();
            int Start = start, Length = length;
            if (Str == null || Start >= Str.Length || Length == 0) return string.Empty;
            if (Start < 0)
            {
                Length += Start;
                Start = 0;
            }
            if (Length < 0 || Start + Length > Str.Length) return Str.Substring(Start);
            else return Str.Substring(Start, Length);
        }

        private delegate JassInteger StringLengthPrototype(JassStringArg str);
        private static JassInteger StringLength(JassStringArg str) => str.ToString()?.Length ?? 0;

        private delegate JassInteger StringCalcLinesPrototype(JassStringArg str, JassInteger length);
        private static JassInteger StringCalcLines(JassStringArg str, JassInteger length)
        {
            string Str = str.ToString();
            int Length = length;
            if (Str == null || Length <= 0) return 0;
            string[] items = Str.TrimEnd().Split(' ');
            int ret = 1, lastLen = 0, curLen = 0;
            for (int i = 0; i < items.Length; i++)
            {
                string item = items[i].TrimEnd(' ');
                if (lastLen > 0 && item.Length == 0)
                {
                    lastLen++;
                    continue;
                }
                for (int j = 0; j < item.Length; j++)
                {
                    char c = item[j];
                    if (c < 0x100)
                    {
                        switch (c)
                        {
                            case '|':
                                if (j + 1 == item.Length) break;
                                switch (item[j + 1])
                                {
                                    case 'C':
                                    case 'c':
                                        int idx = 0;
                                        while (idx < 8)
                                        {
                                            if (item.Length <= j + 2 + idx) goto SwitchBreak;
                                            char h = item[j + 2 + idx];
                                            if (!('0' <= h && h <= '9' || 'A' <= h && h <= 'F' || 'a' <= h && h <= 'f'))
                                                goto SwitchBreak;
                                            idx++;
                                        }
                                        j += 9;
                                        continue;
                                    case 'R':
                                    case 'r':
                                        j++;
                                        continue;
                                    case 'N':
                                    case 'n':
                                        j++;
                                        lastLen = 0;
                                        curLen = 0;
                                        ret++;
                                        if (j + 1 == item.Length)
                                            curLen++;
                                        continue;
                                }
                                break;
                            case '\r': continue;
                            case '\n':
                                lastLen = 0;
                                curLen = 0;
                                ret++;
                                if (j + 1 == item.Length)
                                    curLen++;
                                continue;
                        }
                        SwitchBreak:
                        curLen++;
                    }
                    else
                    {
                        curLen += 2;
                    }

                    if (curLen >= Length)
                    {
                        curLen = 0;
                        ret++;
                    }
                    else if (lastLen > 0 && curLen + lastLen + 1 >= Length)
                    {
                        lastLen = 0;
                        ret++;
                    }
                }
                lastLen += ++curLen;
                curLen = 0;
            }
            return ret;
        }


        private static Dictionary<string, Aes> AesCache = new Dictionary<string, Aes>();
        private static Aes GetAes(string key)
        {
            if (AesCache.ContainsKey(key)) return AesCache[key];
            Aes aes = Aes.Create();
            using (Rfc2898DeriveBytes derive = new Rfc2898DeriveBytes(key, Encoding.UTF8.GetBytes(key.PadRight(8, '@'))))
            {
                aes.Key = derive.GetBytes(32);
                aes.IV = derive.GetBytes(16);
            }
            AesCache[key] = aes;
            return aes;
        }
        private static JassStringRet StringEncrypt(JassStringArg plainText, JassStringArg key)
        {
            try
            {
                using (MemoryStream ms = new MemoryStream())
                using (CryptoStream cs = new CryptoStream(ms, GetAes(key).CreateEncryptor(), CryptoStreamMode.Write))
                {
                    byte[] buffer = Encoding.UTF8.GetBytes(plainText);
                    cs.Write(buffer, 0, buffer.Length);
                    cs.FlushFinalBlock();
                    return Convert.ToBase64String(ms.ToArray());
                }
            }
            catch
            {
                return null;
            }
        }
        private static JassStringRet StringDecrypt(JassStringArg cipherText, JassStringArg key)
        {
            try
            {
                using (MemoryStream ms = new MemoryStream(Convert.FromBase64String(cipherText)))
                using (CryptoStream cs = new CryptoStream(ms, GetAes(key).CreateDecryptor(), CryptoStreamMode.Read))
                using (StreamReader sr = new StreamReader(cs))
                {
                    return sr.ReadToEnd();
                }
            }
            catch
            {
                return null;
            }
        }

        private static JassStringRet StringFromBase64(JassStringArg str)
        {
            try
            {
                return Encoding.UTF8.GetString(Convert.FromBase64String(str));
            }
            catch
            {
                return null;
            }
        }
        private static JassStringRet StringToBase64(JassStringArg str)
        {
            try
            {
                return Convert.ToBase64String(Encoding.UTF8.GetBytes(str));
            }
            catch
            {
                return null;
            }
        }

        internal static void Initialize()
        {
            Natives.Add(new StringSSI(StringPos));
            Natives.Add(new StringInsertPrototype(StringInsert));
            Natives.Add(new StringSS(StringTrim));
            Natives.Add(new StringSS(StringTrimStart));
            Natives.Add(new StringSS(StringTrimEnd));
            Natives.Add(new StringSSIS(StringSplit));
            Natives.Add(new StringReplacePrototype(StringReplace));
            Natives.Add(new StringSS(StringReverse));
            Natives.Add(new StringContainsPrototype(StringContains));
            Natives.Add(new StringSSI(StringCount));
            Natives.Add(new StringSSIS(StringRegex));
            Natives.Add(new StringSubPrototype(StringSub));
            Natives.Add(new StringLengthPrototype(StringLength));
            Natives.Add(new StringCalcLinesPrototype(StringCalcLines));
            Natives.Add(new StringSS(StringFromBase64));
            Natives.Add(new StringSS(StringToBase64));
            Natives.Add(new StringSSS(StringEncrypt));
            Natives.Add(new StringSSS(StringDecrypt));
        }
        internal static void OnMapEnd()
        {
            foreach (var item in AesCache)
                item.Value.Dispose();
            AesCache.Clear();
        }
    }
}
