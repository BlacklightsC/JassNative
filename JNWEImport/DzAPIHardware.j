library DzAPIHardware
globals
	//Check to Virtual-Key Codes (VK_)
	constant integer JN_MOUSE_BUTTON_TYPE_LEFT              = 1
	constant integer JN_MOUSE_BUTTON_TYPE_MIDDLE            = 2
	constant integer JN_MOUSE_BUTTON_TYPE_RIGHT             = 3

	constant integer JN_OSKEY_LBUTTON                       = $01
	constant integer JN_OSKEY_RBUTTON                       = $02
	constant integer JN_OSKEY_CANCEL                        = $03
	constant integer JN_OSKEY_MBUTTON                       = $04
	constant integer JN_OSKEY_XBUTTON1                      = $05
	constant integer JN_OSKEY_XBUTTON2                      = $06

	constant integer JN_OSKEY_BACKSPACE                     = $08
	constant integer JN_OSKEY_TAB                           = $09
	constant integer JN_OSKEY_CLEAR                         = $0C
	constant integer JN_OSKEY_RETURN                        = $0D
	constant integer JN_OSKEY_SHIFT                         = $10
	constant integer JN_OSKEY_CONTROL                       = $11
	constant integer JN_OSKEY_ALT                           = $12
	constant integer JN_OSKEY_PAUSE                         = $13
	constant integer JN_OSKEY_CAPSLOCK                      = $14
	constant integer JN_OSKEY_KANA                          = $15
	constant integer JN_OSKEY_HANGUL                        = $15
	constant integer JN_OSKEY_JUNJA                         = $17
	constant integer JN_OSKEY_FINAL                         = $18
	constant integer JN_OSKEY_HANJA                         = $19
	constant integer JN_OSKEY_KANJI                         = $19
	constant integer JN_OSKEY_ESCAPE                        = $1B
	constant integer JN_OSKEY_CONVERT                       = $1C
	constant integer JN_OSKEY_NONCONVERT                    = $1D
	constant integer JN_OSKEY_ACCEPT                        = $1E
	constant integer JN_OSKEY_MODECHANGE                    = $1F
	constant integer JN_OSKEY_SPACE                         = $20
	constant integer JN_OSKEY_PAGEUP                        = $21
	constant integer JN_OSKEY_PAGEDOWN                      = $22
	constant integer JN_OSKEY_END                           = $23
	constant integer JN_OSKEY_HOME                          = $24
	constant integer JN_OSKEY_LEFT                          = $25
	constant integer JN_OSKEY_UP                            = $26
	constant integer JN_OSKEY_RIGHT                         = $27
	constant integer JN_OSKEY_DOWN                          = $28
	constant integer JN_OSKEY_SELECT                        = $29
	constant integer JN_OSKEY_PRINT                         = $2A
	constant integer JN_OSKEY_EXECUTE                       = $2B
	constant integer JN_OSKEY_PRINTSCREEN                   = $2C
	constant integer JN_OSKEY_INSERT                        = $2D
	constant integer JN_OSKEY_DELETE                        = $2E
	constant integer JN_OSKEY_HELP                          = $2F
	constant integer JN_OSKEY_0                             = $30
	constant integer JN_OSKEY_1                             = $31
	constant integer JN_OSKEY_2                             = $32
	constant integer JN_OSKEY_3                             = $33
	constant integer JN_OSKEY_4                             = $34
	constant integer JN_OSKEY_5                             = $35
	constant integer JN_OSKEY_6                             = $36
	constant integer JN_OSKEY_7                             = $37
	constant integer JN_OSKEY_8                             = $38
	constant integer JN_OSKEY_9                             = $39
	constant integer JN_OSKEY_A                             = $41
	constant integer JN_OSKEY_B                             = $42
	constant integer JN_OSKEY_C                             = $43
	constant integer JN_OSKEY_D                             = $44
	constant integer JN_OSKEY_E                             = $45
	constant integer JN_OSKEY_F                             = $46
	constant integer JN_OSKEY_G                             = $47
	constant integer JN_OSKEY_H                             = $48
	constant integer JN_OSKEY_I                             = $49
	constant integer JN_OSKEY_J                             = $4A
	constant integer JN_OSKEY_K                             = $4B
	constant integer JN_OSKEY_L                             = $4C
	constant integer JN_OSKEY_M                             = $4D
	constant integer JN_OSKEY_N                             = $4E
	constant integer JN_OSKEY_O                             = $4F
	constant integer JN_OSKEY_P                             = $50
	constant integer JN_OSKEY_Q                             = $51
	constant integer JN_OSKEY_R                             = $52
	constant integer JN_OSKEY_S                             = $53
	constant integer JN_OSKEY_T                             = $54
	constant integer JN_OSKEY_U                             = $55
	constant integer JN_OSKEY_V                             = $56
	constant integer JN_OSKEY_W                             = $57
	constant integer JN_OSKEY_X                             = $58
	constant integer JN_OSKEY_Y                             = $59
	constant integer JN_OSKEY_Z                             = $5A
	constant integer JN_OSKEY_LMETA                         = $5B
	constant integer JN_OSKEY_RMETA                         = $5C
	constant integer JN_OSKEY_APPS                          = $5D
	constant integer JN_OSKEY_SLEEP                         = $5F
	constant integer JN_OSKEY_NUMPAD0                       = $60
	constant integer JN_OSKEY_NUMPAD1                       = $61
	constant integer JN_OSKEY_NUMPAD2                       = $62
	constant integer JN_OSKEY_NUMPAD3                       = $63
	constant integer JN_OSKEY_NUMPAD4                       = $64
	constant integer JN_OSKEY_NUMPAD5                       = $65
	constant integer JN_OSKEY_NUMPAD6                       = $66
	constant integer JN_OSKEY_NUMPAD7                       = $67
	constant integer JN_OSKEY_NUMPAD8                       = $68
	constant integer JN_OSKEY_NUMPAD9                       = $69
	constant integer JN_OSKEY_MULTIPLY                      = $6A
	constant integer JN_OSKEY_ADD                           = $6B
	constant integer JN_OSKEY_SEPARATOR                     = $6C
	constant integer JN_OSKEY_SUBTRACT                      = $6D
	constant integer JN_OSKEY_DECIMAL                       = $6E
	constant integer JN_OSKEY_DIVIDE                        = $6F
	constant integer JN_OSKEY_F1                            = $70
	constant integer JN_OSKEY_F2                            = $71
	constant integer JN_OSKEY_F3                            = $72
	constant integer JN_OSKEY_F4                            = $73
	constant integer JN_OSKEY_F5                            = $74
	constant integer JN_OSKEY_F6                            = $75
	constant integer JN_OSKEY_F7                            = $76
	constant integer JN_OSKEY_F8                            = $77
	constant integer JN_OSKEY_F9                            = $78
	constant integer JN_OSKEY_F10                           = $79
	constant integer JN_OSKEY_F11                           = $7A
	constant integer JN_OSKEY_F12                           = $7B
	constant integer JN_OSKEY_F13                           = $7C
	constant integer JN_OSKEY_F14                           = $7D
	constant integer JN_OSKEY_F15                           = $7E
	constant integer JN_OSKEY_F16                           = $7F
	constant integer JN_OSKEY_F17                           = $80
	constant integer JN_OSKEY_F18                           = $81
	constant integer JN_OSKEY_F19                           = $82
	constant integer JN_OSKEY_F20                           = $83
	constant integer JN_OSKEY_F21                           = $84
	constant integer JN_OSKEY_F22                           = $85
	constant integer JN_OSKEY_F23                           = $86
	constant integer JN_OSKEY_F24                           = $87
	constant integer JN_OSKEY_NUMLOCK                       = $90
	constant integer JN_OSKEY_SCROLLLOCK                    = $91
	constant integer JN_OSKEY_OEM_NEC_EQUAL                 = $92
	constant integer JN_OSKEY_OEM_FJ_JISHO                  = $92
	constant integer JN_OSKEY_OEM_FJ_MASSHOU                = $93
	constant integer JN_OSKEY_OEM_FJ_TOUROKU                = $94
	constant integer JN_OSKEY_OEM_FJ_LOYA                   = $95
	constant integer JN_OSKEY_OEM_FJ_ROYA                   = $96
	constant integer JN_OSKEY_LSHIFT                        = $A0
	constant integer JN_OSKEY_RSHIFT                        = $A1
	constant integer JN_OSKEY_LCONTROL                      = $A2
	constant integer JN_OSKEY_RCONTROL                      = $A3
	constant integer JN_OSKEY_LALT                          = $A4
	constant integer JN_OSKEY_RALT                          = $A5
	constant integer JN_OSKEY_BROWSER_BACK                  = $A6
	constant integer JN_OSKEY_BROWSER_FORWARD               = $A7
	constant integer JN_OSKEY_BROWSER_REFRESH               = $A8
	constant integer JN_OSKEY_BROWSER_STOP                  = $A9
	constant integer JN_OSKEY_BROWSER_SEARCH                = $AA
	constant integer JN_OSKEY_BROWSER_FAVORITES             = $AB
	constant integer JN_OSKEY_BROWSER_HOME                  = $AC
	constant integer JN_OSKEY_VOLUME_MUTE                   = $AD
	constant integer JN_OSKEY_VOLUME_DOWN                   = $AE
	constant integer JN_OSKEY_VOLUME_UP                     = $AF
	constant integer JN_OSKEY_MEDIA_NEXT_TRACK              = $B0
	constant integer JN_OSKEY_MEDIA_PREV_TRACK              = $B1
	constant integer JN_OSKEY_MEDIA_STOP                    = $B2
	constant integer JN_OSKEY_MEDIA_PLAY_PAUSE              = $B3
	constant integer JN_OSKEY_LAUNCH_MAIL                   = $B4
	constant integer JN_OSKEY_LAUNCH_MEDIA_SELECT           = $B5
	constant integer JN_OSKEY_LAUNCH_APP1                   = $B6
	constant integer JN_OSKEY_LAUNCH_APP2                   = $B7
	constant integer JN_OSKEY_OEM_1                         = $BA
	constant integer JN_OSKEY_OEM_PLUS                      = $BB
	constant integer JN_OSKEY_OEM_COMMA                     = $BC
	constant integer JN_OSKEY_OEM_MINUS                     = $BD
	constant integer JN_OSKEY_OEM_PERIOD                    = $BE
	constant integer JN_OSKEY_OEM_2                         = $BF
	constant integer JN_OSKEY_OEM_3                         = $C0
	constant integer JN_OSKEY_OEM_4                         = $DB
	constant integer JN_OSKEY_OEM_5                         = $DC
	constant integer JN_OSKEY_OEM_6                         = $DD
	constant integer JN_OSKEY_OEM_7                         = $DE
	constant integer JN_OSKEY_OEM_8                         = $DF
	constant integer JN_OSKEY_OEM_AX                        = $E1
	constant integer JN_OSKEY_OEM_102                       = $E2
	constant integer JN_OSKEY_ICO_HELP                      = $E3
	constant integer JN_OSKEY_ICO_00                        = $E4
	constant integer JN_OSKEY_PROCESSKEY                    = $E5
	constant integer JN_OSKEY_ICO_CLEAR                     = $E6
	constant integer JN_OSKEY_PACKET                        = $E7
	constant integer JN_OSKEY_OEM_RESET                     = $E9
	constant integer JN_OSKEY_OEM_JUMP                      = $EA
	constant integer JN_OSKEY_OEM_PA1                       = $EB
	constant integer JN_OSKEY_OEM_PA2                       = $EC
	constant integer JN_OSKEY_OEM_PA3                       = $ED
	constant integer JN_OSKEY_OEM_WSCTRL                    = $EE
	constant integer JN_OSKEY_OEM_CUSEL                     = $EF
	constant integer JN_OSKEY_OEM_ATTN                      = $F0
	constant integer JN_OSKEY_OEM_FINISH                    = $F1
	constant integer JN_OSKEY_OEM_COPY                      = $F2
	constant integer JN_OSKEY_OEM_AUTO                      = $F3
	constant integer JN_OSKEY_OEM_ENLW                      = $F4
	constant integer JN_OSKEY_OEM_BACKTAB                   = $F5
	constant integer JN_OSKEY_ATTN                          = $F6
	constant integer JN_OSKEY_CRSEL                         = $F7
	constant integer JN_OSKEY_EXSEL                         = $F8
	constant integer JN_OSKEY_EREOF                         = $F9
	constant integer JN_OSKEY_PLAY                          = $FA
	constant integer JN_OSKEY_ZOOM                          = $FB
	constant integer JN_OSKEY_NONAME                        = $FC
	constant integer JN_OSKEY_PA1                           = $FD
	constant integer JN_OSKEY_OEM_CLEAR                     = $FE
endglobals

static if REFORGED_MODE then
	native BlzGetTriggerPlayerMouseX takes nothing returns real
	native BlzGetTriggerPlayerMouseY takes nothing returns real
	native BlzGetTriggerPlayerMousePosition takes nothing returns location
	native BlzGetTriggerPlayerMouseButton takes nothing returns mousebuttontype
	native BlzTriggerRegisterPlayerKeyEvent takes trigger whichTrigger, player whichPlayer, oskeytype key, integer metaKey, boolean keyDown returns event
	native BlzGetTriggerPlayerKey takes nothing returns oskeytype
	native BlzGetTriggerPlayerMetaKey takes nothing returns integer
	native BlzGetTriggerPlayerIsKeyDown takes nothing returns boolean
	native BlzEnableCursor takes boolean enable returns nothing
	native BlzSetMousePos takes integer x, integer y returns nothing
	native BlzGetLocalClientWidth takes nothing returns integer
	native BlzGetLocalClientHeight takes nothing returns integer
	native BlzIsLocalClientActive takes nothing returns boolean
else
	native DzGetMouseTerrainX takes nothing returns real
	native DzGetMouseTerrainY takes nothing returns real
	native DzGetMouseTerrainZ takes nothing returns real
	native DzIsMouseOverUI takes nothing returns boolean
	native DzGetMouseX takes nothing returns integer
	native DzGetMouseY takes nothing returns integer
	native DzGetMouseXRelative takes nothing returns integer
	native DzGetMouseYRelative takes nothing returns integer
	native DzSetMousePos takes integer x, integer y returns nothing
	native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
	native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
	native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
	native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
	native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
	native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
	native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
	native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
	native DzGetTriggerKey takes nothing returns integer
	native DzGetWheelDelta takes nothing returns integer
	native DzIsKeyDown takes integer iKey returns boolean
	native DzGetTriggerKeyPlayer takes nothing returns player
	native DzGetWindowWidth takes nothing returns integer
	native DzGetWindowHeight takes nothing returns integer
	native DzGetWindowX takes nothing returns integer
	native DzGetWindowY takes nothing returns integer
	native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
	native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
	native DzIsWindowActive takes nothing returns boolean
endif

function JNGetTriggerPlayerMouseX takes nothing returns real
static if REFORGED_MODE then
	return BlzGetTriggerPlayerMouseX()
else
	return DzGetMouseTerrainX()
endif
endfunction

function JNGetTriggerPlayerMouseY takes nothing returns real
static if REFORGED_MODE then
	return BlzGetTriggerPlayerMouseY()
else
	return DzGetMouseTerrainY()
endif
endfunction

function JNGetTriggerPlayerMousePosition takes nothing returns location
static if REFORGED_MODE then
	return BlzGetTriggerPlayerMousePosition()
else
	return Location(DzGetMouseTerrainX(), DzGetMouseTerrainY())
endif
endfunction

function JNTriggerRegisterPlayerKeyEvent takes trigger whichTrigger, player whichPlayer, integer key, integer metaKey, boolean keyDown, boolean sync returns nothing
static if REFORGED_MODE then
	local integer loopA = 0
	if whichPlayer == null then
		loop
			call BlzTriggerRegisterPlayerKeyEvent(whichTrigger, Player(loopA), ConvertOsKeyType(key), metaKey, keyDown)
			set loopA = loopA + 1
			exitwhen loopA == bj_MAX_PLAYERS
		endloop
	else
		call BlzTriggerRegisterPlayerKeyEvent(whichTrigger, whichPlayer, ConvertOsKeyType(key), metaKey, keyDown)
	endif
else
	local integer status = 0
	if keyDown then
		set status = 1
	endif
	if whichPlayer == null or whichPlayer == GetLocalPlayer() then
		call DzTriggerRegisterKeyEvent(whichTrigger, key, status, sync, null)
	endif
endif
endfunction

function JNGetTriggerKey takes nothing returns integer
static if REFORGED_MODE then
	return GetHandleId(BlzGetTriggerPlayerKey())
else
	return DzGetTriggerKey()
endif
endfunction

function JNGetTriggerIsKeyDown takes nothing returns boolean
static if REFORGED_MODE then
	return BlzGetTriggerPlayerIsKeyDown()
else
	return DzIsKeyDown(DzGetTriggerKey())
endif
endfunction

function JNGetTriggerKeyPlayer takes nothing returns player
static if REFORGED_MODE then
	return GetTriggerPlayer()
else
	return DzGetTriggerKeyPlayer()
endif
endfunction

function JNSetMousePos takes integer x, integer y returns nothing
static if REFORGED_MODE then
	call BlzSetMousePos(x, y)
else
	call DzSetMousePos(x, y)
endif
endfunction

function JNGetLocalClientWidth takes nothing returns integer
static if REFORGED_MODE then
	return BlzGetLocalClientWidth()
else
	return DzGetWindowWidth()
endif
endfunction

function JNGetLocalClientHeight takes nothing returns integer
static if REFORGED_MODE then
	return BlzGetLocalClientHeight()
else
	return DzGetWindowHeight()
endif
endfunction

function JNIsLocalClientActive takes nothing returns boolean
static if REFORGED_MODE then
	return BlzIsLocalClientActive()
else
	return DzIsWindowActive()
endif
endfunction
endlibrary