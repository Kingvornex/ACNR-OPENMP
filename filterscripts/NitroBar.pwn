//=====================[By irinel1996[Enrique_Navarro]]===================//
//=====================[By irinel1996[Enrique_Navarro]]===================//

//=====================[Prohibido TOTALMENTE el Robo de Créditos o la Publicación de este .pwn sin Mi Permiso.]===================//
//=====================[Prohibido TOTALMENTE el Robo de Créditos o la Publicación de este .pwn sin Mi Permiso.]===================//
#define FILTERSCRIPT
//==============[Includes]===================//
#include <a_samp>
//==============[DefineS]===================//
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define COLOR_GREY 0x0000003D
//==============[NewS]===================//
new Text:Nitro[MAX_PLAYERS];
new Text:T_Nitro[MAX_PLAYERS];
new Text:T_Nitro2[MAX_PLAYERS];
new Timer_C;
new Cantidad[MAX_VEHICLES];
//==============[ForwardS]===================//
forward CargadorNitro(playerid,carid);
forward ReducidorNitro(playerid,carid);
public OnFilterScriptInit()
{
    //Barra Nitro
	for(new i = 0; i < MAX_PLAYERS; i++)
 	{
    	T_Nitro2[i] = TextDrawCreate(482.000000, 336.000000, "_");
		TextDrawBackgroundColor(T_Nitro2[i], 255);
		TextDrawFont(T_Nitro2[i], 2);
		TextDrawLetterSize(T_Nitro2[i], 0.500000, 1.399999);
		TextDrawColor(T_Nitro2[i], -1);
		TextDrawSetOutline(T_Nitro2[i], 0);
		TextDrawSetProportional(T_Nitro2[i], 1);
		TextDrawSetShadow(T_Nitro2[i], 1);
		TextDrawUseBox(T_Nitro2[i], 1);
		TextDrawBoxColor(T_Nitro2[i], 255);
		TextDrawTextSize(T_Nitro2[i], 594.000000, 1.000000);

  		T_Nitro[i] = TextDrawCreate(485.000000, 338.000000, "_");
		TextDrawBackgroundColor(T_Nitro[i], 255);
		TextDrawFont(T_Nitro[i], 2);
		TextDrawLetterSize(T_Nitro[i], 0.500000, 0.899999);
		TextDrawColor(T_Nitro[i], -1);
		TextDrawSetOutline(T_Nitro[i], 0);
		TextDrawSetProportional(T_Nitro[i], 1);
		TextDrawSetShadow(T_Nitro[i], 1);
		TextDrawUseBox(T_Nitro[i], 1);
		TextDrawBoxColor(T_Nitro[i], 10223615);
		TextDrawTextSize(T_Nitro[i], 591.000000, 1.000000);

    	Nitro[i] = TextDrawCreate(507.000000, 336.000000, "NITRO");
		TextDrawBackgroundColor(Nitro[i], -16776961);
		TextDrawFont(Nitro[i], 2);
		TextDrawLetterSize(Nitro[i], 0.509998, 1.299999);
		TextDrawColor(Nitro[i], 255);
		TextDrawSetOutline(Nitro[i], 1);
		TextDrawSetProportional(Nitro[i], 1);
 	}
 	for(new i; i < MAX_VEHICLES; i++)
 	{
  		Cantidad[i] = 100;
 	}
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}


public OnPlayerExitVehicle(playerid, vehicleid)
{
    //Barra Nitro
    TextDrawHideForPlayer(playerid, Nitro[playerid]);
    TextDrawHideForPlayer(playerid, T_Nitro[playerid]);
	TextDrawHideForPlayer(playerid, T_Nitro2[playerid]);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    //Barra Nitro
	if(newstate == PLAYER_STATE_ONFOOT)
 	{
  		TextDrawHideForPlayer(playerid, Nitro[playerid]);
  		TextDrawHideForPlayer(playerid, T_Nitro[playerid]);
  		TextDrawHideForPlayer(playerid, T_Nitro2[playerid]);
 	}
 	if(newstate == PLAYER_STATE_DRIVER)
 	{
 	    new vehicleid = GetPlayerVehicleID(playerid);
    	new vmodel = GetVehicleModel(vehicleid);
    	if(vmodel == 509 || vmodel == 481 || vmodel == 510 || vmodel == 462 || vmodel == 448 || vmodel == 581 || vmodel == 522 || vmodel == 461 || vmodel == 521 || vmodel == 523 || vmodel == 463 || vmodel == 586 || vmodel == 468)
    	{
    		TextDrawHideForPlayer(playerid, Nitro[playerid]);
			TextDrawHideForPlayer(playerid, T_Nitro[playerid]);
			TextDrawHideForPlayer(playerid, T_Nitro2[playerid]);
			SendClientMessage(playerid, COLOR_GREY, "You can't use Nitro in this vehicle!");
		}
		else if(vmodel == 471 || vmodel == 592 || vmodel == 577 || vmodel == 511 || vmodel == 512 || vmodel == 593 || vmodel == 520 || vmodel == 553 || vmodel == 476 || vmodel == 519 || vmodel == 460 || vmodel == 513 || vmodel == 548 || vmodel == 425 || vmodel == 417 || vmodel == 487)
		{
		    TextDrawHideForPlayer(playerid, Nitro[playerid]);
			TextDrawHideForPlayer(playerid, T_Nitro[playerid]);
			TextDrawHideForPlayer(playerid, T_Nitro2[playerid]);
			SendClientMessage(playerid, COLOR_GREY, "You can't use Nitro in this vehicle!");
		}
		else if(vmodel == 488 || vmodel == 497 || vmodel == 563 || vmodel == 447 || vmodel == 469 || vmodel == 572 || vmodel == 473 || vmodel == 493 || vmodel == 595 || vmodel == 484 || vmodel == 430 || vmodel == 453 || vmodel == 452 || vmodel == 446 || vmodel == 454)
		{
		    TextDrawHideForPlayer(playerid, Nitro[playerid]);
			TextDrawHideForPlayer(playerid, T_Nitro[playerid]);
			TextDrawHideForPlayer(playerid, T_Nitro2[playerid]);
			SendClientMessage(playerid, COLOR_GREY, "You can't use Nitro in this vehicle!");
		}
		else
		{
			TextDrawShowForPlayer(playerid, T_Nitro2[playerid]);
			TextDrawShowForPlayer(playerid, T_Nitro[playerid]);
			TextDrawShowForPlayer(playerid, Nitro[playerid]);
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    //Barra Nitro
	if(PRESSED(KEY_FIRE))
	{
		if(IsPlayerInAnyVehicle(playerid))
  		{
   			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && Cantidad[GetPlayerVehicleID(playerid)] > 0)
   			{
    			AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
    			KillTimer(Timer_C);
    			Timer_C = SetTimerEx("ReducidorNitro",70,1,"ii",playerid,GetPlayerVehicleID(playerid)); //12
   			}
  		}
	}
	if(RELEASED(KEY_FIRE))
	{
		if(IsPlayerInAnyVehicle(playerid))
  		{
   			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
   			{
    			RemoveVehicleComponent(GetPlayerVehicleID(playerid), 1010);
    			KillTimer(Timer_C);
    			Timer_C = SetTimerEx("CargadorNitro",120,1,"ii",playerid,GetPlayerVehicleID(playerid)); //30
   			}
  		}
	}
	return 1;
}

//=======================[Barra Nitro]==================================//
public CargadorNitro(playerid,carid)
{
	if(Cantidad[carid] >= 100)
 	{
  		Cantidad[carid] = 100;
  		TextDrawBackgroundColor(T_Nitro[playerid], 0xFF0000FF);
  		TextDrawColor(T_Nitro[playerid], 0xFF0000FF);
  		TextDrawBoxColor(T_Nitro[playerid], 397783295);
 	}
 	if(Cantidad[carid] >= 1)
 	{
  		TextDrawBackgroundColor(T_Nitro[playerid], 0xFF0000FF);
  		TextDrawColor(T_Nitro[playerid], 0xFF0000FF);
  		TextDrawBoxColor(T_Nitro[playerid], 397783295);
 	}
 	Cantidad[carid]++;
 	TextDrawColor(T_Nitro[playerid], 0x00B9FFFF);
 	TextDrawTextSize(T_Nitro[playerid],489.7 + Cantidad[carid] , 12.0 ); //12
 	TextDrawShowForPlayer(playerid,T_Nitro[playerid]);
	return 1;
}

public ReducidorNitro(playerid,carid)
{
	Cantidad[carid]--;
 	if(Cantidad[carid] <= 0)
 	{
  		Cantidad[carid] = 0;
  		TextDrawBackgroundColor(T_Nitro[playerid], 0xFF0000FF);
  		TextDrawColor(T_Nitro[playerid], 0xFF0000FF);
  		TextDrawBoxColor(T_Nitro[playerid], 0xFF0000FF);
  		RemoveVehicleComponent(GetPlayerVehicleID(playerid), 1010);
 	}
 	TextDrawTextSize(T_Nitro[playerid],489.7 + Cantidad[carid] , 12.0 ); //12
 	TextDrawShowForPlayer(playerid,T_Nitro[playerid]);
 	return 1;
}
//=====================[By irinel1996[Enrique_Navarro]]===================//
//=====================[By irinel1996[Enrique_Navarro]]===================//

//=====================[Prohibido TOTALMENTE el Robo de Créditos o la Publicación de este .pwn sin Mi Permiso.]===================//
//=====================[Prohibido TOTALMENTE el Robo de Créditos o la Publicación de este .pwn sin Mi Permiso.]===================//
