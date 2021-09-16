using Cirnix.JassNative.Runtime.Windows;
using EasyHook;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;

namespace Cirnix.JassNative.Runtime.Utilities
{
    public static class Memory
    {
        private static List<LocalHook> hooks = new List<LocalHook>();

        public static T Read<T>(IntPtr address) where T : struct
        {
            return (T)Marshal.PtrToStructure(address, typeof(T));
        }

        public static T Read<T>(IntPtr address, int offset) where T : struct
        {
            return (T)Marshal.PtrToStructure(address + offset, typeof(T));
        }

        public static string ReadString(IntPtr address)
        {
            if (address == IntPtr.Zero) return null;
            int len = 0;
            try
            {
                while (Marshal.ReadByte(address, len) != 0) ++len;
            }
            catch { }
            if (len == 0) return string.Empty;
            byte[] buffer = new byte[len];
            Marshal.Copy(address, buffer, 0, buffer.Length);
            return Encoding.UTF8.GetString(buffer);
        }

        public static string ReadString(IntPtr address, int length)
        {
            if (address == IntPtr.Zero) return null;
            int len = 0;
            try
            {
                while (Marshal.ReadByte(address, len) != 0 && len != length) ++len;
            }
            catch { }
            if (len == 0) return string.Empty;
            byte[] buffer = new byte[len];
            Marshal.Copy(address, buffer, 0, buffer.Length);
            return Encoding.UTF8.GetString(buffer);
        }

        public static void Write<T>(IntPtr address, T data) where T : struct
        {
            Marshal.StructureToPtr(data, address, true);
        }

        public static void Write<T>(IntPtr address, int offset, T data) where T : struct
        {
            Marshal.StructureToPtr(data, address + offset, true);
        }

        public static void WriteString(IntPtr address, string data)
        {
            try
            {
                int length = Encoding.UTF8.GetByteCount(data);
                Marshal.Copy(Encoding.UTF8.GetBytes(data), 0, address, length);
                Marshal.WriteByte(address + length, 0x00); // null terminate
            }
            catch { }
        }

        public static T InstallHook<T>(IntPtr address, T newFunc, bool inclusive, bool exclusive) where T : class
        {
            if (!typeof(Delegate).IsAssignableFrom(typeof(T)))
                throw new InvalidOperationException("Generic T is not a delegate type");

            Delegate oldFunc = Marshal.GetDelegateForFunctionPointer(address, typeof(T));

            Trace.Write($"{(newFunc as Delegate).Method.Name}: 0x{(int)address:X8} . ");
            LocalHook hook = LocalHook.Create(address, newFunc as Delegate, null);
            Trace.WriteLine("hook installed!");
            if (inclusive) hook.ThreadACL.SetInclusiveACL(new[] { 0 });
            if (exclusive) hook.ThreadACL.SetExclusiveACL(new[] { 0 });

            // Unreferences hooks gets cleaned up, so we prevent that by keeping them referenced.
            hooks.Add(hook);

            return (T)(object)oldFunc;
        }

        public static string PtrAsString(IntPtr address)
        {
            return ReadString(address);
        }

        public static IntPtr StringAsPtr(string data)
        {
            if (data == null) data = string.Empty;
            byte[] buffer = new byte[Encoding.UTF8.GetByteCount(data) + 1];
            Encoding.UTF8.GetBytes(data, 0, data.Length, buffer, 0);
            IntPtr address = Marshal.AllocHGlobal(buffer.Length);
            Marshal.Copy(buffer, 0, address, buffer.Length);
            return address;
        }

        public static IntPtr Alloc(int size)
        {
            return Alloc(size, MemoryProtection.ReadWrite);
        }

        public static IntPtr Alloc(int size, MemoryProtection protection)
        {
            return Alloc(size, protection, AllocationType.Commit);
        }

        public static IntPtr Alloc(int size, MemoryProtection protection, AllocationType allocationType)
        {
            return Alloc(IntPtr.Zero, size, protection, allocationType);
        }

        public static IntPtr Alloc(IntPtr address, int size)
        {
            return Alloc(address, size, MemoryProtection.ReadWrite);
        }

        public static IntPtr Alloc(IntPtr address, int size, MemoryProtection protection)
        {
            return Alloc(address, size, protection, AllocationType.Commit);
        }

        public static IntPtr Alloc(IntPtr address, int size, MemoryProtection protection, AllocationType allocationType)
        {
            return Kernel32.VirtualAlloc(address, size, allocationType, protection);
        }

        public static void Free(IntPtr address)
        {
            Kernel32.VirtualFree(address, 0, MemoryFreeType.Release);
        }

        public static void Copy(IntPtr source, IntPtr destination, int size)
        {
            Kernel32.CopyMemory(destination, source, size);
        }

        public unsafe static byte[] ForceRead(IntPtr offset, int size)
        {
            if (Kernel32.VirtualProtect(offset, size, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    byte[] lpBuffer = new byte[size];
                    Marshal.Copy(offset, lpBuffer, 0, size);
                    return lpBuffer;
                }
                catch { }
                finally
                {
                    Kernel32.VirtualProtect(offset, size, lpflOldProtect, out _);
                }
            }
            return null;
        }

        public unsafe static int ForceReadInt(IntPtr offset)
        {
            if (Kernel32.VirtualProtect(offset, 4, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    return *(int*)offset;
                }
                catch { }
                finally
                {
                    Kernel32.VirtualProtect(offset, 4, lpflOldProtect, out _);
                }
            }
            return 0;
        }

        public unsafe static float ForceReadFloat(IntPtr offset)
        {
            if (Kernel32.VirtualProtect(offset, 4, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    return *(float*)offset;
                }
                catch { }
                finally
                {
                    Kernel32.VirtualProtect(offset, 4, lpflOldProtect, out _);
                }
            }
            return 0;
        }

        public static void Patch(IntPtr offset, params byte[] buffer)
        {
            if (Kernel32.VirtualProtect(offset, buffer.Length, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    Marshal.Copy(buffer, 0, offset, buffer.Length);
                }
                catch { }
                Kernel32.VirtualProtect(offset, buffer.Length, lpflOldProtect, out _);
            }
        }

        public unsafe static void Patch(IntPtr offset, int value)
        {
            if (Kernel32.VirtualProtect(offset, 4, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    *(int*)offset = value;
                }
                catch { }
                Kernel32.VirtualProtect(offset, 4, lpflOldProtect, out _);
            }
        }

        public unsafe static void Patch(IntPtr offset, float value)
        {
            if (Kernel32.VirtualProtect(offset, 4, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    *(float*)offset = value;
                }
                catch { }
                Kernel32.VirtualProtect(offset, 4, lpflOldProtect, out _);
            }
        }

        public unsafe static IntPtr FollowPointer(IntPtr offset, int signature)
        {
            offset = FollowPointer(offset);
            int* pointer = (int*)offset;
            while (Kernel32.VirtualProtect(offset, 8, 0x40, out uint lpflOldProtect))
            {
                if (pointer[1] == signature)
                {
                    Kernel32.VirtualProtect(offset, 8, lpflOldProtect, out _);
                    return offset;
                }
                pointer = (int*)*pointer;
                Kernel32.VirtualProtect(offset, 8, lpflOldProtect, out _);
                offset = new IntPtr(pointer);
            }
            return IntPtr.Zero;
        }

        public static IntPtr FollowPointer(IntPtr offset)
        {
            if (Kernel32.VirtualProtect(offset, 4, 0x40, out uint lpflOldProtect))
            {
                try
                {
                    return Marshal.ReadIntPtr(offset);
                }
                catch { }
                finally
                {
                    Kernel32.VirtualProtect(offset, 4, lpflOldProtect, out _);
                }
            }
            return IntPtr.Zero;
        }
    }
}
