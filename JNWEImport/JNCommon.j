library JNCommon
static if REFORGED_MODE then
    native BlzBitOr takes integer x, integer y returns integer
    native BlzBitAnd takes integer x, integer y returns integer
    native BlzBitXor takes integer x, integer y returns integer
else
    native BitOr takes integer x, integer y returns integer
    native BitAnd takes integer x, integer y returns integer
    native BitXor takes integer x, integer y returns integer
    native JNI2R takes integer i returns real
    native JNR2I takes real r returns integer
        
    native JNWriteLog takes string str returns nothing
    native JNWriteLogReal takes real r returns nothing
    native JNGetLocalDateTime takes nothing returns string
    native JNGetLocalUnixTime takes nothing returns integer
    native JNGetMaxAttackSpeed takes nothing returns real
    native JNSetMaxAttackSpeed takes real speed returns nothing
    native IsReplayMode takes nothing returns boolean
    native IsHostPlayer takes nothing returns boolean 
    native JNGetSyncDelay takes nothing returns integer
    native JNSetSyncDelay takes integer delay returns nothing
    native JNGetConnectionState takes nothing returns integer
    
    native JNProcessStart takes string fileName, string arguments returns boolean
endif

function JNBitOr takes integer x, integer y returns integer
static if REFORGED_MODE then
    return BlzBitOr(x, y)
else
    return BitOr(x, y)
endif
endfunction

function JNBitAnd takes integer x, integer y returns integer
static if REFORGED_MODE then
    return BlzBitAnd(x, y)
else
    return BitAnd(x, y)
endif
endfunction

function JNBitXor takes integer x, integer y returns integer
static if REFORGED_MODE then
    return BlzBitXor(x, y)
else
    return BitXor(x, y)
endif
endfunction
endlibrary