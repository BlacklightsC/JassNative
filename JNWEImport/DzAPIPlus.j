library DzAPIPlus
static if REFORGED_MODE then
    native BlzGetMouseFocusUnit takes nothing returns unit
    native BlzChangeMinimapTerrainTex takes string texFile returns boolean
    native BlzGetLocale takes nothing returns string
else
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzGetLocale takes nothing returns string
endif

function JNGetMouseFocusUnit takes nothing returns unit
static if REFORGED_MODE then
    return BlzGetMouseFocusUnit()
else
    return DzGetUnitUnderMouse()
endif
endfunction

function JNChangeMinimapTerrainTex takes string texFile returns nothing
static if REFORGED_MODE then
    call BlzChangeMinimapTerrainTex(texFile)
else
    call DzSetWar3MapMap(texFile)
endif
endfunction

function JNGetLocale takes nothing returns string
static if REFORGED_MODE then
    return BlzGetLocale()
else
    return DzGetLocale()
endif
endfunction
endlibrary