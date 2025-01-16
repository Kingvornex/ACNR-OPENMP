
// ACNR Dynamic UFO vehicle

// Don't display the message about caching the code (with `YSI_YES_MODE_CACHE`).
#define YSI_NO_CACHE_MESSAGE

// Don't display the message about startup optimisation (it still happens, you just aren't told).
#define YSI_NO_OPTIMISATION_MESSAGE

#include <open.mp>
#include <streamer>
#include <izcmd>

new ShipDynamicObject[MAX_VEHICLES];
new isufoveh[MAX_VEHICLES];

public OnFilterScriptInit()
{
    printf("||================================||");
    printf("||========= UFO Vehicle ==========||");
    printf("||= RCON CMD : /ufo & /removeufo =||");
    printf("||================================||");
    printf("||================================||");

	for(new i = 0; i < MAX_VEHICLES; ++i)
	{
		ShipDynamicObject[i] = INVALID_OBJECT_ID;
		isufoveh[i] = -1;
	}
	return 1;
}
public OnFilterScriptExit()
{
	for(new i; i < MAX_VEHICLES; ++i)
	{
	    if(IsValidDynamicObject(ShipDynamicObject[i]))
	    {
	        DestroyDynamicObject(ShipDynamicObject[i]);
	        ShipDynamicObject[i] = INVALID_OBJECT_ID;
	    }
	    if(isufoveh[i] == 1)
	    {
	        DestroyVehicle(i);
	    }
	}
	return 1;
}

CMD:ufo(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}Only RCON admins can use this command.");
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're in a vehicle.");
	if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're in an interior.");
	new Float:xxx, Float:yyy, Float:zzz, Float:aaa;
	GetPlayerPos(playerid, xxx, yyy, zzz);
	GetPlayerFacingAngle(playerid, aaa);
	new vvid = CreateVehicle(501, xxx, yyy, zzz + 1, aaa, -1, -1, -1, true);
  	LinkVehicleToInterior(vvid, 1);
	ShipDynamicObject[vvid] = CreateDynamicObject(18846, xxx, yyy, zzz + 5, 0.0, 0.0, 0.0);
	AttachDynamicObjectToVehicle(ShipDynamicObject[vvid], vvid, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	PutPlayerInVehicle(playerid, vvid, 0);
	isufoveh[vvid] = 1;
	return true;
}

CMD:removeufo(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}Only RCON admins can use this command.");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're not in a vehicle.");
	if(!IsValidDynamicObject(ShipDynamicObject[ GetPlayerVehicleID(playerid) ])) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You're not flying a UFO.");
	new vvid = GetPlayerVehicleID(playerid);
	DestroyVehicle(vvid);
	DestroyDynamicObject(ShipDynamicObject[vvid]);
	ShipDynamicObject[vvid] = INVALID_OBJECT_ID;
	isufoveh[vvid] = -1;
	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(IsValidDynamicObject(ShipDynamicObject[vehicleid]))
	{
		DestroyDynamicObject(ShipDynamicObject[vehicleid]);
	    ShipDynamicObject[vehicleid] = INVALID_OBJECT_ID;
	}
	if(isufoveh[vehicleid] == 1)
	{
		DestroyVehicle(vehicleid);
	}
	return 1;
}
