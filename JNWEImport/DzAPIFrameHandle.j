library DzAPIFrameHandle
globals
	constant integer JN_FRAMEPOINT_TOPLEFT                = 0
	constant integer JN_FRAMEPOINT_TOP                    = 1
	constant integer JN_FRAMEPOINT_TOPRIGHT               = 2
	constant integer JN_FRAMEPOINT_LEFT                   = 3
	constant integer JN_FRAMEPOINT_CENTER                 = 4
	constant integer JN_FRAMEPOINT_RIGHT                  = 5
	constant integer JN_FRAMEPOINT_BOTTOMLEFT             = 6
	constant integer JN_FRAMEPOINT_BOTTOM                 = 7
	constant integer JN_FRAMEPOINT_BOTTOMRIGHT            = 8

	constant integer JN_TEXT_JUSTIFY_TOP                  = 0
	constant integer JN_TEXT_JUSTIFY_MIDDLE               = 1
	constant integer JN_TEXT_JUSTIFY_BOTTOM               = 2
	constant integer JN_TEXT_JUSTIFY_LEFT                 = 3
	constant integer JN_TEXT_JUSTIFY_CENTER               = 4
	constant integer JN_TEXT_JUSTIFY_RIGHT                = 5

	constant integer JN_FRAMEEVENT_CONTROL_CLICK          = 1
	constant integer JN_FRAMEEVENT_MOUSE_ENTER            = 2
	constant integer JN_FRAMEEVENT_MOUSE_LEAVE            = 3
	constant integer JN_FRAMEEVENT_MOUSE_UP               = 4
	constant integer JN_FRAMEEVENT_MOUSE_DOWN             = 5
	constant integer JN_FRAMEEVENT_MOUSE_WHEEL            = 6
	constant integer JN_FRAMEEVENT_CHECKBOX_CHECKED       = 7
	constant integer JN_FRAMEEVENT_CHECKBOX_UNCHECKED     = 8
	constant integer JN_FRAMEEVENT_EDITBOX_TEXT_CHANGED   = 9

	constant integer JN_FRAMEEVENT_POPUPMENU_ITEM_CHANGED = 11
	constant integer JN_FRAMEEVENT_MOUSE_DOUBLECLICK      = 12
	constant integer JN_FRAMEEVENT_SPRITE_ANIM_UPDATE     = 13
	constant integer JN_FRAMEEVENT_SLIDER_VALUE_CHANGED   = 14
	constant integer JN_FRAMEEVENT_DIALOG_CANCEL          = 15
	constant integer JN_FRAMEEVENT_DIALOG_ACCEPT          = 16
    constant integer JN_FRAMEEVENT_EDITBOX_ENTER          = 17

    constant real JN_FRAME_MAX_WIDTH                      = 0.8
    constant real JN_FRAME_MAX_HEIGHT                     = 0.6

    constant real JN_FRAME_ITEM_BUTTON_SIZE               = 0.03125
    constant real JN_FRAME_ITEM_BUTTON_SPACING_WIDTH      = 0.00875
    constant real JN_FRAME_ITEM_BUTTON_SPACING_HEIGHT     = 0.0068625

    private hashtable Data = InitHashtable()
endglobals

static if REFORGED_MODE then
    native BlzGetOriginFrame takes originframetype frameType, integer index returns framehandle
    native BlzEnableUIAutoPosition takes boolean enable returns nothing
    native BlzHideOriginFrames takes boolean enable returns nothing
    native BlzConvertColor takes integer a, integer r, integer g, integer b returns integer
    native BlzLoadTOCFile takes string TOCFile returns boolean
    native BlzCreateFrame takes string name, framehandle owner, integer priority, integer createContext returns framehandle
    native BlzCreateSimpleFrame takes string name, framehandle owner, integer createContext returns framehandle
    native BlzCreateFrameByType takes string typeName, string name, framehandle owner, string inherits, integer createContext returns framehandle
    native BlzDestroyFrame takes framehandle frame returns nothing
    native BlzFrameSetPoint takes framehandle frame, framepointtype point, framehandle relative, framepointtype relativePoint, real x, real y returns nothing
    native BlzFrameSetAbsPoint takes framehandle frame, framepointtype point, real x, real y returns nothing
    native BlzFrameClearAllPoints takes framehandle frame returns nothing
    native BlzFrameSetAllPoints takes framehandle frame, framehandle relative returns nothing
    native BlzFrameSetVisible takes framehandle frame, boolean visible returns nothing
    native BlzFrameIsVisible takes framehandle frame returns boolean
    native BlzGetFrameByName takes string name, integer createContext returns framehandle
    native BlzFrameGetName takes framehandle frame returns string
    native BlzFrameClick takes framehandle frame returns nothing
    native BlzFrameSetText takes framehandle frame, string text returns nothing
    native BlzFrameGetText takes framehandle frame returns string
    native BlzFrameAddText takes framehandle frame, string text returns nothing
    native BlzFrameSetTextSizeLimit takes framehandle frame, integer size returns nothing
    native BlzFrameGetTextSizeLimit takes framehandle frame returns integer
    native BlzFrameSetTextColor takes framehandle frame, integer color returns nothing
    native BlzFrameSetFocus takes framehandle frame, boolean flag returns nothing
    native BlzFrameSetModel takes framehandle frame, string modelFile, integer cameraIndex returns nothing
    native BlzFrameSetEnable takes framehandle frame, boolean enabled returns nothing
    native BlzFrameGetEnable takes framehandle frame returns boolean
    native BlzFrameSetAlpha takes framehandle frame, integer alpha returns nothing
    native BlzFrameGetAlpha takes framehandle frame returns integer
    native BlzFrameSetSpriteAnimate takes framehandle frame, integer primaryProp, integer flags returns nothing
    native BlzFrameSetTexture takes framehandle frame, string texFile, integer flag, boolean blend returns nothing
    native BlzFrameSetScale takes framehandle frame, real scale returns nothing
    native BlzFrameSetTooltip takes framehandle frame, framehandle tooltip returns nothing
    native BlzFrameCageMouse takes framehandle frame, boolean enable returns nothing
    native BlzFrameSetValue takes framehandle frame, real value returns nothing
    native BlzFrameGetValue takes framehandle frame returns real
    native BlzFrameSetMinMaxValue takes framehandle frame, real minValue, real maxValue returns nothing
    native BlzFrameSetStepSize takes framehandle frame, real stepSize returns nothing
    native BlzFrameSetSize takes framehandle frame, real width, real height returns nothing
    native BlzFrameSetVertexColor takes framehandle frame, integer color returns nothing
    native BlzFrameSetLevel takes framehandle frame, integer level returns nothing
    native BlzFrameSetParent takes framehandle frame, framehandle parent returns nothing
    native BlzFrameGetParent takes framehandle frame returns framehandle
    native BlzFrameGetHeight takes framehandle frame returns real
    native BlzFrameGetWidth takes framehandle frame returns real
    native BlzFrameSetFont takes framehandle frame, string fileName, real height, integer flags returns nothing
    native BlzFrameSetTextAlignment takes framehandle frame, textaligntype vert, textaligntype horz returns nothing
    native BlzFrameGetChildrenCount takes framehandle frame returns integer
    native BlzFrameGetChild takes framehandle frame, integer index returns framehandle
    native BlzTriggerRegisterFrameEvent takes trigger whichTrigger, framehandle frame, frameeventtype eventId returns event
    native BlzGetTriggerFrame takes nothing returns framehandle
    native BlzGetTriggerFrameEvent takes nothing returns frameeventtype
    native BlzGetTriggerFrameValue takes nothing returns real
    native BlzGetTriggerFrameText takes nothing returns string

    private function I2F takes integer id returns framehandle
        call SaveFogStateHandle(Data, 0, 0, ConvertFogState(id))
        return LoadFrameHandle(Data, 0, 0)
    endfunction

    private function F2I takes framehandle frame returns integer
        return GetHandleId(frame)
    endfunction
else
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer a, integer r, integer g, integer b returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    //native DzOriginalUIAutoResetPoint takes boolean enable returns nothing    // DoNothing
    native DzFrameSetPriority takes integer frame, integer priority returns nothing
    native DzFrameSetParent takes integer frame, integer parent returns nothing
    native DzFrameGetHeight takes integer frame returns real
    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
    native DzFrameGetParent takes integer frame returns integer
    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
    native DzFrameGetName takes integer frame returns string
endif

function JNHideOriginFrames takes nothing returns nothing
static if REFORGED_MODE then
    call BlzHideOriginFrames(true)
else
    call DzFrameHideInterface()
endif
endfunction

function JNGetGameUI takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0))
else
    return DzGetGameUI()
endif
endfunction

function JNFrameGetCommandBarButton takes integer x, integer y returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, x + y * 4))
else
    return DzFrameGetCommandBarButton(y, x)
endif
endfunction

function JNFrameGetHeroBarButton takes integer buttonId returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_HERO_BUTTON, buttonId))
else
    return DzFrameGetHeroBarButton(buttonId)
endif
endfunction

function JNFrameGetHeroHPBar takes integer buttonId returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_HERO_HP_BAR, buttonId))
else
    return DzFrameGetHeroHPBar(buttonId)
endif
endfunction

function JNFrameGetHeroManaBar takes integer buttonId returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_HERO_MANA_BAR, buttonId))
else
    return DzFrameGetHeroManaBar(buttonId)
endif
endfunction

function JNFrameGetItemBarButton takes integer buttonId returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, buttonId))
else
    return DzFrameGetItemBarButton(buttonId)
endif
endfunction

function JNFrameGetMinimap takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_MINIMAP, 0))
else
    return DzFrameGetMinimap()
endif
endfunction

function JNFrameGetMinimapButton takes integer buttonId returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_MINIMAP_BUTTON, buttonId))
else
    return DzFrameGetMinimapButton(buttonId)
endif
endfunction

function JNFrameGetUpperButtonBarButton takes integer buttonId returns integer
static if REFORGED_MODE then
    if buttonId == 0 then
        return F2I(BlzGetFrameByName("UpperButtonBarQuestsButton", 0))
    elseif buttonId == 1 then
        return F2I(BlzGetFrameByName("UpperButtonBarMenuButton", 0))
    elseif buttonId == 2 then
        return F2I(BlzGetFrameByName("UpperButtonBarAlliesButton", 0))
    elseif buttonId == 3 then
        return F2I(BlzGetFrameByName("UpperButtonBarChatButton", 0))
    endif
    return 0
else
    return DzFrameGetUpperButtonBarButton(buttonId)
endif
endfunction

function JNFrameGetTooltip takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_TOOLTIP, 0))
else
    return DzFrameGetTooltip()
endif
endfunction

function JNFrameGetChatMessage takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
else
    return DzFrameGetChatMessage()
endif
endfunction

function JNFrameGetUnitMessage takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
else
    return DzFrameGetUnitMessage()
endif
endfunction

function JNFrameGetTopMessage takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_TOP_MSG, 0))
else
    return DzFrameGetTopMessage()
endif
endfunction

function JNFrameGetPortrait takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0))
else
    return DzFrameGetPortrait()
endif
endfunction

function JNConvertColor takes integer a, integer r, integer g, integer b returns integer
static if REFORGED_MODE then
    return BlzConvertColor(a, r, g, b)
else
    return DzGetColor(a, r, g, b)
endif
endfunction

function JNLoadTOCFile takes string TOCFile returns nothing
static if REFORGED_MODE then
    call BlzLoadTOCFile(TOCFile)
else
    call DzLoadToc(TOCFile)
endif
endfunction

function JNCreateFrame takes string name, integer owner, integer priority, integer createContext returns integer
static if REFORGED_MODE then
    return F2I(BlzCreateFrame(name, I2F(owner), priority, createContext))
else
    local integer i = DzCreateFrame(name, owner, createContext)
    call DzFrameSetPriority(i, priority)
    return i
endif
endfunction

function JNCreateSimpleFrame takes string name, integer owner, integer createContext returns integer
static if REFORGED_MODE then
    return F2I(BlzCreateSimpleFrame(name, I2F(owner), createContext))
else
    return DzCreateSimpleFrame(name, owner, createContext)
endif
endfunction

function JNCreateFrameByType takes string typeName, string name, integer owner, string inherits, integer createContext returns integer
static if REFORGED_MODE then
    return F2I(BlzCreateFrameByType(typeName, name, I2F(owner), inherits, createContext))
else
    return DzCreateFrameByTagName(typeName, name, owner, inherits, createContext)
endif
endfunction

function JNDestroyFrame takes integer frame returns nothing
static if REFORGED_MODE then
    call BlzDestroyFrame(I2F(frame))
else
    call DzDestroyFrame(frame)
endif
endfunction

function JNFrameSetPoint takes integer frame, integer point, integer relative, integer relativePoint, real x, real y returns nothing
static if REFORGED_MODE then
    call BlzFrameSetPoint(I2F(frame), ConvertFramePointType(point), I2F(relative), ConvertFramePointType(relativePoint), x, y)
else
    call DzFrameSetPoint(frame, point, relative, relativePoint, x, y)
endif
endfunction

function JNFrameSetAbsPoint takes integer frame, integer point, real x, real y returns nothing
static if REFORGED_MODE then
    call BlzFrameSetAbsPoint(I2F(frame), ConvertFramePointType(point), x, y)
else
    call DzFrameSetAbsolutePoint(frame, point, x, y)
endif
endfunction

function JNFrameClearAllPoints takes integer frame returns nothing
static if REFORGED_MODE then
    call BlzFrameClearAllPoints(I2F(frame))
else
    call DzFrameClearAllPoints(frame)
endif
endfunction

function JNFrameSetAllPoints takes integer frame, integer relative returns nothing
static if REFORGED_MODE then
    call BlzFrameSetAllPoints(I2F(frame), I2F(relative))
else
    call DzFrameSetAllPoints(frame, relative)
endif
endfunction

function JNFrameSetVisible takes integer frame, boolean enable returns nothing
static if REFORGED_MODE then
    call BlzFrameSetVisible(I2F(frame), enable)
else
    call DzFrameShow(frame, enable)
    if enable then
        if HaveSavedBoolean(Data, frame, 0) then
            call RemoveSavedBoolean(Data, frame, 0)
        endif
    else
        if not HaveSavedBoolean(Data, frame, 0) then
            call SaveBoolean(Data, frame, 0, true)
        endif
    endif
endif
endfunction

function JNFrameIsVisible takes integer frame returns boolean
static if REFORGED_MODE then
    return BlzFrameIsVisible(I2F(frame))
else
    return not HaveSavedBoolean(Data, frame, 0)
endif
endfunction

private function I2H takes integer value returns string
    local string ret = null
    local integer mod
    loop
        exitwhen value <= 0
        set mod = ModuloInteger(value, 16)
        set ret = SubString("0123456789ABCDEF", mod, mod + 1) + ret
        set value = value / 16
    endloop
    return ret
endfunction

function JNGetFrameByName takes string name, integer createContext returns integer
static if REFORGED_MODE then
    return F2I(BlzGetFrameByName(name, createContext))
else
    local integer frame = DzFrameFindByName(name, createContext)
    if frame != 0 then
        debug call JNWriteLog("Found Frame: (" + name + ", " + I2S(createContext) + ") = 0x" + I2H(frame))
        return frame
    endif
    set frame = DzSimpleFrameFindByName(name, createContext)
    if frame != 0 then
        debug call JNWriteLog("Found SimpleFrame: (" + name + ", " + I2S(createContext) + ") = 0x" + I2H(frame))
        return frame
    endif
    set frame = DzSimpleFontStringFindByName(name, createContext)
    if frame != 0 then
        debug call JNWriteLog("Found SimpleFontString: (" + name + ", " + I2S(createContext) + ") = 0x" + I2H(frame))
        return frame
    endif
    set frame = DzSimpleTextureFindByName(name, createContext)
    if frame != 0 then
        debug call JNWriteLog("Found SimpleTexture: (" + name + ", " + I2S(createContext) + ") = 0x" + I2H(frame))
        return frame
    endif
    return 0
endif
endfunction

function JNFrameGetName takes integer frame returns string
static if REFORGED_MODE then
    return BlzFrameGetName(I2F(frame))
else
    return DzFrameGetName(frame)
endif
endfunction

function JNFrameClick takes integer frame returns nothing
static if REFORGED_MODE then
    call BlzFrameClick(I2F(frame))
else
    call DzClickFrame(frame)
endif
endfunction

function JNFrameSetText takes integer frame, string text returns nothing
static if REFORGED_MODE then
    call BlzFrameSetText(I2F(frame), text)
else
    call DzFrameSetText(frame, text)
endif
endfunction

function JNFrameGetText takes integer frame returns string
static if REFORGED_MODE then
    return BlzFrameGetText(I2F(frame))
else
    return DzFrameGetText(frame)
endif
endfunction

function JNFrameAddText takes integer frame, string text returns nothing
static if REFORGED_MODE then
    call BlzFrameAddText(I2F(frame), text)
else
    call DzFrameSetText(frame, DzFrameGetText(frame) + text)
endif
endfunction

function JNFrameSetTextSizeLimit takes integer frame, integer size returns nothing
static if REFORGED_MODE then
    call BlzFrameSetTextSizeLimit(I2F(frame), size)
else
    call DzFrameSetTextSizeLimit(frame, size)
endif
endfunction

function JNFrameGetTextSizeLimit takes integer frame returns integer
static if REFORGED_MODE then
    return BlzFrameGetTextSizeLimit(I2F(frame))
else
    return DzFrameGetTextSizeLimit(frame)
endif
endfunction

function JNFrameSetTextColor takes integer frame, integer color returns nothing
static if REFORGED_MODE then
    call BlzFrameSetTextColor(I2F(frame), color)
else
    call DzFrameSetTextColor(frame, color)
endif
endfunction

function JNFrameSetFocus takes integer frame, boolean flag returns nothing
static if REFORGED_MODE then
    call BlzFrameSetFocus(I2F(frame), flag)
else
    call DzFrameSetFocus(frame, flag)
endif
endfunction

function JNFrameSetModel takes integer frame, string modelFile, integer cameraIndex returns nothing
static if REFORGED_MODE then
    call BlzFrameSetModel(I2F(frame), modelFile, cameraIndex)
else
    call DzFrameSetModel(frame, modelFile, cameraIndex, 0)
endif
endfunction

function JNFrameSetEnable takes integer frame, boolean enabled returns nothing
static if REFORGED_MODE then
    call BlzFrameSetEnable(I2F(frame), enabled)
else
    call DzFrameSetEnable(frame, enabled)
endif
endfunction

function JNFrameGetEnable takes integer frame returns boolean
static if REFORGED_MODE then
    return BlzFrameGetEnable(I2F(frame))
else
    return DzFrameGetEnable(frame)
endif
endfunction

function JNFrameSetAlpha takes integer frame, integer alpha returns nothing
static if REFORGED_MODE then
    call BlzFrameSetAlpha(I2F(frame), alpha)
else
    call DzFrameSetAlpha(frame, alpha)
endif
endfunction

function JNFrameGetAlpha takes integer frame returns integer
static if REFORGED_MODE then
    return BlzFrameGetAlpha(I2F(frame))
else
    return DzFrameGetAlpha(frame)
endif
endfunction

// TODO : JNFrameSetSpriteAnimate

function JNFrameSetTexture takes integer frame, string texFile, integer flag returns nothing
static if REFORGED_MODE then
    call BlzFrameSetTexture(I2F(frame), texFile, flag, true)
else
    call DzFrameSetTexture(frame, texFile, flag)
endif
endfunction

function JNFrameSetScale takes integer frame, real scale returns nothing
static if REFORGED_MODE then
    call BlzFrameSetScale(I2F(frame), scale)
else
    call DzFrameSetScale(frame, scale)
endif
endfunction

function JNFrameSetTooltip takes integer frame, integer tooltip returns nothing
static if REFORGED_MODE then
    call BlzFrameSetTooltip(I2F(frame), I2F(tooltip))
else
    call DzFrameSetTooltip(frame, tooltip)
endif
endfunction

function JNFrameCageMouse takes integer frame, boolean enable returns nothing
static if REFORGED_MODE then
    call BlzFrameCageMouse(I2F(frame), enable)
else
    call DzFrameCageMouse(frame, enable)
endif
endfunction

function JNFrameSetValue takes integer frame, real value returns nothing
static if REFORGED_MODE then
    call BlzFrameSetValue(I2F(frame), value)
else
    call DzFrameSetValue(frame, value)
endif
endfunction

function JNFrameGetValue takes integer frame returns real
static if REFORGED_MODE then
    return BlzFrameGetValue(I2F(frame))
else
    return DzFrameGetValue(frame)
endif
endfunction

function JNFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
static if REFORGED_MODE then
    call BlzFrameSetMinMaxValue(I2F(frame), minValue, maxValue)
else
    call DzFrameSetMinMaxValue(frame, minValue, maxValue)
endif
endfunction

function JNFrameSetStepSize takes integer frame, real stepSize returns nothing
static if REFORGED_MODE then
    call BlzFrameSetStepSize(I2F(frame), stepSize)
else
    call DzFrameSetStepValue(frame, stepSize)
endif
endfunction

function JNFrameSetSize takes integer frame, real width, real height returns nothing
static if REFORGED_MODE then
    call BlzFrameSetSize(I2F(frame), width, height)
else
    call DzFrameSetSize(frame, width, height)
endif
endfunction

function JNFrameSetVertexColor takes integer frame, integer color returns nothing
static if REFORGED_MODE then
    call BlzFrameSetVertexColor(I2F(frame), color)
else
    call DzFrameSetVertexColor(frame, color)
endif
endfunction

function JNFrameSetLevel takes integer frame, integer level returns nothing
static if REFORGED_MODE then
    call BlzFrameSetLevel(I2F(frame), level)
else
    call DzFrameSetPriority(frame, level)
endif
endfunction

function JNFrameSetParent takes integer frame, integer parent returns nothing
static if REFORGED_MODE then
    call BlzFrameSetParent(I2F(frame), I2F(parent))
else
    call DzFrameSetParent(frame, parent)
endif
endfunction

function JNFrameGetParent takes integer frame returns integer
static if REFORGED_MODE then
    return F2I(BlzFrameGetParent(I2F(frame)))
else
    return DzFrameGetParent(frame)
endif
endfunction

function JNFrameGetHeight takes integer frame returns real
static if REFORGED_MODE then
    return BlzFrameGetHeight(I2F(frame))
else
    return DzFrameGetHeight(frame)
endif
endfunction

function JNFrameGetWidth takes integer frame returns real
static if REFORGED_MODE then
    return BlzFrameGetWidth(I2F(frame))
else
    return 0. // Unsupport
endif
endfunction

function JNFrameSetFont takes integer frame, string fileName, real height, integer flags returns nothing
static if REFORGED_MODE then
    call BlzFrameSetFont(I2F(frame), fileName, height, flags)
else
    call DzFrameSetFont(frame, fileName, height, flags)
endif
endfunction

function JNFrameSetTextAlignment takes integer frame, integer vert, integer horz returns nothing
static if REFORGED_MODE then
    call BlzFrameSetTextAlignment(I2F(frame), ConvertTextAlignType(vert), ConvertTextAlignType(horz))
else
    // SimpleFontString / SimpleMessageFrame / TextFrame
    local integer align = 0
    if vert == JN_TEXT_JUSTIFY_TOP then
        set align = 1
    elseif vert == JN_TEXT_JUSTIFY_MIDDLE then
        set align = 2
    elseif vert == JN_TEXT_JUSTIFY_BOTTOM then
        set align = 4
    endif
    if horz == JN_TEXT_JUSTIFY_LEFT then
        set align = align + 8
    elseif horz == JN_TEXT_JUSTIFY_CENTER then
        set align = align + 16
    elseif horz == JN_TEXT_JUSTIFY_RIGHT then
        set align = align + 32
    endif
    call DzFrameSetTextAlignment(frame, align)
endif
endfunction

function JNFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
// Default bottomHeight = 0.13
static if REFORGED_MODE then
    call BlzFrameSetSize(BlzGetFrameByName("ConsoleUIBackdrop", 0), 0, bottomHeight)
else
    call DzFrameEditBlackBorders(upperHeight, bottomHeight)
endif
endfunction

function JNTriggerRegisterFrameEvent takes trigger whichTrigger, integer frame, integer eventId returns nothing
static if REFORGED_MODE then
    if eventId > 10 then
        set eventId = eventId - 1
    endif
    call BlzTriggerRegisterFrameEvent(whichTrigger, I2F(frame), ConvertFrameEventType(eventId))
else
    //Use JNFrameSetScript function
endif
endfunction

function JNFrameSetScript takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
static if REFORGED_MODE then
    //Use JNTriggerRegisterFrameEvent function
else
    call DzFrameSetScriptByCode(frame, eventId, funcHandle, sync)
endif
endfunction

function JNEnableWideScreen takes boolean enable returns nothing
static if REFORGED_MODE then
    // Reforged are true only
else
    call DzEnableWideScreen(enable)
endif
endfunction

function JNGetTriggerUIEventPlayer takes nothing returns player
static if REFORGED_MODE then
    return GetTriggerPlayer()
else
    return DzGetTriggerUIEventPlayer()
endif
endfunction

function JNGetTriggerUIEventFrame takes nothing returns integer
static if REFORGED_MODE then
    return F2I(BlzGetTriggerFrame())
else
    // boolean sync must false
    return DzGetTriggerUIEventFrame()
endif
endfunction
endlibrary