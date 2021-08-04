library JNServer
static if not REFORGED_MODE then
    native JNUse takes nothing returns boolean
    native JNPVPUse takes string MapId, string SecretKey returns nothing
    native JNObjectCharacterInit takes string MapId, string UserId, string SecretKey, string Character returns integer
    native JNObjectCharacterSave takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNObjectCharacterUseEndGameSave takes string MapId, string UserId, string SecretKey, string Character returns nothing
    native JNObjectCharacterSetInt takes string UserId, string Field, integer value returns nothing
    native JNObjectCharacterGetInt takes string UserId, string Field returns integer
    native JNObjectCharacterSetString takes string UserId, string Field, string value returns nothing
    native JNObjectCharacterGetString takes string UserId, string Field returns string
    native JNObjectCharacterSetBoolean takes string UserId, string Field, boolean value returns nothing
    native JNObjectCharacterGetBoolean takes string UserId, string Field returns boolean
    native JNObjectCharacterSetReal takes string UserId, string Field, real value returns nothing
    native JNObjectCharacterGetReal takes string UserId, string Field returns real
    native JNObjectCharacterSetScore takes string UserId, integer value returns nothing
    native JNObjectCharacterAddScore takes string UserId, integer value returns nothing
    native JNObjectCharacterResetScore takes string UserId returns nothing
    native JNObjectCharacterRemoveField takes string UserId, string Field returns nothing
    native JNObjectCharacterClearField takes string UserId returns nothing
    native JNObjectCharacterGetCharacterCount takes string MapId, string UserId, string SecretKey returns integer
    native JNObjectCharacterGetCharacterNameByIndex takes string UserId, integer index returns string
    native JNObjectCharacterPopGlobalMessage takes nothing returns string
    native JNObjectCharacterSendGlobalMessage takes string message returns nothing
    native JNObjectCharacterResetCharacter takes string UserId returns nothing
    native JNObjectUserInit takes string MapId, string UserId, string SecretKey, string Character returns integer
    native JNObjectUserSave takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNObjectUserUseEndGameSave takes string MapId, string UserId, string SecretKey, string Character returns nothing
    native JNObjectUserSetInt takes string UserId, string Field, integer value returns nothing
    native JNObjectUserGetInt takes string UserId, string Field returns integer
    native JNObjectUserSetString takes string UserId, string Field, string value returns nothing
    native JNObjectUserGetString takes string UserId, string Field returns string
    native JNObjectUserSetBoolean takes string UserId, string Field, boolean value returns nothing
    native JNObjectUserGetBoolean takes string UserId, string Field returns boolean
    native JNObjectUserSetReal takes string UserId, string Field, real value returns nothing
    native JNObjectUserGetReal takes string UserId, string Field returns real
    native JNObjectUserRemoveField takes string UserId, string Field returns nothing
    native JNObjectUserClearField takes string UserId returns nothing
    native JNObjectUserResetCharacter takes string UserId returns nothing
    native JNObjectMapInit takes string MapId, string SecretKey returns integer
    native JNObjectMapGetInt takes string Field returns integer
    native JNObjectMapGetString takes string Field returns string
    native JNObjectMapGetBoolean takes string Field returns boolean
    native JNObjectMapGetReal takes string Field returns real
    native JNPVPLog takes string UserId, string Log returns nothing
    native JNPVPCharacter takes string UserId, string Character returns nothing
    native JNPVPKill takes string UserId returns nothing
    native JNPVPDeath takes string UserId returns nothing
    native JNPVPAssist takes string UserId returns nothing
    native JNPVPWin takes string UserId, boolean Win returns nothing
    native JNSetPVPLog takes string MapId, string UserId, string SecretKey, string Character, boolean Win, integer Kill, integer Death, integer Assist, string Loging returns string
    native JNSetSaveCode takes string MapId, string UserId, string SecretKey, string Character, string Code returns string
    native JNGetLoadCode takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNSetLog takes string MapId, string UserId, string SecretKey, string Character, string Version, string Loging returns string
    native JNOpenBrowser takes string uri returns nothing
    native JNServerTime takes string Format returns string
    native JNServerUnixTime takes nothing returns integer
    native JNServerPluginVersion takes nothing returns integer
endif
endlibrary