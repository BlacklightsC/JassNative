library JNServer
static if not REFORGED_MODE then
    native JNUse takes nothing returns boolean
    native JNServerPluginVersion takes nothing returns integer
    native JNCheckNameHack takes string UserId returns boolean
    native JNOpenBrowser string Address returns nothing
    native JNServerTime takes string Format returns string
    native JNServerUnixTime takes nothing returns integer
    native JNPushReg takes string MapId returns nothing
    native JNGetPushMessage takes nothing returns string
    native JNSetLog takes string MapId, string UserId, string SecretKey, string Character, string Version, string Loging returns string
    native JNSetLogUseType takes string MapId, string UserId, string SecretKey, string Character, string Version, string Loging, string LogType returns string
    native JNMapServerLog takes string MapId, string SecretKey, string Version, string Loging returns string
    native JNMapServerLogUseType takes MapId, string SecretKey, string Version, string Loging, string LogType returns string
    native JNReplayReg takes string MapId, string SecretKey, string UserId, string Character, string Loging returns nothing
    native JNScreenShotReg string MapId, string SecretKey, string UserId, string Character, string Loging returns boolean
    native JNPublicScreenShotReg takes string MapId, string SecretKey, string UserId, string Character, string Tag, string Loging returns boolean
    native JNUseUserRoleItemInfo takes string MapId, string SecretKey, string UserId, string ItemName returns string
    native JNSetSaveCode takes string MapId, string UserId, string SecretKey, string Character, string Code returns string
    native JNGetLoadCode takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNRPGGetCharacterCount takes string MapId, string UserId, string SecretKey returns integer
    native JNRPGGetCharacterNameByIndex takes string UserId, string Index returns string
    native JNObjectCharacterServerConnectCheck takes nothing returns boolean
    native JNObjectCharacterInit takes string MapId, string UserId, string SecretKey, string Character returns integer
    native JNObjectCharacterSave takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNObjectCharacterSetInt takes string UserId, string Field, integer Value returns nothing
    native JNObjectCharacterGetInt takes string UserId, string Field returns integer
    native JNObjectCharacterSetReal takes string UserId, string Field, real Value returns nothing
    native JNObjectCharacterGetReal takes string UserId, string Field returns real
    native JNObjectCharacterSetString takes string UserId, string Field, string Value returns nothing
    native JNObjectCharacterGetString takes string UserId, string Field returns string
    native JNObjectCharacterSetBoolean takes string UserId, string Field, boolean Value returns nothing
    native JNObjectCharacterGetBoolean takes string UserId, string Field returns boolean
    native JNObjectCharacterRemoveField takes string Userid, string Field returns nothing
    native JNObjectCharacterClearField takes string UserId returns nothing
    native JNObjectCharacterResetCharacter takes string UserId returns nothing
    native JNObjectScoreInit takes MapId, string SecretKey, string UserId, string Character returns integer
    native JNObjectScoreGet takes string UserId, string Field returns integer
    native JNObjectScoreAdd takes string UserId, string Field, integer Value returns nothing
    native JNObjectScoreSet takes string UserId, string Field, integer Value returns nothing
    native JNObjectScoreSave takes string MapId, string SecretKey, string UserId, string Character returns string
    native JNObjectCharacterUseEndGameSave takes string MapId, string UserId, string SecretKey, string Character returns nothing
    native JNObjectCharacterPopGlobalMessage takes nothing returns string
    native JNObjectCharacterSendGlobalMessage takes string message returns nothing
    native JNObjectCharacterGetCharacterCount takes string MapId, string UserId, string SecretKey returns integer
    native JNObjectCharacterGetCharacterNameByIndex takes string UserId, integer Index returns string
    native JNObjectUserInit takes string MapId, string Userid, string SecretKey, string Character returns integer
    native JNObjectUserSave takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNObjectUserSetInt takes string UserId, string Field, integer Value returns nothing
    native JNObjectUserGetInt takes string UserId, string Field returns integer
    native JNObjectUserSetReal takes string UserId, string Field, real Value returns nothing
    native JNObjectUserGetReal takes string UserId, string Field returns real
    native JNObjectUserSetString takes string UserId, string Field, string Value returns nothing
    native JNObjectUserGetString takes string UserId, string Field returns string
    native JNObjectUserSetBoolean takes string UserId, string Field, boolean Value returns nothing
    native JNObjectUserGetBoolean takes string UserId, string Field returns boolean
    native JNObjectUserRemoveField takes string UserId, string Field returns nothing
    native JNObjectUserClearField takes string UserId returns nothing
    native JNObjectUserResetCharacter takes string UserId returns nothing
    native JNObjectUserUseEndGameSave takes string MapId, string UserId, string SecretKey, string Character returns nothing
    native JNObjectMapInit takes string MapId, string SecretKey returns integer
    native JNObjectMapGetInt takes string Field returns integer
    native JNObjectMapGetReal takes string Field returns real
    native JNObjectMapGetString takes string Field returns string
    native JNObjectMapGetBoolean takes string Field returns boolean
endif
endlibrary