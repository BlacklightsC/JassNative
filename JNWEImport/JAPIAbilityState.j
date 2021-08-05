library JAPIAbilityState
globals
    constant integer ABILITY_STATE_COOLDOWN         = 1                             // +

	constant integer ABILITY_DATA_TARGS             = 100 // integer    ('atar')    // X
	constant integer ABILITY_DATA_CAST              = 101 // real       ('acas')    // -
	constant integer ABILITY_DATA_DUR               = 102 // real       ('adur')    // -
	constant integer ABILITY_DATA_HERODUR           = 103 // real       ('ahdu')    // -
	constant integer ABILITY_DATA_COST              = 104 // integer    ('amcs')    // +
	constant integer ABILITY_DATA_COOL              = 105 // real       ('acdn')    // +
	constant integer ABILITY_DATA_AREA              = 106 // real       ('aare')    // -
	constant integer ABILITY_DATA_RNG               = 107 // real       ('aran')    // -
	constant integer ABILITY_DATA_DATA_A            = 108 // real       ('....')
	constant integer ABILITY_DATA_DATA_B            = 109 // real       ('....')
	constant integer ABILITY_DATA_DATA_C            = 110 // real       ('....')
	constant integer ABILITY_DATA_DATA_D            = 111 // real       ('....')
	constant integer ABILITY_DATA_DATA_E            = 112 // real       ('....')
	constant integer ABILITY_DATA_DATA_F            = 113 // real       ('....')
	constant integer ABILITY_DATA_DATA_G            = 114 // real       ('....')
	constant integer ABILITY_DATA_DATA_H            = 115 // real       ('....')
	constant integer ABILITY_DATA_DATA_I            = 116 // real       ('....')
	constant integer ABILITY_DATA_UNITID            = 117 // integer    ('Emeu')    // X

	constant integer ABILITY_DATA_HOTKET            = 200 // integer    ('ahky')    // X
	constant integer ABILITY_DATA_UNHOTKET          = 201 // integer    ('auhk')    // X
	constant integer ABILITY_DATA_RESEARCH_HOTKEY   = 202 // integer    ('arhk')    // X
	constant integer ABILITY_DATA_NAME              = 203 // string     ('anam')    // *
	constant integer ABILITY_DATA_ART               = 204 // string     ('aart')    // +
	constant integer ABILITY_DATA_TARGET_ART        = 205 // string     ('atat')    // -
	constant integer ABILITY_DATA_CASTER_ART        = 206 // string     ('acat')    // -
	constant integer ABILITY_DATA_EFFECT_ART        = 207 // string     ('aeat')    // -
	constant integer ABILITY_DATA_AREAEFFECT_ART    = 208 // string     ('aaea')    // -
	constant integer ABILITY_DATA_MISSILE_ART       = 209 // string     ('amat')    // -
	constant integer ABILITY_DATA_SPECIAL_ART       = 210 // string     ('asat')    // -
	constant integer ABILITY_DATA_LIGHTNING_EFFECT  = 211 // string     ('alig')    // -
	constant integer ABILITY_DATA_BUFF_TIP          = 212 // string     ('ftip')    // X
	constant integer ABILITY_DATA_BUFF_UBERTIP      = 213 // string     ('fube')    // X
	constant integer ABILITY_DATA_RESEARCH_TIP      = 214 // string     ('aret')    // +
	constant integer ABILITY_DATA_TIP               = 215 // string     ('atp1')    // +
	constant integer ABILITY_DATA_UNTIP             = 216 // string     ('aut1')    // +
	constant integer ABILITY_DATA_RESEARCH_UBERTIP  = 217 // string     ('arut')    // +
	constant integer ABILITY_DATA_UBERTIP           = 218 // string     ('aub1')    // +
	constant integer ABILITY_DATA_UNUBERTIP         = 219 // string     ('auu1')    // +
	constant integer ABILITY_DATA_UNART             = 220 // string     ('auar')    // +
endglobals

static if REFORGED_MODE then
    native BlzSetAbilityTooltip takes integer abilCode, string tooltip, integer level returns nothing
    native BlzSetAbilityActivatedTooltip takes integer abilCode, string tooltip, integer level returns nothing
    native BlzSetAbilityExtendedTooltip takes integer abilCode, string extendedTooltip, integer level returns nothing
    native BlzSetAbilityActivatedExtendedTooltip takes integer abilCode, string extendedTooltip, integer level returns nothing
    native BlzSetAbilityResearchTooltip takes integer abilCode, string researchTooltip, integer level returns nothing
    native BlzSetAbilityResearchExtendedTooltip takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
    native BlzGetAbilityTooltip takes integer abilCode, integer level returns string
    native BlzGetAbilityActivatedTooltip takes integer abilCode, integer level returns string
    native BlzGetAbilityExtendedTooltip takes integer abilCode, integer level returns string
    native BlzGetAbilityActivatedExtendedTooltip takes integer abilCode, integer level returns string
    native BlzGetAbilityResearchTooltip takes integer abilCode, integer level returns string
    native BlzGetAbilityResearchExtendedTooltip takes integer abilCode, integer level returns string
    native BlzSetAbilityIcon takes integer abilCode, string iconPath returns nothing
    native BlzGetAbilityIcon takes integer abilCode returns string
    native BlzSetAbilityActivatedIcon takes integer abilCode, string iconPath returns nothing
    native BlzGetAbilityActivatedIcon takes integer abilCode returns string
    native BlzSetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level, real cooldown returns nothing
    native BlzGetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level returns real
    native BlzGetUnitAbilityCooldownRemaining takes unit whichUnit, integer abilId returns real
    native BlzEndUnitAbilityCooldown takes unit whichUnit, integer abilCode returns nothing
    native BlzStartUnitAbilityCooldown takes unit whichUnit, integer abilCode, real cooldown returns nothing
    native BlzGetUnitAbilityManaCost takes unit whichUnit, integer abilId, integer level returns integer
    native BlzSetUnitAbilityManaCost takes unit whichUnit, integer abilId, integer level, integer manaCost returns nothing

    native BlzGetUnitAbility takes unit whichUnit, integer abilId returns ability
    native BlzGetUnitAbilityByIndex takes unit whichUnit, integer index returns ability

    native BlzGetAbilityBooleanField takes ability whichAbility, abilitybooleanfield whichField returns boolean
    native BlzGetAbilityIntegerField takes ability whichAbility, abilityintegerfield whichField returns integer
    native BlzGetAbilityRealField takes ability whichAbility, abilityrealfield whichField returns real
    native BlzGetAbilityStringField takes ability whichAbility, abilitystringfield whichField returns string
    native BlzGetAbilityBooleanLevelField takes ability whichAbility, abilitybooleanlevelfield whichField, integer level returns boolean
    native BlzGetAbilityIntegerLevelField takes ability whichAbility, abilityintegerlevelfield whichField, integer level returns integer
    native BlzGetAbilityRealLevelField takes ability whichAbility, abilityreallevelfield whichField, integer level returns real
    native BlzGetAbilityStringLevelField takes ability whichAbility, abilitystringlevelfield whichField, integer level returns string

    native BlzSetAbilityBooleanField takes ability whichAbility, abilitybooleanfield whichField, boolean value returns boolean
    native BlzSetAbilityIntegerField takes ability whichAbility, abilityintegerfield whichField, integer value returns boolean
    native BlzSetAbilityRealField takes ability whichAbility, abilityrealfield whichField, real value returns boolean
    native BlzSetAbilityStringField takes ability whichAbility, abilitystringfield whichField, string value returns boolean
    native BlzSetAbilityBooleanLevelField takes ability whichAbility, abilitybooleanlevelfield whichField, integer level, boolean value returns boolean
    native BlzSetAbilityIntegerLevelField takes ability whichAbility, abilityintegerlevelfield whichField, integer level, integer value returns boolean
    native BlzSetAbilityRealLevelField takes ability whichAbility, abilityreallevelfield whichField, integer level, real value returns boolean
    native BlzSetAbilityStringLevelField takes ability whichAbility, abilitystringlevelfield whichField, integer level, string value returns boolean
else
    native EXGetUnitAbility takes unit u, integer abilcode returns ability
    native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
    native EXGetAbilityId takes ability abil returns integer
    native EXGetAbilityState takes ability abil, integer state_type returns real
    native EXSetAbilityState takes ability abil, integer state_type, real value returns boolean
    native EXGetAbilityDataReal takes ability abil, integer level, integer data_type returns real
    native EXSetAbilityDataReal takes ability abil, integer level, integer data_type, real value returns boolean
    native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
    native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
    native EXGetAbilityDataString takes ability abil, integer level, integer data_type returns string
    native EXSetAbilityDataString takes ability abil, integer level, integer data_type, string value returns boolean
    native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean

    native EXGetBuffDataString takes integer buffcode, integer data_type returns string
    native EXSetBuffDataString takes integer buffcode, integer data_type, string value returns boolean
    native EXGetAbilityString takes integer abilcode, integer level, integer data_type returns string
    native EXSetAbilityString takes integer abilcode, integer level, integer data_type, string value returns boolean
endif

function JNSetAbilityTooltip takes integer abilCode, string tooltip, integer level returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityTooltip(abilCode, tooltip, level)
else
    call EXSetAbilityString(abilCode, level, ABILITY_DATA_TIP, tooltip)
endif
endfunction

function JNSetAbilityActivatedTooltip takes integer abilCode, string tooltip, integer level returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityActivatedTooltip(abilCode, tooltip, level)
else
    call EXSetAbilityString(abilCode, level, ABILITY_DATA_UNTIP, tooltip)
endif
endfunction

function JNSetAbilityExtendedTooltip takes integer abilCode, string extendedTooltip, integer level returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityExtendedTooltip(abilCode, extendedTooltip, level)
else
    call EXSetAbilityString(abilCode, level, ABILITY_DATA_UBERTIP, extendedTooltip)
endif
endfunction

function JNSetAbilityActivatedExtendedTooltip takes integer abilCode, string extendedTooltip, integer level returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityActivatedExtendedTooltip(abilCode, extendedTooltip, level)
else
    call EXSetAbilityString(abilCode, level, ABILITY_DATA_UNUBERTIP, extendedTooltip)
endif
endfunction

function JNSetAbilityResearchTooltip takes integer abilCode, string researchTooltip, integer level returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityResearchTooltip(abilCode, researchTooltip, level)
else
    call EXSetAbilityString(abilCode, level, ABILITY_DATA_RESEARCH_TIP, researchTooltip)
endif
endfunction

function JNSetAbilityResearchExtendedTooltip takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityResearchExtendedTooltip(abilCode, researchExtendedTooltip, level)
else
    call EXSetAbilityString(abilCode, level, ABILITY_DATA_RESEARCH_UBERTIP, researchExtendedTooltip)
endif
endfunction

function JNGetAbilityTooltip takes integer abilCode, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityTooltip(abilCode, level)
else
    return EXGetAbilityString(abilCode, level, ABILITY_DATA_TIP)
endif
endfunction

function JNGetAbilityActivatedTooltip takes integer abilCode, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityActivatedTooltip(abilCode, level)
else
    return EXGetAbilityString(abilCode, level, ABILITY_DATA_UNTIP)
endif
endfunction

function JNGetAbilityExtendedTooltip takes integer abilCode, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityExtendedTooltip(abilCode, level)
else
    return EXGetAbilityString(abilCode, level, ABILITY_DATA_UBERTIP)
endif
endfunction

function JNGetAbilityActivatedExtendedTooltip takes integer abilCode, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityActivatedExtendedTooltip(abilCode, level)
else
    return EXGetAbilityString(abilCode, level, ABILITY_DATA_UNUBERTIP)
endif
endfunction

function JNGetAbilityResearchTooltip takes integer abilCode, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityResearchTooltip(abilCode, level)
else
    return EXGetAbilityString(abilCode, level, ABILITY_DATA_RESEARCH_TIP)
endif
endfunction

function JNGetAbilityResearchExtendedTooltip takes integer abilCode, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityResearchExtendedTooltip(abilCode, level)
else
    return EXGetAbilityString(abilCode, level, ABILITY_DATA_RESEARCH_UBERTIP)
endif
endfunction

function JNSetAbilityIcon takes integer abilCode, string iconPath returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityIcon(abilCode, iconPath)
else
    call EXSetAbilityString(abilCode, 1, ABILITY_DATA_ART, iconPath)
endif
endfunction

function JNGetAbilityIcon takes integer abilCode returns string
static if REFORGED_MODE then
    return BlzGetAbilityIcon(abilCode)
else
    return EXGetAbilityString(abilCode, 1, ABILITY_DATA_ART)
endif
endfunction

function JNSetAbilityActivatedIcon takes integer abilCode, string iconPath returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityActivatedIcon(abilCode, iconPath)
else
    call EXSetAbilityString(abilCode, 1, ABILITY_DATA_UNART, iconPath)
endif
endfunction

function JNGetAbilityActivatedIcon takes integer abilCode returns string
static if REFORGED_MODE then
    return BlzGetAbilityActivatedIcon(abilCode)
else
    return EXGetAbilityString(abilCode, 1, ABILITY_DATA_UNART)
endif
endfunction

function JNSetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level, real cooldown returns nothing
static if REFORGED_MODE then
    call BlzSetUnitAbilityCooldown(whichUnit, abilId, level, cooldown)
else
    call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_COOL, cooldown)
endif
endfunction

function JNGetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level returns real
static if REFORGED_MODE then
    return BlzGetUnitAbilityCooldown(whichUnit, abilId, level)
else
    return EXGetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_COOL)
endif
endfunction

function JNGetUnitAbilityCooldownRemaining takes unit whichUnit, integer abilId returns real
static if REFORGED_MODE then
    return BlzGetUnitAbilityCooldownRemaining(whichUnit, abilId)
else
    return EXGetAbilityState(EXGetUnitAbility(whichUnit, abilId), ABILITY_STATE_COOLDOWN)
endif
endfunction

function JNEndUnitAbilityCooldown takes unit whichUnit, integer abilCode returns nothing
static if REFORGED_MODE then
    call BlzEndUnitAbilityCooldown(whichUnit, abilCode)
else
    call EXSetAbilityState(EXGetUnitAbility(whichUnit, abilCode), ABILITY_STATE_COOLDOWN, 0)
endif
endfunction

function JNStartUnitAbilityCooldown takes unit whichUnit, integer abilCode, real cooldown returns nothing
static if REFORGED_MODE then
    call BlzStartUnitAbilityCooldown(whichUnit, abilCode, cooldown)
else
    call EXSetAbilityState(EXGetUnitAbility(whichUnit, abilCode), ABILITY_STATE_COOLDOWN, cooldown)
endif
endfunction

function JNGetUnitAbilityManaCost takes unit whichUnit, integer abilId, integer level returns integer
static if REFORGED_MODE then
    return BlzGetUnitAbilityManaCost(whichUnit, abilId, level)
else
    return EXGetAbilityDataInteger(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_COST)
endif
endfunction

function JNSetUnitAbilityManaCost takes unit whichUnit, integer abilId, integer level, integer manaCost returns nothing
static if REFORGED_MODE then
    call BlzSetUnitAbilityManaCost(whichUnit, abilId, level, manaCost)
else
    call EXSetAbilityDataInteger(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_COST, manaCost)
endif
endfunction

function JNGetUnitAbility takes unit whichUnit, integer abilId returns ability
static if REFORGED_MODE then
    return BlzGetUnitAbility(whichUnit, abilId)
else
    return EXGetUnitAbility(whichUnit, abilId)
endif
endfunction

function JNGetUnitAbilityByIndex takes unit whichUnit, integer index returns ability
static if REFORGED_MODE then
    return BlzGetUnitAbilityByIndex(whichUnit, index)
else
    return EXGetUnitAbilityByIndex(whichUnit, index)
endif
endfunction

//Unsafe
function JNGetUnitAbilityCastingTime takes unit whichUnit, integer abilId, integer level returns real
static if REFORGED_MODE then
    return BlzGetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_CASTING_TIME, level)
else
    return EXGetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_CAST)
endif
endfunction

//Unsafe
function JNGetUnitAbilityDurationByNormal takes unit whichUnit, integer abilId, integer level returns real
static if REFORGED_MODE then
    return BlzGetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_DURATION_NORMAL, level)
else
    return EXGetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_DUR)
endif
endfunction

//Unsafe
function JNGetUnitAbilityDurationByHero takes unit whichUnit, integer abilId, integer level returns real
static if REFORGED_MODE then
    return BlzGetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_DURATION_HERO, level)
else
    return EXGetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_HERODUR)
endif
endfunction

//Unsafe
function JNGetUnitAbilityAreaOfEffect takes unit whichUnit, integer abilId, integer level returns real
static if REFORGED_MODE then
    return BlzGetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_AREA_OF_EFFECT, level)
else
    return EXGetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_AREA)
endif
endfunction

//Unsafe
function JNGetUnitAbilityCastRange takes unit whichUnit, integer abilId, integer level returns real
static if REFORGED_MODE then
    return BlzGetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_CAST_RANGE, level)
else
    return EXGetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_RNG)
endif
endfunction

//Unsafe
function JNGetUnitAbilityName takes unit whichUnit, integer abilId returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SF_NAME)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), 1, ABILITY_DATA_NAME)
endif
endfunction

//Unsafe
function JNGetUnitAbilityTargetArt takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_TARGET, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_TARGET_ART)
endif
endfunction

//Unsafe
function JNGetUnitAbilityCasterArt takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_CASTER, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_CASTER_ART)
endif
endfunction

//Unsafe
function JNGetUnitAbilityEffectArt takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_EFFECT, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_EFFECT_ART)
endif
endfunction

//Unsafe
function JNGetUnitAbilityAreaEffectArt takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_AREA_EFFECT, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_AREAEFFECT_ART)
endif
endfunction

//Unsafe
function JNGetUnitAbilityMissileArt takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_MISSILE_ART, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_MISSILE_ART)
endif
endfunction

//Unsafe
function JNGetUnitAbilitySpecialArt takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_SPECIAL, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_SPECIAL_ART)
endif
endfunction

//Unsafe
function JNGetUnitAbilityLightningEffect takes unit whichUnit, integer abilId, integer level returns string
static if REFORGED_MODE then
    return BlzGetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_LIGHTNING_EFFECTS, level)
else
    return EXGetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_LIGHTNING_EFFECT)
endif
endfunction

//Unsafe
function JNSetUnitAbilityCastingTime takes unit whichUnit, integer abilId, integer level, real value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_CASTING_TIME, level, value)
else
    call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_CAST, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityDurationByNormal takes unit whichUnit, integer abilId, integer level, real value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_DURATION_NORMAL, level, value)
else
    call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_DUR, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityDurationByHero takes unit whichUnit, integer abilId, integer level, real value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_DURATION_HERO, level, value)
else
    call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_HERODUR, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityAreaOfEffect takes unit whichUnit, integer abilId, integer level, real value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_AREA_OF_EFFECT, level, value)
else
    call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_AREA, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityCastRange takes unit whichUnit, integer abilId, integer level, real value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityRealLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_RLF_CAST_RANGE, level, value)
else
    call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_RNG, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityName takes unit whichUnit, integer abilId, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SF_NAME,  value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), 1, ABILITY_DATA_NAME, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityTargetArt takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_TARGET, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_TARGET_ART, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityCasterArt takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_CASTER, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_CASTER_ART, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityEffectArt takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_EFFECT, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_EFFECT_ART, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityAreaEffectArt takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_AREA_EFFECT, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_AREAEFFECT_ART, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityMissileArt takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_MISSILE_ART, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_MISSILE_ART, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilitySpecialArt takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_SPECIAL, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_SPECIAL_ART, value)
endif
endfunction

//Unsafe
function JNSetUnitAbilityLightningEffect takes unit whichUnit, integer abilId, integer level, string value returns nothing
static if REFORGED_MODE then
    call BlzSetAbilityStringLevelField(BlzGetUnitAbility(whichUnit, abilId), ABILITY_SLF_LIGHTNING_EFFECTS, level, value)
else
    call EXSetAbilityDataString(EXGetUnitAbility(whichUnit, abilId), level, ABILITY_DATA_LIGHTNING_EFFECT, value)
endif
endfunction
endlibrary