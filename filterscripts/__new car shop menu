#include open.mp
#include mselection
#include eselection
#include easyDialog
#include izcmd
#include PreviewModelDialog

/ define an ID for the model selection menu below

#define MODEL_SELECTION_SKIN_MENU (0)



ShowSkinModelMenu(playerid)

{

? ? // create a dynamic PawnPlus list to populate with models.

? ? // you don't need to worry about deleting this list, it's handled by the include once it's passed to it

? ? new List:skins = list_new();



? ? // add skin IDs 0, 1, 29 and 60 with "cool people only" text above skin ID 29.

? ? AddModelMenuItem(skins, 0);

? ? AddModelMenuItem(skins, 1);

? ? AddModelMenuItem(skins, 29, "Cool people only");

? ? AddModelMenuItem(skins, 60);



? ? // show the menu to the player

? ? ShowModelSelectionMenu(playerid, "Skins", MODEL_SELECTION_SKIN_MENU, skins);

}



// model selection response

public OnModelSelectionResponse(playerid, extraid, index, modelid, response)

{

? ? // make sure the extraid matches the skin menu ID

? ? if(extraid == MODEL_SELECTION_SKIN_MENU)

? ? {

? ? ? ? // make sure the player actually clicked on a model and not the close button

? ? ? ? if(response == MODEL_RESPONSE_SELECT)

? ? ? ? {

? ? ? ? ? ? // assign the player the skin of their choosing

? ? ? ? ? ? SetPlayerSkin(playerid, modelid);

? ? ? ? ? ? return 1;

? ? ? ? }

? ? }

} 

/ enable the "await" syntax from PawnPlus before including it

#define PP_SYNTAX_AWAIT



ShowSkinModelMenu(playerid)

{

? ? // create a dynamic PawnPlus list to populate with models.

? ? // you don't need to worry about deleting this list, it's handled by the include once it's passed to it

? ? new List:skins = list_new();



? ? // add skin IDs 0, 1, 29 and 60 with "cool people only" text above skin ID 29.

? ? AddModelMenuItem(skins, 0);

? ? AddModelMenuItem(skins, 1);

? ? AddModelMenuItem(skins, 29, "Cool people only");

? ? AddModelMenuItem(skins, 60);



? ? // declare an array that will be populated with the model selection menu response data

? ? new response[E_MODEL_SELECTION_INFO];



? ? // use await_arr and set the response array to the model selection menu result

? ? await_arr(response) ShowAsyncModelSelectionMenu(playerid, "Skins", skins);



? ? // make sure the player actually clicked on a model and not the close button

? ? if(response[E_MODEL_SELECTION_RESPONSE] == MODEL_RESPONSE_SELECT)

? ? {

? ? ? ? // assign the player the skin of their choosing

? ? ? ? SetPlayerSkin(playerid, response[E_MODEL_SELECTION_MODELID]);

? ? }

} 
