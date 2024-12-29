
// ACNR Dynamic UFO

#include <open.mp>
#include <streamer>
#include <izcmd>

new ShipObject[MAX_VEHICLES];

public OnFilterScriptInit()
{
	print("|==================== UFO Vehicle By Abolfazl , RCON CMD : /ufo & /removeufo ====================|");
	return 1;
}
public OnFilterScriptExit()
{
	for(new i; i < MAX_VEHICLES; ++i)
	{
	    if(IsValidVehicle(i) && IsValidObject(ShipObject[i]))
	    {
	        DestroyVehicle(i);
	        DestroyDynamicObject(ShipObject[i]);
	        ShipObject[i] = INVALID_OBJECT_ID;
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
	new vvid = CreateVehicle(501, xxx, yyy, zzz, aaa, -1, -1, -1, true);
  	LinkVehicleToInterior(vvid, 1);
	ShipObject[vvid] = CreateDynamicObject(18846, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	AttachDynamicObjectToVehicle(ShipObject[vvid], vvid, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	PutPlayerInVehicle(playerid, vvid, 0);
	return true;
}

CMD:removeufo(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}Only RCON admins can use this command.");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're not in a vehicle.");
	if(!IsValidObject(ShipObject[ GetPlayerVehicleID(playerid) ])) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You're not flying a UFO.");
	new vvid = GetPlayerVehicleID(playerid);
	DestroyVehicle(vvid);
	DestroyDynamicObject(ShipObject[vvid]);
	ShipObject[vvid] = INVALID_OBJECT_ID;
	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(IsValidObject(ShipObject[vehicleid]))
	{
	    DestroyVehicle(vehicleid);
	    DestroyDynamicObject(ShipObject[vehicleid]);
	    ShipObject[vehicleid] = INVALID_OBJECT_ID;
	}

	return 1;
}
