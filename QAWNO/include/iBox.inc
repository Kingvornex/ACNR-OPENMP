#include <a_samp>

new InInfoBoxMode[MAX_PLAYERS];
new Text:BaseBox[MAX_PLAYERS];
new Text:zcnr;
new Text:BaseBox2[MAX_PLAYERS];
new Text:TitleName[MAX_PLAYERS];
new Text:ClosingText;
new Text:Informations[MAX_PLAYERS];


stock LoadInfoBox()
{

for(new playerid=0; playerid!=MAX_PLAYERS; playerid++)
{

BaseBox[playerid] = TextDrawCreate(450.000000, 112.006668, "usebox");
TextDrawLetterSize(BaseBox[playerid], 0.000000, 28.830991);
TextDrawTextSize(BaseBox[playerid], 192.400009, 0.000000);
TextDrawAlignment(BaseBox[playerid], 1);
TextDrawColor(BaseBox[playerid], 0);
TextDrawUseBox(BaseBox[playerid], true);
TextDrawBoxColor(BaseBox[playerid], 102);
TextDrawSetShadow(BaseBox[playerid], 0);
TextDrawSetOutline(BaseBox[playerid], 0);
TextDrawFont(BaseBox[playerid], 0);

zcnr = TextDrawCreate(212.800231, 119.964454, "Zeus's ~b~~h~Cops ~w~And ~r~~h~robbers");
TextDrawLetterSize(zcnr, 0.483999, 1.784177);
TextDrawAlignment(zcnr, 1);
TextDrawColor(zcnr, -1);
TextDrawSetShadow(zcnr, 0);
TextDrawSetOutline(zcnr, 1);
TextDrawBackgroundColor(zcnr, 51);
TextDrawFont(zcnr, 3);
TextDrawSetProportional(zcnr, 1);

BaseBox2[playerid] = TextDrawCreate(449.200042, 155.811111, "usebox");
TextDrawLetterSize(BaseBox2[playerid], 0.000000, 4.550493);
TextDrawTextSize(BaseBox2[playerid], 192.400024, 0.000000);
TextDrawAlignment(BaseBox2[playerid], 1);
TextDrawColor(BaseBox2[playerid], 0);
TextDrawUseBox(BaseBox2[playerid], true);
TextDrawBoxColor(BaseBox2[playerid], -16777168);
TextDrawSetShadow(BaseBox2[playerid], 0);
TextDrawSetOutline(BaseBox2[playerid], 0);
TextDrawFont(BaseBox2[playerid], 0);

TitleName[playerid] = TextDrawCreate(247.200042, 167.253326, "New Textdraw");
TextDrawLetterSize(TitleName[playerid], 0.449999, 1.600000);
TextDrawAlignment(TitleName[playerid], 1);
TextDrawColor(TitleName[playerid], -1);
TextDrawSetShadow(TitleName[playerid], 0);
TextDrawSetOutline(TitleName[playerid], 1);
TextDrawBackgroundColor(TitleName[playerid], 51);
TextDrawFont(TitleName[playerid], 2);
TextDrawSetProportional(TitleName[playerid], 1);

ClosingText = TextDrawCreate(271.600219, 361.386596, "Press ~r~~h~LMB ~w~To close this box");
TextDrawLetterSize(ClosingText, 0.161596, 1.201777);
TextDrawAlignment(ClosingText, 1);
TextDrawColor(ClosingText, -1);
TextDrawSetShadow(ClosingText, 0);
TextDrawSetOutline(ClosingText, 1);
TextDrawBackgroundColor(ClosingText, 51);
TextDrawFont(ClosingText, 2);
TextDrawSetProportional(ClosingText, 1);

Informations[playerid] = TextDrawCreate(199.600128, 212.053436, "New Textdraw");
TextDrawLetterSize(Informations[playerid], 0.246799, 1.097242);
TextDrawAlignment(Informations[playerid], 1);
TextDrawColor(Informations[playerid], -1);
TextDrawSetShadow(Informations[playerid], 0);
TextDrawSetOutline(Informations[playerid], 1);
TextDrawBackgroundColor(Informations[playerid], 51);
TextDrawFont(Informations[playerid], 1);
TextDrawSetProportional(Informations[playerid], 1);
}

return 1;
}


stock ShowPlayerInfoBox(playerid , title[] , informations[] , TitleBoxColor = 0 , BaseBoxColor = 0)
{
	TextDrawSetString(TitleName[playerid] , title);
	TextDrawSetString(Informations[playerid] , informations);
	if(TitleBoxColor != 0){TextDrawBoxColor(TitleName[playerid] , TitleBoxColor);} else { TextDrawBoxColor(TitleName[playerid], 5228678); }
	if(BaseBoxColor != 0){TextDrawBoxColor(BaseBox[playerid] , BaseBoxColor);} else { TextDrawBoxColor(BaseBox[playerid], 102); }
	InInfoBoxMode[playerid] = 1;
    TextDrawShowForPlayer(playerid , BaseBox[playerid]);
    TextDrawShowForPlayer(playerid , BaseBox2[playerid]);
    TextDrawShowForPlayer(playerid , TitleName[playerid]);
    TextDrawShowForPlayer(playerid , ClosingText);
    TextDrawShowForPlayer(playerid , Informations[playerid]);
    TextDrawShowForPlayer(playerid , zcnr);
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_FIRE )
	{
	  if(InInfoBoxMode[playerid] != 0)
	  {
		  InInfoBoxMode[playerid] = 0;
          TextDrawHideForPlayer(playerid , BaseBox[playerid]);
          TextDrawHideForPlayer(playerid , BaseBox2[playerid]);
	      TextDrawHideForPlayer(playerid , TitleName[playerid]);
	      TextDrawHideForPlayer(playerid , ClosingText);
	      TextDrawHideForPlayer(playerid , Informations[playerid]);
	      TextDrawHideForPlayer(playerid , zcnr);

	  }
	  return 1;
	}
	#if defined KP_OnPlayerKeyStateChange
 	   KP_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#endif
	return 0;
}

#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif

#define OnPlayerKeyStateChange KP_OnPlayerKeyStateChange

#if defined KP_OnPlayerKeyStateChange
	forward KP_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif


