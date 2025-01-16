#define FILTERSCRIPT

#include <open.mp>

public OnFilterScriptInit()
{
	printf(" ");
	printf("  -----------------------------------");
	printf("  |  request class! |");
	printf("  -----------------------------------");
	printf(" ");
}

public OnFilterScriptExit()
{
	return 1;
}

/*
public OnPlayerConnect(playerid)
{
		//TogglePlayerSpectating(playerid, true);
	
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2116.0205, 2143.3225, 10.8203);
	    SetPlayerFacingAngle(playerid, 89.6528);
	    SetPlayerCameraLookAt(playerid, 2116.0205, 2143.3225, 10.8203);
	    SetPlayerCameraPos(playerid, 2116.0205 + (5 * floatsin(-89.6528, degrees)), 2143.3225 + (5 * floatcos(-89.6528, degrees)), 10.8203);

		return 1;
}
*/

new bool:firtsdone[MAX_PLAYERS];
new faze[MAX_PLAYERS];

public OnPlayerRequestClass(playerid, classid)
{		
	SetTimerEx("faze1", 50, false, "i", playerid);
	return 1;
}

forward faze1(playerid)
public faze1(playerid)
{
		new result[100];
		new Float:angg;
		GetPlayerFacingAngle(playerid, angg);
		new strring[200];
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		format(strring, sizeof(strring), "You are in {FFFFFF}( %f,%f,%f )", x, y, z);
		SendClientMessage(playerid,-1,strring);
		new pos1[200], pos2[200];
		format(pos1, sizeof(pos1), " | PosX: %f PosY: %f PosZ: %f | Source: %f,%f,%f | ",x,y,z,x,y,z);
		format(pos2, sizeof(pos2), " | Virtual World: %d | Interior: %i | Angel: %f | Description: %s | ",GetPlayerVirtualWorld(playerid),GetPlayerInterior(playerid),angg,result);
		SendClientMessage(playerid,-1,pos1);
		SendClientMessage(playerid,-1,pos2);
		switch(faze[playerid])
		{
			case 0:
			{
		SetTimerEx("faze2", 50, false, "i", playerid);
		
}

forward faze2(playerid)
public faze2(playerid)
{
		if(firtsdone[playerid] == false) { TogglePlayerSpectating(playerid, true); }
		SetTimerEx("faze1", 50, false, "i", playerid);
}

forward faze3(playerid)
public faze3(playerid)
{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2116.0205, 2143.3225, 10.8203);
	    SetPlayerFacingAngle(playerid, 89.6528);
	    SetPlayerCameraLookAt(playerid, 2116.0205, 2143.3225, 10.8203);
	    SetPlayerCameraPos(playerid, 2116.0205 + (5 * floatsin(-89.6528, degrees)), 2143.3225 + (5 * floatcos(-89.6528, degrees)), 10.8203);
}

forward faze4(playerid)
public faze4(playerid)
{
		TogglePlayerSpectating(playerid, false);
}

forward faze5(playerid)
public faze5(playerid)
{
		firtsdone[playerid] = true;
}


