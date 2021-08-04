library DzAPISync
static if REFORGED_MODE then
    native BlzTriggerRegisterPlayerSyncEvent takes trigger whichTrigger, player whichPlayer, string prefix, boolean fromServer returns event
    native BlzSendSyncData takes string prefix, string data returns boolean
    native BlzGetTriggerSyncPrefix takes nothing returns string
    native BlzGetTriggerSyncData takes nothing returns string
else
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
endif

// prefix length maximum is 9
function JNTriggerRegisterSyncData takes trigger whichTrigger, string prefix, boolean fromServer returns nothing
static if REFORGED_MODE then
    local integer loopA = 0
    loop
        call BlzTriggerRegisterPlayerSyncEvent(whichTrigger, Player(loopA), prefix, fromServer)
        set loopA = loopA + 1
        exitwhen loopA == bj_MAX_PLAYERS
    endloop
else
    call DzTriggerRegisterSyncData(whichTrigger, prefix, fromServer)
endif
endfunction

// prefix length maximum is 9, data length maximum is 998
function JNSendSyncData takes string prefix, string data returns nothing
static if REFORGED_MODE then
    call BlzSendSyncData(prefix, data)
else
    call DzSyncData(prefix, data)
endif
endfunction

function JNGetTriggerSyncData takes nothing returns string
static if REFORGED_MODE then
    return BlzGetTriggerSyncData()
else
    return DzGetTriggerSyncData()
endif
endfunction

function JNGetTriggerSyncPlayer takes nothing returns player
static if REFORGED_MODE then
    return GetTriggerPlayer()
else
    return DzGetTriggerSyncPlayer()
endif
endfunction
endlibrary