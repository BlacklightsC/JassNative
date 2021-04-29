using Cirnix.JassNative.JassAPI;

namespace Cirnix.JassNative.YDWE
{
    internal static class DummyFunction
    {
        private delegate JassBoolean DzAPI_Map_SaveServerValuePrototype(JassPlayer whichPlayer, JassStringArg key, JassStringArg value);
        private delegate JassStringRet DzAPI_Map_GetServerValuePrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate void DzAPI_Map_Ladder_SetStatPrototype(JassPlayer whichPlayer, JassStringArg key, JassStringArg value);
        private delegate JassBoolean DzAPI_Map_IsRPGLadderPrototype();
        private delegate JassInteger DzAPI_Map_GetGameStartTimePrototype();
        private delegate void DzAPI_Map_Stat_SetStatPrototype(JassPlayer whichPlayer, JassStringArg key, JassStringArg value);
        private delegate JassInteger DzAPI_Map_GetMatchTypePrototype();
        private delegate void DzAPI_Map_Ladder_SetPlayerStatPrototype(JassPlayer whichPlayer, JassStringArg key, JassStringArg value);
        private delegate JassInteger DzAPI_Map_GetServerValueErrorCodePrototype(JassPlayer whichPlayer);
        private delegate JassInteger DzAPI_Map_GetLadderLevelPrototype(JassPlayer whichPlayer);
        private delegate JassBoolean DzAPI_Map_IsRedVIPPrototype(JassPlayer whichPlayer);
        private delegate JassBoolean DzAPI_Map_IsBlueVIPPrototype(JassPlayer whichPlayer);
        private delegate JassInteger DzAPI_Map_GetLadderRankPrototype(JassPlayer whichPlayer);
        private delegate JassInteger DzAPI_Map_GetMapLevelRankPrototype(JassPlayer whichPlayer);
        private delegate JassStringRet DzAPI_Map_GetGuildNamePrototype(JassPlayer whichPlayer);
        private delegate JassInteger DzAPI_Map_GetGuildRolePrototype(JassPlayer whichPlayer);
        private delegate JassBoolean DzAPI_Map_IsRPGLobbyPrototype();
        private delegate JassInteger DzAPI_Map_GetMapLevelPrototype(JassPlayer whichPlayer);
        private delegate void DzAPI_Map_MissionCompletePrototype(JassPlayer whichPlayer, JassStringArg key, JassStringArg value);
        private delegate JassStringRet DzAPI_Map_GetActivityDataPrototype();
        private delegate JassStringRet DzAPI_Map_GetMapConfigPrototype(JassStringArg key);
        private delegate JassBoolean DzAPI_Map_HasMallItemPrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate JassBoolean DzAPI_Map_SavePublicArchivePrototype(JassPlayer whichPlayer, JassStringArg key, JassStringArg value);
        private delegate JassStringRet DzAPI_Map_GetPublicArchivePrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate void DzAPI_Map_UseConsumablesItemPrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate void DzAPI_Map_OrpgTriggerPrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate JassStringRet DzAPI_Map_GetServerArchiveDropPrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate JassInteger DzAPI_Map_GetServerArchiveEquipPrototype(JassPlayer whichPlayer, JassStringArg key);
        private delegate JassInteger DzAPI_Map_GetPlatformVIPPrototype(JassPlayer whichPlayer);
        private delegate JassInteger RequestExtraIntegerDataPrototype(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassBoolean RequestExtraBooleanDataPrototype(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassStringRet RequestExtraStringDataPrototype(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassRealRet RequestExtraRealDataPrototype(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassInteger DzGetUnitNeededXPPrototype(JassUnit whichUnit, JassInteger level);

        private static JassBoolean DzAPI_Map_SaveServerValue(JassPlayer whichPlayer, JassStringArg key, JassStringArg value) => true;
        private static JassStringRet DzAPI_Map_GetServerValue(JassPlayer whichPlayer, JassStringArg key) => string.Empty;
        private static void DzAPI_Map_Ladder_SetStat(JassPlayer whichPlayer, JassStringArg key, JassStringArg value) { }
        private static JassBoolean DzAPI_Map_IsRPGLadder() => false;
        private static JassInteger DzAPI_Map_GetGameStartTime() => 0;
        private static void DzAPI_Map_Stat_SetStat(JassPlayer whichPlayer, JassStringArg key, JassStringArg value) { }
        private static JassInteger DzAPI_Map_GetMatchType() => 1;
        private static void DzAPI_Map_Ladder_SetPlayerStat(JassPlayer whichPlayer, JassStringArg key, JassStringArg value) { }
        private static JassInteger DzAPI_Map_GetServerValueErrorCode(JassPlayer whichPlayer) => 0;
        private static JassInteger DzAPI_Map_GetLadderLevel(JassPlayer whichPlayer) => 0;
        private static JassBoolean DzAPI_Map_IsRedVIP(JassPlayer whichPlayer) => false;
        private static JassBoolean DzAPI_Map_IsBlueVIP(JassPlayer whichPlayer) => false;
        private static JassInteger DzAPI_Map_GetLadderRank(JassPlayer whichPlayer) => 0;
        private static JassInteger DzAPI_Map_GetMapLevelRank(JassPlayer whichPlayer) => 0;
        private static JassStringRet DzAPI_Map_GetGuildName(JassPlayer whichPlayer) => string.Empty;
        private static JassInteger DzAPI_Map_GetGuildRole(JassPlayer whichPlayer) => 0;
        private static JassBoolean DzAPI_Map_IsRPGLobby() => true;
        private static JassInteger DzAPI_Map_GetMapLevel(JassPlayer whichPlayer) => 0;
        private static void DzAPI_Map_MissionComplete(JassPlayer whichPlayer, JassStringArg key, JassStringArg value) { }
        private static JassStringRet DzAPI_Map_GetActivityData() => string.Empty;
        private static JassStringRet DzAPI_Map_GetMapConfig(JassStringArg key) => "1";
        private static JassBoolean DzAPI_Map_HasMallItem(JassPlayer whichPlayer, JassStringArg key) => false;
        private static JassBoolean DzAPI_Map_SavePublicArchive(JassPlayer whichPlayer, JassStringArg key, JassStringArg value) => true;
        private static JassStringRet DzAPI_Map_GetPublicArchive(JassPlayer whichPlayer, JassStringArg key) => string.Empty;
        private static void DzAPI_Map_UseConsumablesItem(JassPlayer whichPlayer, JassStringArg key) { }
        private static void DzAPI_Map_OrpgTrigger(JassPlayer whichPlayer, JassStringArg key) { }
        private static JassStringRet DzAPI_Map_GetServerArchiveDrop(JassPlayer whichPlayer, JassStringArg key) => string.Empty;
        private static JassInteger DzAPI_Map_GetServerArchiveEquip(JassPlayer whichPlayer, JassStringArg key) => 0;
        private static JassInteger DzAPI_Map_GetPlatformVIP(JassPlayer whichPlayer) => 0;
        private static JassInteger RequestExtraIntegerData(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => 0;
        private static JassBoolean RequestExtraBooleanData(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => false;
        private static JassStringRet RequestExtraStringData(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => string.Empty;
        private static JassRealRet RequestExtraRealData(JassInteger dataType, JassPlayer whichPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => 0;
        private static JassInteger DzGetUnitNeededXP(JassUnit whichUnit, JassInteger level) => 0;


        internal static void Initialize()
        {
            Natives.Add(new DzAPI_Map_SaveServerValuePrototype(DzAPI_Map_SaveServerValue), false);
            Natives.Add(new DzAPI_Map_GetServerValuePrototype(DzAPI_Map_GetServerValue), false);
            Natives.Add(new DzAPI_Map_Ladder_SetStatPrototype(DzAPI_Map_Ladder_SetStat), false);
            Natives.Add(new DzAPI_Map_IsRPGLadderPrototype(DzAPI_Map_IsRPGLadder), false);
            Natives.Add(new DzAPI_Map_GetGameStartTimePrototype(DzAPI_Map_GetGameStartTime), false);
            Natives.Add(new DzAPI_Map_Stat_SetStatPrototype(DzAPI_Map_Stat_SetStat), false);
            Natives.Add(new DzAPI_Map_GetMatchTypePrototype(DzAPI_Map_GetMatchType), false);
            Natives.Add(new DzAPI_Map_Ladder_SetPlayerStatPrototype(DzAPI_Map_Ladder_SetPlayerStat), false);
            Natives.Add(new DzAPI_Map_GetServerValueErrorCodePrototype(DzAPI_Map_GetServerValueErrorCode), false);
            Natives.Add(new DzAPI_Map_GetLadderLevelPrototype(DzAPI_Map_GetLadderLevel), false);
            Natives.Add(new DzAPI_Map_IsRedVIPPrototype(DzAPI_Map_IsRedVIP), false);
            Natives.Add(new DzAPI_Map_IsBlueVIPPrototype(DzAPI_Map_IsBlueVIP), false);
            Natives.Add(new DzAPI_Map_GetLadderRankPrototype(DzAPI_Map_GetLadderRank), false);
            Natives.Add(new DzAPI_Map_GetMapLevelRankPrototype(DzAPI_Map_GetMapLevelRank), false);
            Natives.Add(new DzAPI_Map_GetGuildNamePrototype(DzAPI_Map_GetGuildName), false);
            Natives.Add(new DzAPI_Map_GetGuildRolePrototype(DzAPI_Map_GetGuildRole), false);
            Natives.Add(new DzAPI_Map_IsRPGLobbyPrototype(DzAPI_Map_IsRPGLobby), false);
            Natives.Add(new DzAPI_Map_GetMapLevelPrototype(DzAPI_Map_GetMapLevel), false);
            Natives.Add(new DzAPI_Map_MissionCompletePrototype(DzAPI_Map_MissionComplete), false);
            Natives.Add(new DzAPI_Map_GetActivityDataPrototype(DzAPI_Map_GetActivityData), false);
            Natives.Add(new DzAPI_Map_GetMapConfigPrototype(DzAPI_Map_GetMapConfig), false);
            Natives.Add(new DzAPI_Map_HasMallItemPrototype(DzAPI_Map_HasMallItem), false);
            Natives.Add(new DzAPI_Map_SavePublicArchivePrototype(DzAPI_Map_SavePublicArchive), false);
            Natives.Add(new DzAPI_Map_GetPublicArchivePrototype(DzAPI_Map_GetPublicArchive), false);
            Natives.Add(new DzAPI_Map_UseConsumablesItemPrototype(DzAPI_Map_UseConsumablesItem), false);
            Natives.Add(new DzAPI_Map_OrpgTriggerPrototype(DzAPI_Map_OrpgTrigger), false);
            Natives.Add(new DzAPI_Map_GetServerArchiveDropPrototype(DzAPI_Map_GetServerArchiveDrop), false);
            Natives.Add(new DzAPI_Map_GetServerArchiveEquipPrototype(DzAPI_Map_GetServerArchiveEquip), false);
            Natives.Add(new DzAPI_Map_GetPlatformVIPPrototype(DzAPI_Map_GetPlatformVIP), false);
            Natives.Add(new RequestExtraIntegerDataPrototype(RequestExtraIntegerData), false);
            Natives.Add(new RequestExtraBooleanDataPrototype(RequestExtraBooleanData), false);
            Natives.Add(new RequestExtraStringDataPrototype(RequestExtraStringData), false);
            Natives.Add(new RequestExtraRealDataPrototype(RequestExtraRealData), false);
            Natives.Add(new DzGetUnitNeededXPPrototype(DzGetUnitNeededXP), false);
        }
    }
}
