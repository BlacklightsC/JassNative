using Cirnix.JassNative.JassAPI;

namespace Cirnix.JassNative.YDWE
{
    internal static class DummyFunction
    {
        private delegate JassBoolean DzAPI_Map_SaveServerValuePrototype(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value);
        private delegate JassStringRet DzAPI_Map_GetServerValuePrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate void DzAPI_Map_Ladder_SetStatPrototype(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value);
        private delegate JassBoolean DzAPI_Map_IsRPGLadderPrototype();
        private delegate JassInteger DzAPI_Map_GetGameStartTimePrototype();
        private delegate void DzAPI_Map_Stat_SetStatPrototype(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value);
        private delegate JassInteger DzAPI_Map_GetMatchTypePrototype();
        private delegate void DzAPI_Map_Ladder_SetPlayerStatPrototype(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value);
        private delegate JassInteger DzAPI_Map_GetServerValueErrorCodePrototype(JassPlayer whichJassPlayer);
        private delegate JassInteger DzAPI_Map_GetLadderLevelPrototype(JassPlayer whichJassPlayer);
        private delegate JassBoolean DzAPI_Map_IsRedVIPPrototype(JassPlayer whichJassPlayer);
        private delegate JassBoolean DzAPI_Map_IsBlueVIPPrototype(JassPlayer whichJassPlayer);
        private delegate JassInteger DzAPI_Map_GetLadderRankPrototype(JassPlayer whichJassPlayer);
        private delegate JassInteger DzAPI_Map_GetMapLevelRankPrototype(JassPlayer whichJassPlayer);
        private delegate JassStringRet DzAPI_Map_GetGuildNamePrototype(JassPlayer whichJassPlayer);
        private delegate JassInteger DzAPI_Map_GetGuildRolePrototype(JassPlayer whichJassPlayer);
        private delegate JassBoolean DzAPI_Map_IsRPGLobbyPrototype();
        private delegate JassInteger DzAPI_Map_GetMapLevelPrototype(JassPlayer whichJassPlayer);
        private delegate void DzAPI_Map_MissionCompletePrototype(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value);
        private delegate JassStringRet DzAPI_Map_GetActivityDataPrototype();
        private delegate JassStringRet DzAPI_Map_GetMapConfigPrototype(JassStringArg key);
        private delegate JassBoolean DzAPI_Map_HasMallItemPrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate JassBoolean DzAPI_Map_SavePublicArchivePrototype(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value);
        private delegate JassStringRet DzAPI_Map_GetPublicArchivePrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate void DzAPI_Map_UseConsumablesItemPrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate void DzAPI_Map_OrpgTriggerPrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate JassStringRet DzAPI_Map_GetServerArchiveDropPrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate JassInteger DzAPI_Map_GetServerArchiveEquipPrototype(JassPlayer whichJassPlayer, JassStringArg key);
        private delegate JassInteger DzAPI_Map_GetPlatformVIPPrototype(JassPlayer whichJassPlayer);
        private delegate JassInteger RequestExtraIntegerDataPrototype(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassBoolean RequestExtraBooleanDataPrototype(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassStringRet RequestExtraStringDataPrototype(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassRealRet RequestExtraRealDataPrototype(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6);
        private delegate JassInteger DzGetUnitNeededXPPrototype(JassUnit whichUnit, JassInteger level);

        private static JassBoolean DzAPI_Map_SaveServerValue(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value) => true;
        private static JassStringRet DzAPI_Map_GetServerValue(JassPlayer whichJassPlayer, JassStringArg key) => string.Empty;
        private static void DzAPI_Map_Ladder_SetStat(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value) { }
        private static JassBoolean DzAPI_Map_IsRPGLadder() => false;
        private static JassInteger DzAPI_Map_GetGameStartTime() => 0;
        private static void DzAPI_Map_Stat_SetStat(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value) { }
        private static JassInteger DzAPI_Map_GetMatchType() => 1;
        private static void DzAPI_Map_Ladder_SetPlayerStat(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value) { }
        private static JassInteger DzAPI_Map_GetServerValueErrorCode(JassPlayer whichJassPlayer) => 0;
        private static JassInteger DzAPI_Map_GetLadderLevel(JassPlayer whichJassPlayer) => 0;
        private static JassBoolean DzAPI_Map_IsRedVIP(JassPlayer whichJassPlayer) => false;
        private static JassBoolean DzAPI_Map_IsBlueVIP(JassPlayer whichJassPlayer) => false;
        private static JassInteger DzAPI_Map_GetLadderRank(JassPlayer whichJassPlayer) => 0;
        private static JassInteger DzAPI_Map_GetMapLevelRank(JassPlayer whichJassPlayer) => 0;
        private static JassStringRet DzAPI_Map_GetGuildName(JassPlayer whichJassPlayer) => string.Empty;
        private static JassInteger DzAPI_Map_GetGuildRole(JassPlayer whichJassPlayer) => 0;
        private static JassBoolean DzAPI_Map_IsRPGLobby() => true;
        private static JassInteger DzAPI_Map_GetMapLevel(JassPlayer whichJassPlayer) => 0;
        private static void DzAPI_Map_MissionComplete(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value) { }
        private static JassStringRet DzAPI_Map_GetActivityData() => string.Empty;
        private static JassStringRet DzAPI_Map_GetMapConfig(JassStringArg key) => "1";
        private static JassBoolean DzAPI_Map_HasMallItem(JassPlayer whichJassPlayer, JassStringArg key) => false;
        private static JassBoolean DzAPI_Map_SavePublicArchive(JassPlayer whichJassPlayer, JassStringArg key, JassStringArg value) => true;
        private static JassStringRet DzAPI_Map_GetPublicArchive(JassPlayer whichJassPlayer, JassStringArg key) => string.Empty;
        private static void DzAPI_Map_UseConsumablesItem(JassPlayer whichJassPlayer, JassStringArg key) { }
        private static void DzAPI_Map_OrpgTrigger(JassPlayer whichJassPlayer, JassStringArg key) { }
        private static JassStringRet DzAPI_Map_GetServerArchiveDrop(JassPlayer whichJassPlayer, JassStringArg key) => string.Empty;
        private static JassInteger DzAPI_Map_GetServerArchiveEquip(JassPlayer whichJassPlayer, JassStringArg key) => 0;
        private static JassInteger DzAPI_Map_GetPlatformVIP(JassPlayer whichJassPlayer) => 0;
        private static JassInteger RequestExtraIntegerData(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => 0;
        private static JassBoolean RequestExtraBooleanData(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => false;
        private static JassStringRet RequestExtraStringData(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => string.Empty;
        private static JassRealRet RequestExtraRealData(JassInteger dataType, JassPlayer whichJassPlayer, JassStringArg param1, JassStringArg param2, JassBoolean param3, JassInteger param4, JassInteger param5, JassInteger param6) => 0;
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
