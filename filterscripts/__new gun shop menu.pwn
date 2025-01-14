#define GUN_SHOP_MENU (1)  // Gun Shop Menu Identifier
#define PP_SYNTAX_AWAIT    // Enable async syntax

// Show Gun Shop Menu
ShowGunShopMenu(playerid)
{
    // Create a dynamic PawnPlus list to populate with models
    new List:guns = list_new();

    // Add gun models (IDs, names)
    AddModelMenuItem(guns, 22, "Desert Eagle");
    AddModelMenuItem(guns, 24, "Shotgun");
    AddModelMenuItem(guns, 29, "AK-47");
    AddModelMenuItem(guns, 34, "M4 Carbine");
    AddModelMenuItem(guns, 30, "Rocket Launcher");

    // Declare an array to store the response data
    new response[E_MODEL_SELECTION_INFO];

    // Show the async model selection menu to the player
    await_arr(response) ShowAsyncModelSelectionMenu(playerid, "Gun Shop", guns);

    // Handle player selection
    if (response[E_MODEL_SELECTION_RESPONSE] == MODEL_RESPONSE_SELECT)
    {
        // Assign the selected gun to the player
        GivePlayerWeapon(playerid, response[E_MODEL_SELECTION_MODELID], 1000); // 1000 bullets for example
    }
}

// Handle Model Selection Response
public OnModelSelectionResponse(playerid, extraid, index, modelid, response)
{
    // Ensure the extraid matches the gun shop menu ID
    if (extraid == GUN_SHOP_MENU)
    {
        // Ensure the player actually clicked on a gun (not the close button)
        if (response == MODEL_RESPONSE_SELECT)
        {
            // Assign the selected gun to the player
            GivePlayerWeapon(playerid, modelid, 1000); // 1000 bullets for the selected gun
            return 1;
        }
    }
    return 0;
}
