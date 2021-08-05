library JNMemory
static if not REFORGED_MODE then
    globals
        constant hashtable JNProc_ht = InitHashtable()
        constant integer JNProc_key = StringHash("jass")

        constant integer JNProc__cdecl = 1
        constant integer JNProc__stdcall = 2
        constant integer JNProc__fastcall = 3
        constant integer JNProc__thiscall = 4
    endglobals

    native JNGetModuleHandle takes string moduleName returns integer
    native JNFindModuleHandle takes integer offset, integer signature returns integer
    native JNMemoryGetByte takes integer offset returns integer
    native JNMemorySetByte takes integer offset, integer value returns nothing
    native JNMemoryGetInteger takes integer offset returns integer
    native JNMemorySetInteger takes integer offset, integer value returns nothing
    native JNMemoryGetReal takes integer offset returns real
    native JNMemorySetReal takes integer offset, real value returns nothing
    native JNMemoryGetString takes integer offset, integer length returns string
    native JNMemorySetString takes integer offset, string value returns nothing
    native JNProcCall takes integer callConv, integer address, hashtable params returns boolean
endif
endlibrary