library JAPIEffect
static if REFORGED_MODE then
    native BlzSetSpecialEffectScale takes effect whichEffect, real scale returns nothing
    native BlzSetSpecialEffectPosition takes effect whichEffect, real x, real y, real z returns nothing
    native BlzSetSpecialEffectHeight takes effect whichEffect, real height returns nothing
    native BlzSetSpecialEffectTimeScale takes effect whichEffect, real timeScale returns nothing
    native BlzSetSpecialEffectOrientation takes effect whichEffect, real yaw, real pitch, real roll returns nothing
    native BlzSetSpecialEffectYaw takes effect whichEffect, real yaw returns nothing
    native BlzSetSpecialEffectPitch takes effect whichEffect, real pitch returns nothing
    native BlzSetSpecialEffectRoll takes effect whichEffect, real roll returns nothing
    native BlzSetSpecialEffectX takes effect whichEffect, real x returns nothing
    native BlzSetSpecialEffectY takes effect whichEffect, real y returns nothing
    native BlzSetSpecialEffectZ takes effect whichEffect, real z returns nothing
    native BlzSetSpecialEffectPositionLoc takes effect whichEffect, location loc returns nothing
    native BlzGetLocalSpecialEffectX takes effect whichEffect returns real
    native BlzGetLocalSpecialEffectY takes effect whichEffect returns real
    native BlzGetLocalSpecialEffectZ takes effect whichEffect returns real
    native BlzSetSpecialEffectMatrixScale takes effect whichEffect, real x, real y, real z returns nothing
    native BlzResetSpecialEffectMatrix takes effect whichEffect returns nothing
else
    native EXSetEffectXY takes effect e, real x, real y returns nothing
    native EXSetEffectZ takes effect e, real z returns nothing
    native EXGetEffectX takes effect e returns real
    native EXGetEffectY takes effect e returns real
    native EXGetEffectZ takes effect e returns real
    native EXSetEffectSize takes effect e, real size returns nothing
    native EXGetEffectSize takes effect e returns real
    native EXEffectMatRotateX takes effect e, real angle returns nothing
    native EXEffectMatRotateY takes effect e, real angle returns nothing
    native EXEffectMatRotateZ takes effect e, real angle returns nothing
    native EXEffectMatScale takes effect e, real x, real y, real z returns nothing
    native EXEffectMatReset takes effect e returns nothing
    native EXSetEffectSpeed takes effect e, real speed returns nothing
endif

function JNSetSpecialEffectScale takes effect whichEffect, real scale returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectScale(whichEffect, scale)
else
    call EXSetEffectSize(whichEffect, scale)
endif
endfunction

function JNSetSpecialEffectPosition takes effect whichEffect, real x, real y, real z returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectPosition(whichEffect, x, y, z)
else
    call EXSetEffectXY(whichEffect, x, y)
    call EXSetEffectZ(whichEffect, z)
endif
endfunction

function JNSetSpecialEffectHeight takes effect whichEffect, real height returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectHeight(whichEffect, height)
else
    call EXSetEffectZ(whichEffect, height)
endif
endfunction

function JNSetSpecialEffectTimeScale takes effect whichEffect, real timeScale returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectTimeScale(whichEffect, timeScale)
else
    call EXSetEffectSpeed(whichEffect, timeScale)
endif
endfunction

function JNSetSpecialEffectOrientation takes effect whichEffect, real yaw, real pitch, real roll returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectOrientation(whichEffect, yaw, pitch, roll)
else
    call EXEffectMatRotateZ(whichEffect, yaw)
    call EXEffectMatRotateY(whichEffect, pitch)
    call EXEffectMatRotateX(whichEffect, roll)
endif
endfunction

function JNSetSpecialEffectYaw takes effect whichEffect, real yaw returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectYaw(whichEffect, yaw)
else
    call EXEffectMatRotateZ(whichEffect, yaw)
endif
endfunction

function JNSetSpecialEffectPitch takes effect whichEffect, real pitch returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectPitch(whichEffect, pitch)
else
    call EXEffectMatRotateY(whichEffect, pitch)
endif
endfunction

function JNSetSpecialEffectRoll takes effect whichEffect, real roll returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectRoll(whichEffect, roll)
else
    call EXEffectMatRotateX(whichEffect, roll)
endif
endfunction

function JNSetSpecialEffectX takes effect whichEffect, real x returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectX(whichEffect, x)
else
    call EXSetEffectXY(whichEffect, x, EXGetEffectY(whichEffect))
endif
endfunction

function JNSetSpecialEffectY takes effect whichEffect, real y returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectY(whichEffect, y)
else
    call EXSetEffectXY(whichEffect, EXGetEffectX(whichEffect), y)
endif
endfunction

function JNSetSpecialEffectZ takes effect whichEffect, real z returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectZ(whichEffect, z)
else
    call EXSetEffectZ(whichEffect, z)
endif
endfunction

function JNSetSpecialEffectPositionLoc takes effect whichEffect, location loc returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectPositionLoc(whichEffect, loc)
else
    call EXSetEffectXY(whichEffect, GetLocationX(loc), GetLocationY(loc))
endif
endfunction

function JNGetLocalSpecialEffectX takes effect whichEffect returns real
static if REFORGED_MODE then
    return BlzGetLocalSpecialEffectX(whichEffect)
else
    return EXGetEffectX(whichEffect)
endif
endfunction

function JNGetLocalSpecialEffectY takes effect whichEffect returns real
static if REFORGED_MODE then
    return BlzGetLocalSpecialEffectY(whichEffect)
else
    return EXGetEffectY(whichEffect)
endif
endfunction

function JNGetLocalSpecialEffectZ takes effect whichEffect returns real
static if REFORGED_MODE then
    return BlzGetLocalSpecialEffectZ(whichEffect)
else
    return EXGetEffectZ(whichEffect)
endif
endfunction

function JNSetSpecialEffectMatrixScale takes effect whichEffect, real x, real y, real z returns nothing
static if REFORGED_MODE then
    call BlzSetSpecialEffectMatrixScale(whichEffect, x, y, z)
else
    call EXEffectMatScale(whichEffect, x, y, z)
endif
endfunction

function JNResetSpecialEffectMatrix takes effect whichEffect returns nothing
static if REFORGED_MODE then
    call BlzResetSpecialEffectMatrix(whichEffect)
else
    call EXEffectMatReset(whichEffect)
endif
endfunction
endlibrary