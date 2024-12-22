#include 	<open.mp>
//native      IsValidVehicle(vehicleid);

new
	ShipObject[MAX_VEHICLES] = {INVALID_OBJECT_ID, ...};

WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}

public OnGameModeInit()
{
WasteDeAMXersTime();
print("|+-*/=/*-+ UFO Vehicle By Abolfazl , RCON CMD : /ufo & /removeufo +-*/=/*-+|");
return 1;
}
public OnGameModeExit()
{
	for(new i; i < MAX_VEHICLES; ++i)
	{
	    if(IsValidVehicle(i) && IsValidObject(ShipObject[i]))
	    {
	        DestroyVehicle(i);
	        DestroyObject(ShipObject[i]);
	        ShipObject[i] = INVALID_OBJECT_ID;
	    }
	}

	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!strcmp(cmdtext, "/ufo"))
	{
	    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}Only RCON admins can use this command.");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're in a vehicle.");
		if(GetPlayerInterior(playerid) > 0) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're in an interior.");
		new Float: x, Float: y, Float: z, Float: a;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);
		new id = CreateVehicle(501, x, y, z, a, 1, 1, -1);
  		LinkVehicleToInterior(id, 1);
		ShipObject[id] = CreateObject(18846, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(ShipObject[id], id, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		PutPlayerInVehicle(playerid, id, 0);
		return 1;
	}

	if(!strcmp(cmdtext, "/removeufo"))
	{
	    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}Only RCON admins can use this command.");
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You can't use this command if you're not in a vehicle.");
		if(!IsValidObject(ShipObject[ GetPlayerVehicleID(playerid) ])) return SendClientMessage(playerid, 0xC0392BFF, "ERROR: {FFFFFF}You're not flying a UFO.");
		new id = GetPlayerVehicleID(playerid);
		DestroyVehicle(id);
		DestroyObject(ShipObject[id]);
		ShipObject[id] = INVALID_OBJECT_ID;
		return 1;
	}

	return 0;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(IsValidObject(ShipObject[vehicleid]))
	{
	    DestroyVehicle(vehicleid);
	    DestroyObject(ShipObject[vehicleid]);
	    ShipObject[vehicleid] = INVALID_OBJECT_ID;
	}

	return 1;
}
