library JAPIUnitState
globals
    //constant integer UNIT_STATE_ATTACK1_DAMAGE_DICE        = $10
    //constant integer UNIT_STATE_ATTACK1_DAMAGE_SIDE        = $11
    //constant integer UNIT_STATE_ATTACK1_DAMAGE_BASE        = $12
    constant integer UNIT_STATE_ATTACK1_DAMAGE_BONUS       = $13
    //constant integer UNIT_STATE_ATTACK1_DAMAGE_LOSS_FACTOR = $21
    //constant integer UNIT_STATE_ATTACK1_WEAPON_SOUND       = $22
    //constant integer UNIT_STATE_ATTACK1_ATTACK_TYPE        = $23
    //constant integer UNIT_STATE_ATTACK1_MAX_TARGETS        = $24
    //constant integer UNIT_STATE_ATTACK1_INTERVAL           = $25
    //constant integer UNIT_STATE_ATTACK1_INITIAL_DELAY      = $26
    //constant integer UNIT_STATE_ATTACK1_RANGE              = $16
    constant integer UNIT_STATE_ATTACK1_RANGE_BUFFER       = $27
    constant integer UNIT_STATE_ATTACK1_DAMAGE_MIN         = $14
    constant integer UNIT_STATE_ATTACK1_DAMAGE_MAX         = $15
    //constant integer UNIT_STATE_ATTACK1_BACK_SWING         = $28
    //constant integer UNIT_STATE_ATTACK1_TARGET_TYPES       = $29
    //constant integer UNIT_STATE_ATTACK1_SPILL_DIST         = $56
    //constant integer UNIT_STATE_ATTACK1_SPILL_RADIUS       = $57
    constant integer UNIT_STATE_ATTACK1_WEAPON_TYPE        = $58

    //constant integer UNIT_STATE_ATTACK2_DAMAGE_DICE        = $30
    //constant integer UNIT_STATE_ATTACK2_DAMAGE_SIDE        = $31
    //constant integer UNIT_STATE_ATTACK2_DAMAGE_BASE        = $32
    constant integer UNIT_STATE_ATTACK2_DAMAGE_BONUS       = $33
    //constant integer UNIT_STATE_ATTACK2_DAMAGE_LOSS_FACTOR = $34
    //constant integer UNIT_STATE_ATTACK2_WEAPON_SOUND       = $35
    //constant integer UNIT_STATE_ATTACK2_ATTACK_TYPE        = $36
    //constant integer UNIT_STATE_ATTACK2_MAX_TARGETS        = $37
    //constant integer UNIT_STATE_ATTACK2_INTERVAL           = $38
    //constant integer UNIT_STATE_ATTACK2_INITIAL_DELAY      = $39
    //constant integer UNIT_STATE_ATTACK2_RANGE              = $40
    constant integer UNIT_STATE_ATTACK2_RANGE_BUFFER       = $41
    constant integer UNIT_STATE_ATTACK2_DAMAGE_MIN         = $42
    constant integer UNIT_STATE_ATTACK2_DAMAGE_MAX         = $43
    //constant integer UNIT_STATE_ATTACK2_BACK_SWING         = $44
    //constant integer UNIT_STATE_ATTACK2_TARGET_TYPES       = $45
    //constant integer UNIT_STATE_ATTACK2_SPILL_DIST         = $46
    //constant integer UNIT_STATE_ATTACK2_SPILL_RADIUS       = $47
    constant integer UNIT_STATE_ATTACK2_WEAPON_TYPE        = $59

    //constant integer UNIT_STATE_ARMOR                      = $20
    //constant integer UNIT_STATE_ARMOR_TYPE                 = $50
    constant integer UNIT_STATE_RATE_OF_FIRE               = $51
    //constant integer UNIT_STATE_ACQUISITION_RANGE          = $52
    //constant integer UNIT_STATE_LIFE_REGEN                 = $53
    //constant integer UNIT_STATE_MANA_REGEN                 = $54
    //constant integer UNIT_STATE_MIN_RANGE                  = $55
    //constant integer UNIT_STATE_AS_TARGET_TYPE             = $60
    constant integer UNIT_STATE_TYPE                       = $61

    constant integer JN_DEFENSE_TYPE_LIGHT              = 0
    constant integer JN_DEFENSE_TYPE_MEDIUM             = 1
    constant integer JN_DEFENSE_TYPE_LARGE              = 2
    constant integer JN_DEFENSE_TYPE_FORT               = 3
    constant integer JN_DEFENSE_TYPE_NORMAL             = 4
    constant integer JN_DEFENSE_TYPE_HERO               = 5
    constant integer JN_DEFENSE_TYPE_DIVINE             = 6
    constant integer JN_DEFENSE_TYPE_NONE               = 7

    constant integer JN_TARGET_FLAG_NONE                = 1
    constant integer JN_TARGET_FLAG_GROUND              = 2
    constant integer JN_TARGET_FLAG_AIR                 = 4
    constant integer JN_TARGET_FLAG_STRUCTURE           = 8
    constant integer JN_TARGET_FLAG_WARD                = $10
    constant integer JN_TARGET_FLAG_ITEM                = $20
    constant integer JN_TARGET_FLAG_TREE                = $40
    constant integer JN_TARGET_FLAG_WALL                = $80
    constant integer JN_TARGET_FLAG_DEBRIS              = $100
    constant integer JN_TARGET_FLAG_DECORATION          = $200
    constant integer JN_TARGET_FLAG_BRIDGE              = $400

    constant integer JN_WEAPON_SOUND_METAL_LIGHT_CHOP   = 1
    constant integer JN_WEAPON_SOUND_METAL_MEDIUM_CHOP  = 2
    constant integer JN_WEAPON_SOUND_METAL_HEAVY_CHOP   = 3
    constant integer JN_WEAPON_SOUND_METAL_LIGHT_SLICE  = 4
    constant integer JN_WEAPON_SOUND_METAL_MEDIUM_SLICE = 5
    constant integer JN_WEAPON_SOUND_METAL_HEAVY_SLICE  = 6
    constant integer JN_WEAPON_SOUND_METAL_MEDIUM_BASH  = 7
    constant integer JN_WEAPON_SOUND_METAL_HEAVY_BASH   = 8
    constant integer JN_WEAPON_SOUND_WOOD_LIGHT_BASH    = 14
    constant integer JN_WEAPON_SOUND_WOOD_MEDIUM_BASH   = 15
    constant integer JN_WEAPON_SOUND_WOOD_HEAVY_BASH    = 16
    constant integer JN_WEAPON_SOUND_AXE_MEDIUM_CHOP    = 22
    constant integer JN_WEAPON_SOUND_ROCK_HEAVY_BASH    = 23
endglobals

static if REFORGED_MODE then
    native BlzGetUnitMaxHP takes unit whichUnit returns integer
    native BlzSetUnitMaxHP takes unit whichUnit, integer hp returns nothing

    native BlzGetUnitMaxMana takes unit whichUnit returns integer
    native BlzSetUnitMaxMana takes unit whichUnit, integer mana returns nothing

    native BlzGetUnitArmor takes unit whichUnit returns real
    native BlzSetUnitArmor takes unit whichUnit, real armorAmount returns nothing

    native BlzPauseUnitEx takes unit whichUnit, boolean flag returns nothing
    native BlzSetUnitFacingEx takes unit whichUnit, real facingAngle returns nothing

    native BlzGetUnitDiceNumber takes unit whichUnit, integer weaponIndex returns integer
    native BlzSetUnitDiceNumber takes unit whichUnit, integer diceNumber, integer weaponIndex returns nothing
    native BlzGetUnitDiceSides takes unit whichUnit, integer weaponIndex returns integer
    native BlzSetUnitDiceSides takes unit whichUnit, integer diceSides, integer weaponIndex returns nothing
    native BlzGetUnitBaseDamage takes unit whichUnit, integer weaponIndex returns integer
    native BlzSetUnitBaseDamage takes unit whichUnit, integer baseDamage, integer weaponIndex returns nothing
    native BlzGetUnitAttackCooldown takes unit whichUnit, integer weaponIndex returns real
    native BlzSetUnitAttackCooldown takes unit whichUnit, real cooldown, integer weaponIndex returns nothing

    native BlzGetUnitBooleanField takes unit whichUnit, unitbooleanfield whichField returns boolean
    native BlzGetUnitIntegerField takes unit whichUnit, unitintegerfield whichField returns integer
    native BlzGetUnitRealField takes unit whichUnit, unitrealfield whichField returns real
    native BlzGetUnitStringField takes unit whichUnit, unitstringfield whichField returns string

    native BlzSetUnitBooleanField takes unit whichUnit, unitbooleanfield whichField, boolean value returns boolean
    native BlzSetUnitIntegerField takes unit whichUnit, unitintegerfield whichField, integer value returns boolean
    native BlzSetUnitRealField takes unit whichUnit, unitrealfield whichField, real value returns boolean
    native BlzSetUnitStringField takes unit whichUnit, unitstringfield whichField, string value returns boolean

    native BlzGetUnitWeaponBooleanField takes unit whichUnit, unitweaponbooleanfield whichField, integer index returns boolean
    native BlzGetUnitWeaponIntegerField takes unit whichUnit, unitweaponintegerfield whichField, integer index returns integer
    native BlzGetUnitWeaponRealField takes unit whichUnit, unitweaponrealfield whichField, integer index returns real
    native BlzGetUnitWeaponStringField takes unit whichUnit, unitweaponstringfield whichField, integer index returns string

    native BlzSetUnitWeaponBooleanField takes unit whichUnit, unitweaponbooleanfield whichField, integer index, boolean value returns boolean
    native BlzSetUnitWeaponIntegerField takes unit whichUnit, unitweaponintegerfield whichField, integer index, integer value returns boolean
    native BlzSetUnitWeaponRealField takes unit whichUnit, unitweaponrealfield whichField, integer index, real value returns boolean
    native BlzSetUnitWeaponStringField takes unit whichUnit, unitweaponstringfield whichField, integer index, string value returns boolean
else
    //Overrided: constant native GetUnitState takes unit whichUnit, unitstate whichUnitState returns real
    //Overrided: native SetUnitState takes unit whichUnit, unitstate whichUnitState, real newVal returns nothing

    native EXGetUnitString takes integer unitcode, integer data_type returns string
    native EXSetUnitString takes integer unitcode, integer data_type, string value returns boolean
    native EXGetUnitReal takes integer unitcode, integer data_type returns real
    native EXSetUnitReal takes integer unitcode, integer data_type, real value returns boolean
    native EXGetUnitInteger takes integer unitcode, integer data_type returns integer
    native EXSetUnitInteger takes integer unitcode, integer data_type, integer value returns boolean
    native EXGetUnitArrayString takes integer unitcode, integer data_type, integer index returns string
    native EXSetUnitArrayString takes integer unitcode, integer data_type, integer index, string value returns boolean

    native EXPauseUnit takes unit u, boolean flag returns nothing
    native EXSetUnitCollisionType takes boolean enable, unit u, integer t returns nothing
    native EXSetUnitMoveType takes unit u, integer t returns nothing
    native EXSetUnitFacing takes unit u, real angle returns nothing
endif

function JNGetUnitHP takes unit whichUnit returns real
    return GetUnitState(whichUnit, UNIT_STATE_LIFE)
endfunction

function JNSetUnitHP takes unit whichUnit, real hp returns nothing
    call SetUnitState(whichUnit, UNIT_STATE_LIFE, hp)
endfunction

function JNGetUnitMana takes unit whichUnit returns real
    return GetUnitState(whichUnit, UNIT_STATE_MANA)
endfunction

function JNSetUnitMana takes unit whichUnit, real mana returns nothing
    call SetUnitState(whichUnit, UNIT_STATE_MANA, mana)
endfunction

function JNGetUnitMaxHP takes unit whichUnit returns real
static if REFORGED_MODE then
    return I2R(BlzGetUnitMaxHP(whichUnit))
else
    return GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
endif
endfunction

function JNSetUnitMaxHP takes unit whichUnit, real hp returns nothing
static if REFORGED_MODE then
    call BlzSetUnitMaxHP(whichUnit, S2I(R2S(hp)))
else
    call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, hp)
endif
endfunction

function JNGetUnitMaxMana takes unit whichUnit returns real
static if REFORGED_MODE then
    return I2R(BlzGetUnitMaxMana(whichUnit))
else
    return GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
endif
endfunction

function JNSetUnitMaxMana takes unit whichUnit, real mana returns nothing
static if REFORGED_MODE then
    call BlzSetUnitMaxMana(whichUnit, S2I(R2S(mana)))
else
    call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, mana)
endif
endfunction

function JNGetUnitArmor takes unit whichUnit returns real
static if REFORGED_MODE then
    return BlzGetUnitArmor(whichUnit)
else
    return GetUnitState(whichUnit, ConvertUnitState($20))
endif
endfunction

function JNSetUnitArmor takes unit whichUnit, real armorAmount returns nothing
static if REFORGED_MODE then
    call BlzSetUnitArmor(whichUnit, armorAmount)
else
    call SetUnitState(whichUnit, ConvertUnitState($20), armorAmount)
endif
endfunction

function JNPauseUnit takes unit whichUnit, boolean flag returns nothing
static if REFORGED_MODE then
    call BlzPauseUnitEx(whichUnit, flag)
else
    call EXPauseUnit(whichUnit, flag)
endif
endfunction

function JNSetUnitFacing takes unit whichUnit, real facingAngle returns nothing
static if REFORGED_MODE then
    call BlzSetUnitFacingEx(whichUnit, facingAngle)
else
    call EXSetUnitFacing(whichUnit, facingAngle)
endif
endfunction

function JNGetUnitDefenseType takes unit whichUnit returns integer
static if REFORGED_MODE then
    return BlzGetUnitIntegerField(whichUnit, UNIT_IF_DEFENSE_TYPE)
else
    return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($50))))
endif
endfunction

function JNSetUnitDefenseType takes unit whichUnit, integer value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitIntegerField(whichUnit, UNIT_IF_DEFENSE_TYPE, value)
else
    call SetUnitState(whichUnit, ConvertUnitState($50), value)
endif
endfunction

function JNGetUnitRateOfFire takes unit whichUnit returns real
static if REFORGED_MODE then
    return 0.
else
    return GetUnitState(whichUnit, ConvertUnitState($51))
endif
endfunction

function JNSetUnitRateOfFire takes unit whichUnit, real value returns nothing
static if REFORGED_MODE then
    // TODO
else
    call SetUnitState(whichUnit, ConvertUnitState($51), value)
endif
endfunction

function JNGetUnitAcquistionRange takes unit whichUnit returns real
static if REFORGED_MODE then
    return BlzGetUnitRealField(whichUnit, UNIT_RF_ACQUISITION_RANGE)
else
    return GetUnitState(whichUnit, ConvertUnitState($52))
endif
endfunction

function JNSetUnitAcquistionRange takes unit whichUnit, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitRealField(whichUnit, UNIT_RF_ACQUISITION_RANGE, value)
else
    call SetUnitState(whichUnit, ConvertUnitState($52), value)
endif
endfunction

function JNGetUnitHPRegen takes unit whichUnit returns real
static if REFORGED_MODE then
    return BlzGetUnitRealField(whichUnit, UNIT_RF_HIT_POINTS_REGENERATION_RATE)
else
    return GetUnitState(whichUnit, ConvertUnitState($53))
endif
endfunction

function JNSetUnitHPRegen takes unit whichUnit, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitRealField(whichUnit, UNIT_RF_HIT_POINTS_REGENERATION_RATE, value)
else
    // Revive required
    call SetUnitState(whichUnit, ConvertUnitState($53), value)
endif
endfunction

function JNGetUnitManaRegen takes unit whichUnit returns real
static if REFORGED_MODE then
    return BlzGetUnitRealField(whichUnit, UNIT_RF_MANA_REGENERATION)
else
    return GetUnitState(whichUnit, ConvertUnitState($54))
endif
endfunction

function JNSetUnitManaRegen takes unit whichUnit, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitRealField(whichUnit, UNIT_RF_MANA_REGENERATION, value)
else
    // Revive required
    call SetUnitState(whichUnit, ConvertUnitState($54), value)
endif
endfunction

function JNGetUnitMinRange takes unit whichUnit returns real
static if REFORGED_MODE then
    return BlzGetUnitRealField(whichUnit, UNIT_RF_MINIMUM_ATTACK_RANGE)
else
    return GetUnitState(whichUnit, ConvertUnitState($55))
endif
endfunction

function JNSetUnitMinRange takes unit whichUnit, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitRealField(whichUnit, UNIT_RF_MINIMUM_ATTACK_RANGE, value)
else
    call SetUnitState(whichUnit, ConvertUnitState($55), value)
endif
endfunction

function JNGetUnitTargetType takes unit whichUnit returns integer
static if REFORGED_MODE then
    return BlzGetUnitIntegerField(whichUnit, UNIT_IF_TARGETED_AS)
else
    return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($60))))
endif
endfunction

function JNSetUnitTargetType takes unit whichUnit, integer value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitIntegerField(whichUnit, UNIT_IF_TARGETED_AS, value)
else
    call SetUnitState(whichUnit, ConvertUnitState($60), value)
endif
endfunction

function JNGetUnitDiceNumber takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitDiceNumber(whichUnit, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($10))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($30))))
    endif
    return 0
endif
endfunction

function JNSetUnitDiceNumber takes unit whichUnit, integer diceNumber, integer weaponIndex returns nothing
static if REFORGED_MODE then
    call BlzSetUnitDiceNumber(whichUnit, diceNumber, weaponIndex - 1)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($10), diceNumber)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($30), diceNumber)
    endif
endif
endfunction

function JNGetUnitDiceSides takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitDiceSides(whichUnit, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($11))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($31))))
    endif
    return 0
endif
endfunction

function JNSetUnitDiceSides takes unit whichUnit, integer diceSides, integer weaponIndex returns nothing
static if REFORGED_MODE then
    call BlzSetUnitDiceSides(whichUnit, diceSides, weaponIndex - 1)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($11), diceSides)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($31), diceSides)
    endif
endif
endfunction

function JNGetUnitBaseDamage takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitBaseDamage(whichUnit, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($12))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($32))))
    endif
    return 0
endif
endfunction

function JNSetUnitBaseDamage takes unit whichUnit, integer baseDamage, integer weaponIndex returns nothing
static if REFORGED_MODE then
    call BlzSetUnitBaseDamage(whichUnit, baseDamage, weaponIndex - 1)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($12), baseDamage)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($32), baseDamage)
    endif
endif
endfunction

function JNGetUnitAttackCooldown takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitAttackCooldown(whichUnit, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($25))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($38))
    endif
    return 0.
endif
endfunction

function JNSetUnitAttackCooldown takes unit whichUnit, real cooldown, integer weaponIndex returns nothing
static if REFORGED_MODE then
    call BlzSetUnitAttackCooldown(whichUnit, cooldown, weaponIndex - 1)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($25), cooldown)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($38), cooldown)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackSound takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_WEAPON_SOUND, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($22))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($35))))
    endif
    return 0
endif
endfunction

//Unsafe
function JNSetUnitAttackSound takes unit whichUnit, integer weaponIndex, integer value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_WEAPON_SOUND, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($22), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($35), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackType takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($23))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($36))))
    endif
    return 0
endif
endfunction

//Unsafe
function JNSetUnitAttackType takes unit whichUnit, integer weaponIndex, integer value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($23), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($36), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackMaxTarget takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_MAXIMUM_NUMBER_OF_TARGETS, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($24))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($37))))
    endif
    return 0
endif
endfunction

//Unsafe
function JNSetUnitAttackMaxTarget takes unit whichUnit, integer weaponIndex, integer value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_MAXIMUM_NUMBER_OF_TARGETS, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($24), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($37), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackTargetType takes unit whichUnit, integer weaponIndex returns integer
static if REFORGED_MODE then
    return BlzGetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($29))))
    elseif weaponIndex == 2 then
        return S2I(R2S(GetUnitState(whichUnit, ConvertUnitState($45))))
    endif
    return 0
endif
endfunction

//Unsafe
function JNSetUnitAttackTargetType takes unit whichUnit, integer weaponIndex, integer value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($29), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($45), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackLossDamage takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_LOSS_FACTOR, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($21))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($34))
    endif
    return 0.
endif
endfunction

//Unsafe
function JNSetUnitAttackLossDamage takes unit whichUnit, integer weaponIndex, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_LOSS_FACTOR, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($21), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($34), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackRange takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_RANGE, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($16))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($40))
    endif
    return 0.
endif
endfunction

//Unsafe
function JNSetUnitAttackRange takes unit whichUnit, integer weaponIndex, real value returns nothing
static if REFORGED_MODE then
    if weaponIndex == 1 then
        call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_RANGE, 1, BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_RANGE, 1) - BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_RANGE, 0) + value)
    else
        call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_RANGE, weaponIndex, value)
    endif
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($16), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($40), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackSpillDistance takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_SPILL_DISTANCE, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($56))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($46))
    endif
    return 0.
endif
endfunction

//Unsafe
function JNSetUnitAttackSpillDistance takes unit whichUnit, integer weaponIndex, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_SPILL_DISTANCE, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($56), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($46), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackSpillRadius takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_SPILL_RADIUS, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($57))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($47))
    endif
    return 0.
endif
endfunction

//Unsafe
function JNSetUnitAttackSpillRadius takes unit whichUnit, integer weaponIndex, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_SPILL_RADIUS, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($57), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($47), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackBackswing takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_BACKSWING_POINT, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($28))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($44))
    endif
    return 0.
endif
endfunction

//Unsafe
function JNSetUnitAttackBackswing takes unit whichUnit, integer weaponIndex, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_BACKSWING_POINT, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($28), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($44), value)
    endif
endif
endfunction

//Unsafe
function JNGetUnitAttackDamagePoint takes unit whichUnit, integer weaponIndex returns real
static if REFORGED_MODE then
    return BlzGetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_POINT, weaponIndex - 1)
else
    if weaponIndex == 1 then
        return GetUnitState(whichUnit, ConvertUnitState($26))
    elseif weaponIndex == 2 then
        return GetUnitState(whichUnit, ConvertUnitState($39))
    endif
    return 0.
endif
endfunction

//Unsafe
function JNSetUnitAttackDamagePoint takes unit whichUnit, integer weaponIndex, real value returns nothing
static if REFORGED_MODE then
    call BlzSetUnitWeaponRealField(whichUnit, UNIT_WEAPON_RF_ATTACK_DAMAGE_POINT, weaponIndex - 1, value)
else
    if weaponIndex == 1 then
        call SetUnitState(whichUnit, ConvertUnitState($26), value)
    elseif weaponIndex == 2 then
        call SetUnitState(whichUnit, ConvertUnitState($39), value)
    endif
endif
endfunction
endlibrary