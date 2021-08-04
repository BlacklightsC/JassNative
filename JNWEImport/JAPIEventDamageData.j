library JAPIEventDamageData
globals
    constant integer EVENT_DAMAGE_DATA_VAILD       = 0
    constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL = 1
    //constant integer EVENT_DAMAGE_DATA_IS_ATTACK   = 2
    constant integer EVENT_DAMAGE_DATA_IS_RANGED   = 3
    //constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
    //constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE = 5
    //constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE = 6
endglobals

static if REFORGED_MODE then
    native BlzSetEventDamage takes real damage returns boolean
    native BlzGetEventAttackType takes nothing returns attacktype
    native BlzGetEventDamageType takes nothing returns damagetype
    native BlzGetEventWeaponType takes nothing returns weapontype
    native BlzGetEventIsAttack takes nothing returns boolean
else
    native EXSetEventDamage takes real amount returns boolean
    native EXGetEventDamageData takes integer edd_type returns integer
endif

//가할 피해량 설정
function JNSetEventDamage takes real amount returns nothing
static if REFORGED_MODE then
    call BlzSetEventDamage(amount)
else
    call EXSetEventDamage(amount)
endif
endfunction

//피해를 가한 공격 유형
function JNGetEventAttackType takes nothing returns attacktype
static if REFORGED_MODE then
    return BlzGetEventAttackType()
else
    return ConvertAttackType(EXGetEventDamageData(6))
endif
endfunction

//피해를 가한 피해 유형
function JNGetEventDamageType takes nothing returns damagetype
static if REFORGED_MODE then
    return BlzGetEventDamageType()
else
    return ConvertDamageType(EXGetEventDamageData(4))
endif
endfunction

//피해를 가한 무기 유형
function JNGetEventWeaponType takes nothing returns weapontype
static if REFORGED_MODE then
    return BlzGetEventWeaponType()
else
    return ConvertWeaponType(EXGetEventDamageData(5))
endif
endfunction

//가한 피해는 일반 공격임
function JNGetEventIsAttack takes nothing returns boolean
static if REFORGED_MODE then
    return BlzGetEventIsAttack()
else
    return 0 != EXGetEventDamageData(2)
endif
endfunction
endlibrary