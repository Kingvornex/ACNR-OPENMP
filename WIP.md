1. Save vehicle component mods by component slot
The code provided for this task looks mostly correct. It's a command /addcomponent that adds a component to a vehicle and saves it based on the component type. However, there are a few improvements we can make:

The code assumes vehicleid is a direct index into GetvMods, but this might not be the case if vehicles are created and destroyed dynamically.
There's no code to load the saved mods when a vehicle is spawned.
Here's an improved version:
```
#define MAX_STREAM_VEHICLES 1000
new GetvMods[MAX_STREAM_VEHICLES][12]; // 12 is the number of component types in SAMP

// Function to save a vehicle component
SaveVehicleComponent(vehicleid, componentid) {
    // Find the slot for this vehicle in our array
    new slot = GetVehicleSlot(vehicleid);
    if (slot == -1) return 0;
    
    new CARMODTYPE:componentType = GetVehicleComponentType(componentid);
    if (componentType != CARMODTYPE_NONE) {
        GetvMods[slot][componentType] = componentid;
        return 1;
    }
    return 0;
}

// Function to get a vehicle's slot in our array
GetVehicleSlot(vehicleid) {
    // This function needs to be implemented based on how vehicles are managed
    // For example, if you have a global array of vehicles, you could search for vehicleid in it
    // This is just a placeholder implementation
    for (new i = 0; i < MAX_STREAM_VEHICLES; i++) {
        if (/* vehicle at index i matches vehicleid */) {
            return i;
        }
    }
    return -1;
}

// Function to load all saved components for a vehicle
LoadVehicleComponents(vehicleid) {
    new slot = GetVehicleSlot(vehicleid);
    if (slot == -1) return 0;
    
    for (new i = 0; i < 12; i++) {
        if (GetvMods[slot][i] != 0) {
            AddVehicleComponent(vehicleid, GetvMods[slot][i]);
        }
    }
    return 1;
}

CMD:addcomponent(playerid, componentid)
{
    if (!IsPlayerInAnyVehicle(playerid))
    {
        SendClientMessage(playerid, 0xFF0000FF, "You must be in a vehicle to use this command.");
        return 1;
    }
    new vehicleid = GetPlayerVehicleID(playerid);
    if (VehicleCanHaveComponent(GetVehicleModel(vehicleid), componentid))
    {
        AddVehicleComponent(vehicleid, componentid);
        if (SaveVehicleComponent(vehicleid, componentid)) {
            SendClientMessage(playerid, 0x00FF00FF, "Component added to your vehicle and saved.");
        } else {
            SendClientMessage(playerid, 0xFF0000FF, "Failed to save the component.");
        }
    }
    else
    {
        SendClientMessage(playerid, 0xFF0000FF, "This component cannot be added to your vehicle.");
    }
    return 1;
}
```
2. Add comma to money textdraw
The provided code for formatting numbers with commas has some issues. Here's a corrected version:
```
stock FormatNumber(number, output[], len = sizeof(output)) {
    new temp = number;
    new count = 0;
    new i = 0;
    
    // Handle 0 separately
    if (temp == 0) {
        output[0] = '0';
        output[1] = '\0';
        return 1;
    }
    
    // Handle negative numbers
    if (temp < 0) {
        output[i++] = '-';
        temp = -temp;
    }
    
    // Convert number to string in reverse order
    while (temp > 0) {
        if (count > 0 && count % 3 == 0) {
            output[i++] = ',';
        }
        output[i++] = (temp % 10) + '0';
        temp /= 10;
        count++;
    }
    
    // Null-terminate the string
    output[i] = '\0';
    
    // Reverse the string
    new j = 0;
    if (output[0] == '-') j = 1; // Skip the minus sign if present
    i--; // Move to the last character before the null terminator
    while (j < i) {
        // Swap characters
        new c = output[j];
        output[j] = output[i];
        output[i] = c;
        j++;
        i--;
    }
    
    return 1;
}

// Example usage in a command
CMD:mymoney(playerid, params[]) {
    new money = GetPlayerMoney(playerid);
    new formattedMoney[32];
    FormatNumber(money, formattedMoney);
    
    new message[64];
    format(message, sizeof(message), "Your money: $%s", formattedMoney);
    SendClientMessage(playerid, -1, message);
    return 1;
}
```
3. Updating to OPEN.mp
This section has a list of tasks for updating the gamemode to OPEN.mp. Let's address each one:

Use upgrade tool
The OPEN.mp team provides an upgrade tool to help convert SA:MP scripts to OPEN.mp. You should run this tool on your codebase to identify and fix compatibility issues.

Use y_hooks
y_hooks is a library that allows for more flexible hooking of callbacks. To use it, you need to include it in your script and modify your callbacks to use the hooking system.
```
#include <YSI_Coding\y_hooks>

// Example of hooking OnPlayerConnect
hook OnPlayerConnect(playerid) {
    // Your code here
    return 1;
}

```
Update whirlpool to bcrypt
The provided link (https://github.com/Kingvornex/ACNR-OPENMP/blob/main/How%20to%20update%20to%20bcryp.md) should contain instructions on how to update from whirlpool to bcrypt. Generally, this involves:

Replacing whirlpool hash functions with bcrypt hash functions
Updating the database schema to store bcrypt hashes instead of whirlpool hashes
Adding a migration process to update existing passwords
Add easyDialog and update all dialogs to easydialog
easyDialog is a library that simplifies dialog creation and management. To use it:

Include the library in your script
Replace all ShowPlayerDialog calls with Dialog_Show calls
Restructure your dialog response handling
Example:
```
#include <easyDialog>

// Old way
ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "Login", "Please enter your password:", "Login", "Cancel");

// New way
Dialog_Show(playerid, Login, DIALOG_STYLE_INPUT, "Login", "Please enter your password:", "Login", "Cancel");

Dialog:Login(playerid, response, inputtext[]) {
    if (!response) {
        Kick(playerid);
        return 1;
    }
    
    // Process login
    return 1;
}
```

Shop vehicle destroys by itself won't respawn
To fix shop vehicles not respawning when destroyed
```
public OnVehicleDeath(vehicleid, killerid) {
    // Check if this is a shop vehicle
    if (IsShopVehicle(vehicleid)) {
        // Set a timer to respawn the vehicle
        SetTimerEx("RespawnShopVehicle", 5000, false, "d", vehicleid);
    }
    return 1;
}

forward RespawnShopVehicle(vehicleid);
public RespawnShopVehicle(vehicleid) {
    // Get the original spawn position of the vehicle
    new Float:x, Float:y, Float:z, Float:angle;
    GetVehicleSpawnPos(vehicleid, x, y, z);
    GetVehicleSpawnAngle(vehicleid, angle);
    
    // Get the vehicle model and color
    new model = GetVehicleModel(vehicleid);
    new color1, color2;
    GetVehicleColor(vehicleid, color1, color2);
    
    // Destroy and recreate the vehicle
    DestroyVehicle(vehicleid);
    vehicleid = CreateVehicle(model, x, y, z, angle, color1, color2, -1);
    
    // Reload any saved components
    LoadVehicleComponents(vehicleid);
    
    return 1;
}
```

Under OnPlayerStateChange only use newState, using oldState with if will cause bug and not execution some times
To fix this issue:

Review all code in OnPlayerStateChange
Remove any conditions that rely on oldState
Use only newState for determining player state
Test thoroughly to ensure everything still works
Change default vehicle numberplate from "ACNR" to "VEHICLE NAME"
To change the default number plate:
```
public OnVehicleSpawn(vehicleid) {
    // Get the vehicle model name
    new model = GetVehicleModel(vehicleid);
    new modelName[32];
    GetVehicleName(model, modelName, sizeof(modelName));
    
    // Set the number plate to the model name
    SetVehicleNumberPlate(vehicleid, modelName);
    
    return 1;
}
```
4. Eject all players in vehicle
The code provided for ejecting all players from a vehicle has some issues. Here's a corrected version:
```
CMD:ejectall(playerid, params[]) {
    // Check if the player is in a vehicle
    new vehicleid = GetPlayerVehicleID(playerid);
    if (vehicleid == INVALID_VEHICLE_ID) {
        SendClientMessage(playerid, 0xFF0000AA, "You are not in a vehicle.");
        return 1;
    }
    
    // Check if the player is the driver
    if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
        SendClientMessage(playerid, 0xFF0000AA, "You must be the driver to eject passengers.");
        return 1;
    }
    
    // Eject all passengers
    new ejected = 0;
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i) && i != playerid && GetPlayerVehicleID(i) == vehicleid) {
            RemovePlayerFromVehicle(i);
            SendClientMessage(i, 0xFF0000AA, "You have been ejected from the vehicle.");
            ejected++;
        }
    }
    
    // Notify the driver
    if (ejected > 0) {
        new msg[64];
        format(msg, sizeof(msg), "You have ejected %d player(s) from your vehicle.", ejected);
        SendClientMessage(playerid, 0x00FF00AA, msg);
    } else {
        SendClientMessage(playerid, 0x00FF00AA, "There are no passengers in your vehicle.");
    }
    
    return 1;
}

// Alternative version that can be called from other commands
stock EjectAllPlayersFromVehicle(vehicleid, exceptid = INVALID_PLAYER_ID) {
    new ejected = 0;
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i) && i != exceptid && GetPlayerVehicleID(i) == vehicleid) {
            RemovePlayerFromVehicle(i);
            ejected++;
        }
    }
    return ejected;
}
```
onvehicledeath
This seems to be about handling vehicle death events. Here's a basic implementation:
```
public OnVehicleDeath(vehicleid, killerid) {
    // Check if this is a shop vehicle
    if (IsShopVehicle(vehicleid)) {
        // Set a timer to respawn the vehicle
        SetTimerEx("RespawnShopVehicle", 5000, false, "d", vehicleid);
    }
    
    // Check if this is a player's vehicle
    if (IsPlayerVehicle(vehicleid)) {
        // Notify the owner
        new ownerid = GetVehicleOwner(vehicleid);
        if (IsPlayerConnected(ownerid)) {
            SendClientMessage(ownerid, 0xFF0000AA, "Your vehicle has been destroyed. It will respawn at its original location.");
        }
    }
    
    return 1;
}

```
neon
To add more neon colors by mixing neons:
```
// Define neon colors
enum {
    NEON_COLOR_BLUE = 0,
    NEON_COLOR_RED,
    NEON_COLOR_GREEN,
    NEON_COLOR_YELLOW,
    NEON_COLOR_PINK,
    NEON_COLOR_WHITE,
    NEON_COLOR_PURPLE,
    NEON_COLOR_ORANGE,
    NEON_COLOR_CYAN,
    // Add more colors as needed
    MAX_NEON_COLORS
}

// Function to set neon color
SetVehicleNeonColor(vehicleid, color) {
    switch (color) {
        case NEON_COLOR_BLUE: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 0, 0, 255); // Blue
        }
        case NEON_COLOR_RED: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 255, 0, 0); // Red
        }
        case NEON_COLOR_GREEN: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 0, 255, 0); // Green
        }
        case NEON_COLOR_YELLOW: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 255, 255, 0); // Yellow
        }
        case NEON_COLOR_PINK: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 255, 0, 255); // Pink
        }
        case NEON_COLOR_WHITE: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 255, 255, 255); // White
        }
        case NEON_COLOR_PURPLE: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 128, 0, 128); // Purple
        }
        case NEON_COLOR_ORANGE: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 255, 165, 0); // Orange
        }
        case NEON_COLOR_CYAN: {
            SetVehicleNeonLights(vehicleid, true);
            SetVehicleNeonColor(vehicleid, 0, 255, 255); // Cyan
        }
        // Add more colors as needed
        default: {
            SetVehicleNeonLights(vehicleid, false); // Turn off neon
        }
    }
    return 1;
}

// Command to change neon color
CMD:neon(playerid, params[]) {
    new color;
    if (sscanf(params, "d", color)) {
        SendClientMessage(playerid, 0xFF0000AA, "Usage: /neon [color]");
        SendClientMessage(playerid, 0xFF0000AA, "Colors: 0=Blue, 1=Red, 2=Green, 3=Yellow, 4=Pink, 5=White, 6=Purple, 7=Orange, 8=Cyan");
        return 1;
    }
    
    if (!IsPlayerInAnyVehicle(playerid)) {
        SendClientMessage(playerid, 0xFF0000AA, "You must be in a vehicle to use this command.");
        return 1;
    }
    
    new vehicleid = GetPlayerVehicleID(playerid);
    
    if (color < 0 || color >= MAX_NEON_COLORS) {
        SendClientMessage(playerid, 0xFF0000AA, "Invalid color. Use /neon to see available colors.");
        return 1;
    }
    
    SetVehicleNeonColor(vehicleid, color);
    SendClientMessage(playerid, 0x00FF00AA, "Neon color changed.");
    
    return 1;
}
```
Add /fanim to admin 4
To add the /fanim command for admin level 4:
```
CMD:fanim(playerid, params[]) {
    if (PlayerInfo[playerid][aLevel] < 4) {
        SendClientMessage(playerid, 0xFF0000AA, "You must be an admin level 4 to use this command.");
        return 1;
    }
    
    new targetid, animlib[32], animname[32], Float:delta, loop, lockx, locky, freeze, time;
    if (sscanf(params, "us[32]s[32]fdddd", targetid, animlib, animname, delta, loop, lockx, locky, freeze, time)) {
        SendClientMessage(playerid, 0xFF0000AA, "Usage: /fanim [playerid] [animlib] [animname] [delta] [loop] [lockx] [locky] [freeze] [time]");
        return 1;
    }
    
    if (!IsPlayerConnected(targetid)) {
        SendClientMessage(playerid, 0xFF0000AA, "Invalid player ID.");
        return 1;
    }
    
    ApplyAnimation(targetid, animlib, animname, delta, loop, lockx, locky, freeze, time);
    
    new msg[128];
    format(msg, sizeof(msg), "Admin %s has forced an animation on you.", GetName(playerid));
    SendClientMessage(targetid, 0xFF0000AA, msg);
    
    format(msg, sizeof(msg), "You have forced an animation on %s.", GetName(targetid));
    SendClientMessage(playerid, 0x00FF00AA, msg);
    
    return 1;
}
```

Actor in -13, -179, 1
To add an actor at the specified coordinates:

```
new actorid;
actorid = CreateActor(skinid, -13.0, -179.0, 1.0, rotation); // Replace skinid and rotation with appropriate values
```

Attach UFO objects together so it won't be bug
To attach UFO objects together:
```pwn
// Create the main UFO object
new ufoMain = CreateObject(objectid, x, y, z, rx, ry, rz);

// Create additional UFO objects
new ufoPart1 = CreateObject(objectid1, x1, y1, z1, rx1, ry1, rz1);
new ufoPart2 = CreateObject(objectid2, x2, y2, z2, rx2, ry2, rz2);

// Attach the parts to the main UFO
AttachObjectToObject(ufoPart1, ufoMain, offsetX1, offsetY1, offsetZ1, rotX1, rotY1, rotZ1);
AttachObjectToObject(ufoPart2, ufoMain, offsetX2, offsetY2, offsetZ2, rotX2, rotY2, rotZ2);
```

Save /kojam to file like /bug
To save /kojam commands to a file like /bug:
```
CMD:kojam(playerid, params[]) {
    new text[128];
    if (sscanf(params, "s[128]", text)) {
        SendClientMessage(playerid, 0xFF0000AA, "Usage: /kojam [text]");
        return 1;
    }
    
    new File:file = fopen("kojam.txt", io_append);
    if (file) {
        new string[256];
        format(string, sizeof(string), "[%s] %s: %s\n", GetDate(), GetName(playerid), text);
        fwrite(file, string);
        fclose(file);
        
        SendClientMessage(playerid, 0x00FF00AA, "Your message has been saved.");
    } else {
        SendClientMessage(playerid, 0xFF0000AA, "Error: Could not save your message.");
    }
    
    return 1;
}

stock GetDate() {
    new year, month, day, hour, minute, second;
    getdate(year, month, day);
    gettime(hour, minute, second);
    
    new date[32];
    format(date, sizeof(date), "%04d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
    return date;
}
```

Get component information
To get component information:
```
CMD:getcomponentinfo(playerid, params[]) {
    new componentid;
    if (sscanf(params, "d", componentid)) {
        SendClientMessage(playerid, 0xFF0000AA, "Usage: /getcomponentinfo [componentid]");
        return 1;
    }
    
    new CARMODTYPE:type = GetVehicleComponentType(componentid);
    new info[128];
    
    switch (type) {
        case CARMODTYPE_SPOILER: format(info, sizeof(info), "Component ID %d is a spoiler.", componentid);
        case CARMODTYPE_HOOD: format(info, sizeof(info), "Component ID %d is a hood.", componentid);
        case CARMODTYPE_ROOF: format(info, sizeof(info), "Component ID %d is a roof.", componentid);
        case CARMODTYPE_SIDESKIRT: format(info, sizeof(info), "Component ID %d is a sideskirt.", componentid);
        case CARMODTYPE_LAMPS: format(info, sizeof(info), "Component ID %d is a lamp.", componentid);
        case CARMODTYPE_NITRO: format(info, sizeof(info), "Component ID %d is a nitro.", componentid);
        case CARMODTYPE_EXHAUST: format(info, sizeof(info), "Component ID %d is an exhaust.", componentid);
        case CARMODTYPE_WHEELS: format(info, sizeof(info), "Component ID %d is a wheel.", componentid);
        case CARMODTYPE_STEREO: format(info, sizeof(info), "Component ID %d is a stereo.", componentid);
        case CARMODTYPE_HYDRAULICS: format(info, sizeof(info), "Component ID %d is a hydraulic.", componentid);
        case CARMODTYPE_FRONT_BUMPER: format(info, sizeof(info), "Component ID %d is a front bumper.", componentid);
        case CARMODTYPE_REAR_BUMPER: format(info, sizeof(info), "Component ID %d is a rear bumper.", componentid);
        case CARMODTYPE_VENT_RIGHT: format(info, sizeof(info), "Component ID %d is a right vent.", componentid);
        case CARMODTYPE_VENT_LEFT: format(info, sizeof(info), "Component ID %d is a left vent.", componentid);
        default: format(info, sizeof(info), "Component ID %d is invalid or unknown.", componentid);
    }
    
    SendClientMessage(playerid, 0x00FF00AA, info);
    return 1;
}
```


Get vehicle available vehicle components
To get available vehicle components:
```
CMD:getavailablecomponents(playerid, params[]) {
    if (!IsPlayerInAnyVehicle(playerid)) {
        SendClientMessage(playerid, 0xFF0000AA, "You must be in a vehicle to use this command.");
        return 1;
    }
    
    new vehicleid = GetPlayerVehicleID(playerid);
    new model = GetVehicleModel(vehicleid);
    
    new components[128];
    new count = 0;
    
    // Check each component type
    for (new i = 0; i < MAX_COMPONENTS; i++) {
        if (IsValidComponentForVehicle(model, i)) {
            if (count > 0) {
                strcat(components, ", ", sizeof(components));
            }
            new str[8];
            format(str, sizeof(str), "%d", i);
            strcat(components, str, sizeof(components));
            count++;
            
            // Limit the message length
            if (strlen(components) > 100) {
                strcat(components, "...", sizeof(components));
                break;
            }
        }
    }
    
    new info[256];
    if (count > 0) {
        format(info, sizeof(info), "Available components for this vehicle: %s", components);
    } else {
        format(info, sizeof(info), "No components available for this vehicle.");
    }
    
    SendClientMessage(playerid, 0x00FF00AA, info);
    return 1;
}

stock IsValidComponentForVehicle(model, componentid) {
    // This function needs to be implemented based on your game mode
    // It should return true if the component is valid for the vehicle model
    // This is just a placeholder implementation
    return true;
}
```

Add pursuit
To add a pursuit system:
```
new IsInPursuit[MAX_PLAYERS];
new PursuitTimer[MAX_PLAYERS];

public OnPlayerUpdate(playerid) {
    if (IsPlayerNearLawEnforcement(playerid)) {
        if (!IsInPursuit[playerid]) {
            StartPursuit(playerid);
        }
    }
    return 1;
}

StartPursuit(playerid) {
    IsInPursuit[playerid] = 1;
    
    // Send a message to the player
    SendClientMessage(playerid, 0xFF0000AA, "You are now in a pursuit with the police!");
    
    // Create a timer to update the pursuit status
    PursuitTimer[playerid] = SetTimerEx("UpdatePursuit", 5000, true, "d", playerid);
    
    // Notify the police
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i) && IsPlayerLawEnforcement(i)) {
            new msg[128];
            format(msg, sizeof(msg), "Pursuit in progress with %s. Check your GPS for their location.", GetName(playerid));
            SendClientMessage(i, 0xFF0000AA, msg);
            
            // Set a checkpoint to the player's location
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            SetPlayerCheckpoint(i, x, y, z, 10.0);
        }
    }
}

forward UpdatePursuit(playerid);
public UpdatePursuit(playerid) {
    if (!IsPlayerConnected(playerid)) {
        IsInPursuit[playerid] = 0;
        KillTimer(PursuitTimer[playerid]);
        return 1;
    }
    
    // Check if the player is still near law enforcement
    if (!IsPlayerNearLawEnforcement(playerid)) {
        EndPursuit(playerid);
        return 1;
    }
    
    // Update the police checkpoints
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i) && IsPlayerLawEnforcement(i)) {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            SetPlayerCheckpoint(i, x, y, z, 10.0);
        }
    }
    
    return 1;
}

EndPursuit(playerid) {
    IsInPursuit[playerid] = 0;
    KillTimer(PursuitTimer[playerid]);
    
    // Send a message to the player
    SendClientMessage(playerid, 0x00FF00AA, "You have escaped the pursuit!");
    
    // Notify the police
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i) && IsPlayerLawEnforcement(i)) {
            new msg[128];
            format(msg, sizeof(msg), "The pursuit with %s has ended.", GetName(playerid));
            SendClientMessage(i, 0xFF0000AA, msg);
            
            // Disable the checkpoint
            DisablePlayerCheckpoint(i);
        }
    }
}

stock IsPlayerNearLawEnforcement(playerid) {
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i) && i != playerid && IsPlayerLawEnforcement(i)) {
            if (IsPlayerInRangeOfPoint(i, 100.0, x, y, z)) {
                return 1;
            }
        }
    }
    
    return 0;
}

stock IsPlayerLawEnforcement(playerid) {
    // This function needs to be implemented based on your game mode
    // It should return true if the player is a law enforcement officer
    // This is just a placeholder implementation
    return false;
}

Create teleport portals
To create teleport portals

new teleportPortal1;
new teleportPortal2;

public OnGameModeInit() {
    // Create teleport portals
    teleportPortal1 = CreateDynamicCP(x1, y1, z1, size1, -1, -1, -1, 100.0); // Replace with actual coordinates
    teleportPortal2 = CreateDynamicCP(x2, y2, z2, size2, -1, -1, -1, 100.0); // Replace with actual coordinates
    
    return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid) {
    if (checkpointid == teleportPortal1) {
        // Teleport player to portal 2
        new Float:x, Float:y, Float:z;
        GetDynamicCPPos(teleportPortal2, x, y, z);
        SetPlayerPos(playerid, x, y, z);
        SendClientMessage(playerid, 0x00FF00AA, "You have been teleported!");
    } else if (checkpointid == teleportPortal2) {
        // Teleport player to portal 1
        new Float:x, Float:y, Float:z;
        GetDynamicCPPos(teleportPortal1, x, y, z);
        SetPlayerPos(playerid, x, y, z);
        SendClientMessage(playerid, 0x00FF00AA, "You have been teleported!");
    }
    
    return 1;
}

```


































