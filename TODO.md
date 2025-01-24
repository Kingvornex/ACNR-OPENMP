<!-- ROADMAP -->
# Roadmap
# save vehicle component mods by component slot
```pawn
#define MAX_STREAM_VEHICLES 1000
new GetvMods[MAX_STREAM_VEHICLES][12];

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

        new CARMODTYPE:componentType = GetVehicleComponentType(componentid);

        if (componentType != CARMODTYPE_NONE)
        {
            GetvMods[vehicleid][componentType] = componentid; // Save component based on slot and type
            SendClientMessage(playerid, 0x00FF00FF, "Component added to your vehicle and saved.");
        }
        else
        {
            SendClientMessage(playerid, 0xFF0000FF, "The component is invalid.");
        }
    }
    else
    {
        SendClientMessage(playerid, 0xFF0000FF, "This component cannot be added to your vehicle.");
    }

    return 1;
}
```

# add comma to money textdraw
```pawn
#include <a_samp>

forward FormatNumber(buffer[], number);

main() {
    // Initialization
}

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp("/mymoney", cmdtext, true, 10) == 0) {
        new money;
        GetPlayerMoney(playerid, money);

        new formattedMoney[24];
        FormatNumber(formattedMoney, money);

        new message[48];
        format(message, sizeof(message), "Your money: %s$", formattedMoney);
        SendClientMessage(playerid, -1, message);

        return 1;
    }
    return 0;
}

forward FormatNumber(buffer[], number) {
    new count = 0, length = 0, tempnum = number;
    
    // Get number of digits
    while (tempnum > 0) {
        tempnum /= 10;
        length++;
    }

    // Add commas to the number
    for (new i = length - 1; i >= 0; i--) {
        buffer[i + count] = (number % 10) + '0';
        number /= 10;

        if (i > 0 && (length - i) % 3 == 0) {
            buffer[i + (--count)] = ',';
        }
    }

    buffer[length + count] = '\0';
}
```

# updating to OPEN.mp
    - [ ] use upgrade tool
    - [ ] use y_hooks?
    - [ ] update whirlpool to bcrypt: https://github.com/Kingvornex/ACNR-OPENMP/blob/main/How%20to%20update%20to%20bcryp.md
    - [ ] Add easyDialog
    - [ ] Fix Anti Fake Kill
    - [ ] (fix login password) Add bcrypt
    - [ ] Save Vehicle Color with TUNE_MENU2 Purchases
    - [ ] Fix texdraws and loading screen after /restart
    - [ ] save in user files when the data being edited
    - [ ] Decrease robbery cool down 
    - [ ] Dont set robbery cool down if it failed
    - [ ] activate tdspeedo when player joins arena
    - [ ] Player marker mode global : 1 is still not active
    - [ ] SHOP VEHICLE DESTROYS BY ITSELF WONT RESPAWN
    - [ ] ADD COMMA TO MONEY TEXTDRAW
    - [ ] UNDER ONPLAYERSTATECHANGE ONLY USE NEWSTATE, USING OLDSTATE WITH IF WILL CAUSE BUG AND NOT EXECUTION SOME TIMES
    - [ ] CHANGE DEFAULT VEHICLE NUMBERPLATE FROM "ACNR" TO "VEHICLE NAME"
    - [ ] FIX /MYVEH CMD WITH MORE THAN 7 VEHICLES OWNED
    - [ ] ADD MORE CATEGORIES TO VEHICLE SHOP (TUNE ABLE VEHICLES)
    - [ ] ADD MORE SHOP VEHICLES (CHEKPOINTS)
    - [ ] SAVE SHOP VEHICLE MODS IN DIFRENT SLOTS FOR DIFFRENT PARTS
    - [ ] DONT LET PLAYER BUY DUPLICATE MODES (MODES TAHT ALREADY APPLIED)
    - [ ] SHOW PREVIEW OF MODE THEN CONFIRM FOR PURCHASE FOR MODE
    - [ ] LET PLAYER MOVE VIEW ANGLE WHEN IN TUNE MENU TO PERVENT OPENING AND CLOSING MENU MULTIPLE TIMES
# eject all players in vehicle, usable in /dcar or else
```pawn
stock EjectAllPlayers()
{
    new playerid;
    for (playerid = 0; playerid < MAX_PLAYERS; playerid++)
    {
        if (IsPlayerConnected(playerid)) 
        {
            new vehid = GetPlayerVehicleID(playerid);
            if (vehid != INVALID_VEHICLE_ID)
            {
                RemovePlayerFromVehicle(playerid); // Eject the player from the vehicle
            }
        }
    }
    return 1;
}
```
```pawn
stock EjectAllPlayers()
{
    new playerid, vehid, seatid;
    for (playerid = 0; playerid < MAX_PLAYERS; playerid++)
    {
        if (IsPlayerConnected(playerid)) 
        {
            vehid = GetPlayerVehicleID(playerid);
            if (vehid != INVALID_VEHICLE_ID)
            {
                // Check if the player is in a vehicle and not in a seat already occupied
                new maxSeats = GetVehicleMaxPassengers(vehid);
                for (seatid = 0; seatid < maxSeats; seatid++)
                {
                    if (GetVehiclePassenger(vehid, seatid) == playerid)
                    {
                        // Player is in a seat, break and proceed to next player
                        break;
                    }
                }

                // Eject if the player is seated, but only proceed if all seats are occupied
                if (seatid == maxSeats || seatid == 0)
                {
                    RemovePlayerFromVehicle(playerid); // Eject the player from the vehicle
                }
            }
        }
    }
    return 1;
}
```

# 2.2.3.7 TODO
    - [x] /color -1
    - [ ] e-c-menu
    - [ ] onvehicledeath
    - [ ] e-c-tune-menu
    - [x] /respawnshopcars
    - [x] /respawnmycars
    - [x] /vehmenu
    - [x] create new veh pos
    - [x] /unstuck 
    - [x] /getplayer 
    - [ ] neon
    - [ ] Add /fanim
    - [ ] Add strip club
    - [ ] actor in -13, -179, 1
    - [ ] pirate ship object is still bug and appears in random places
    - [ ] ufo not moving
    - [ ] change /playaudio to /playmusic
    - [ ] MOVE ARENA 3
    - [ ] MOVE ARENA 4
    - [ ] dynamic actor
    - [ ] ufo bug at -1622, 2559, 112
    - [ ] ufo bug at -790, 2663, 100
    - [ ] ufo bug at 377, 2480, 24
    - [ ] ufo bug at 543, 2424, 29
    - [ ] attach ufo objects togeter so it wont be bug
    - [ ] increase ufo speed?
    - [ ] move island 1 closer to land
    - [ ] save /kojam to file like /bug
    - [ ] add geo ip: https://github.com/Southclaws/SAMP-geoip
    - [ ] https://github.com/PatrickGTR/actor_robbery
    - [ ] use https://github.com/alextwothousand/mSelection for vehicles shop menu, also add more categories to car shop menu
    - [ ] add ships to vehicles shop menu and spawn them in water and after spawn set checkpoint and send massage that vehicle is spawnd in water 
    - [ ] dcar
    - [ ] eject all car seats
    - [ ] get car seats for drag
    - [ ] get component information 
    - [ ] get vehicle available vehicle components 
    - [ ] tune menu generator
    - [ ] /c in easydialog vs mdialog
    - [ ] class selection
    - [ ] add pursuit
```pawn
public OnPlayerUpdate(playerid)
{
    if(IsPlayerNearLawEnforcement(playerid) == 1)
    {
        //police chasing msg or timer (pursuit) or textdraw
    }
```

- [ ] Teta ToDo List:
    - [ ] save in user files when the data is being edited
    - [ ] Player that used /kill , it's respawn in reconnect is bug
    - [ ] Create teleport portals: big checkpoints in map that entering them will teleport imidietly
    - [ ] animation bug
    - [ ] one shop interior bug
    - [ ] vehicle tune menu bug
    - [ ] add guide for skin selection section under right and left options ("press left to access civilian class faster")
    - [ ] /drag cmd range is very low
    - [ ] add requests bribe to police to request wanted level an amount of money
    - [ ] add my vehicles to /gps
    - [ ] add points of intrest locutions to /gps
    - [ ] add /teleport menu for admin
    - [ ] add playerid to their chat messages
    - [ ] add music playlist
    - [ ] add https://github.com/samp-incognito/samp-audio-server-plugin
    - [ ] cmd /drag
```pawn
CMD:drag(playerid, params[])
{
    new targetid;
    new Float:x, Float:y, Float:z;
    
    // Ensure the player is in a vehicle
    if(!IsPlayerInAnyVehicle(playerid)) 
        return SendClientMessageACNR(playerid, RED, "You must be in a vehicle to use this command.");

    // Parse target player ID
    if(sscanf(params, "u", targetid)) 
        return SendClientMessageACNR(playerid, RED, "[USAGE]: /drag [PlayerID]");
    
    // Validate target player
    if(!IsPlayerConnected(targetid)) 
        return SendClientMessageACNR(playerid, RED, "The target player is not connected.");
    if(targetid == playerid) 
        return SendClientMessageACNR(playerid, RED, "You cannot drag yourself.");
    
    // Check if the player has admin privileges
    if(PlayerInfo[playerid][aLevel] <= 0) 
        return SendClientMessageACNR(playerid, RED, "Error: You are not an admin.");
    
    // Get position of the player who is in the vehicle
    GetPlayerPos(playerid, x, y, z);
    
    // Check if the target player is within range
    if(IsPlayerInRangeOfPoint(targetid, 20.0, x, y, z))
    {
        // Ensure the target player is not already in a vehicle
        if(IsPlayerInAnyVehicle(targetid)) 
            return SendClientMessageACNR(playerid, RED, "The target player is already in a vehicle.");

        // Get the player's vehicle ID
        new carid = GetPlayerVehicleID(playerid);
        
        // Put the target player in the vehicle
        PutPlayerInVehicle(targetid, carid, 1);
        
        // Send messages to both the admin and the target player
        new sttr[256];
        format(sttr, 256, "Admin %s has dragged you into their vehicle.", GetName(playerid));
        SendClientMessageACNR(targetid, RED, sttr);
        SendClientMessageACNR(playerid, GREEN, "You have successfully dragged the player into your vehicle.");
    }
    else
    {
        SendClientMessageACNR(playerid, RED, "The target player is not near you.");
    }
    
    return 1;
}
```
```pawn
CMD:drag(playerid, params[])
{
    new targetid;
    new Float:x, Float:y, Float:z;
    
    // Ensure the player is in a vehicle
    if(!IsPlayerInAnyVehicle(playerid)) 
        return SendClientMessageACNR(playerid, RED, "You must be in a vehicle to use this command.");

    // Parse target player ID
    if(sscanf(params, "u", targetid)) 
        return SendClientMessageACNR(playerid, RED, "[USAGE]: /drag [PlayerID]");
    
    // Validate target player
    if(!IsPlayerConnected(targetid)) 
        return SendClientMessageACNR(playerid, RED, "The target player is not connected.");
    if(targetid == playerid) 
        return SendClientMessageACNR(playerid, RED, "You cannot drag yourself.");
    
    // Check if the player has admin privileges
    if(PlayerInfo[playerid][aLevel] <= 0) 
        return SendClientMessageACNR(playerid, RED, "Error: You are not an admin.");
    
    // Get position of the player who is in the vehicle
    GetPlayerPos(playerid, x, y, z);
    
    // Check if the target player is within range
    if(IsPlayerInRangeOfPoint(targetid, 20.0, x, y, z))
    {
        // Ensure the target player is not already in a vehicle
        if(IsPlayerInAnyVehicle(targetid)) 
            return SendClientMessageACNR(playerid, RED, "The target player is already in a vehicle.");
        
        // Get the player's vehicle ID
        new carid = GetPlayerVehicleID(playerid);
        
        // Check if the vehicle has passenger seats
        new maxSeats = GetVehicleMaxPassengers(carid);
        new seatid;
        bool seatAvailable = false;

        // Loop through all the seats to find an empty seat
        for (seatid = 0; seatid < maxSeats; seatid++)
        {
            if (GetVehiclePassenger(carid, seatid) == INVALID_PLAYER_ID)
            {
                seatAvailable = true;
                break;
            }
        }

        // If no seat is available, notify the player
        if (!seatAvailable)
        {
            return SendClientMessageACNR(playerid, RED, "There are no available seats in the vehicle.");
        }
        
        // Put the target player in the first available seat
        PutPlayerInVehicle(targetid, carid, seatid);

        // Send messages to both the admin and the target player
        new sttr[256];
        format(sttr, 256, "Admin %s has dragged you into their vehicle.", GetName(playerid));
        SendClientMessageACNR(targetid, RED, sttr);
        SendClientMessageACNR(playerid, GREEN, "You have successfully dragged the player into your vehicle.");
    }
    else
    {
        SendClientMessageACNR(playerid, RED, "The target player is not near you.");
    }
    
    return 1;
}
```
```pawn
CMD:drag(playerid, params[])
{
    new targetid;
    new Float:x, Float:y, Float:z;
    
    if(!IsPlayerInAnyVehicle(playerid)) 
        return SendClientMessageACNR(playerid, RED, "Shoma bayad dar mashin bashid");

    if(sscanf(params, "u", targetid)) 
        return SendClientMessageACNR(playerid, RED, "[USAGE]: /drag [PlayerID]");

    if(targetid == INVALID_PLAYER_ID) 
        return SendClientMessageACNR(playerid, RED, "Invalid playerid");

    if(!IsPlayerConnected(targetid)) 
        return SendClientMessageACNR(playerid, RED, "Player is not connected");

    if(targetid == playerid) 
        return SendClientMessageACNR(playerid, RED, "Shoma nemitavanid khod ra drag konid.");

    if(PlayerInfo[playerid][aLevel] <= 0) 
        return SendClientMessageACNR(playerid, RED, "Error: You are not admin.");

    GetPlayerPos(playerid, x, y, z);

    if(!IsPlayerInRangeOfPoint(targetid, 20.0, x, y, z)) 
        return SendClientMessageACNR(playerid, RED, "Player is not near you.");

    new carid = GetPlayerVehicleID(playerid);
    new seats = GetVehicleSeats(GetVehicleModel(carid));
    new seatFound = false;

    // Check for available seats
    for (new i = 1; i < seats; i++) // Starting from 1 as 0 is the driver seat
    {
        if (GetPlayerVehicleSeat(targetid) == -1) // If the player is not in a vehicle
        {
            // Check if the seat is available
            if (GetVehicleOccupiedSeats(carid, i) == false)
            {
                PutPlayerInVehicle(targetid, carid, i);
                seatFound = true;
                new sttr[256];
                format(sttr, 256, "Admin %s drags you to his/her vehicle.", GetName(playerid));
                SendClientMessageACNR(targetid, RED, sttr);
                break;
            }
        }
    }

    if (!seatFound) 
    {
        SendClientMessageACNR(playerid, RED, "All passenger seats are full or no seat available.");
    }
    else 
    {
        SendClientMessageACNR(playerid, GREEN, "Dragged.");
    }

    return 1;
}
```

- [ ] CODE BUG FIXES
    - [ ] FIX VEHICLE SPEED CODES (OnPlayerUpdate, soratbegirs, GetPlayerSpeed, GetVehicleSpeed, ACNR_anticheat) TOO MANY DIFFRENT CODES FOR SPEED, MAKE THEM ONE (SOME DIDN'T USE Z VELOCITY)
    - [ ] MAKE A WAY TO SHORTEN OnDialogResponse CODES (maybe https://github.com/Awsomedude/easyDialog)
    - [ ] SEEMS TO HAVE REPEATED CODES UNDER OnVehicleDeath

- [ ] more CODE BUG FIXES
    - [ ] some interiors change player VW, make sure set it back when they come out of interior
    - [ ] open dialog automaticly when player goes to elevator checkpoint like : case NVPD_ELEV_CP
    - [ ] make help and cmd_list dialogs more readable and also make cmds dialog clickable to execute commands form it

- [ ] ADD NEW FEATURES
    - [ ] MAYBE ADD TIMERS TO AFK MASSAGE (HOW MANY SECONDS, MINUTES, HOURS PLAYER WAS AFK)
    - [ ] ADD "BACK" OPTION TO DIALOGS
    - [ ] add /run cmd to change running animation
    - [ ] add /skin cmd to change skin
    - [ ]  add /tune for car tuning
    - [ ] add START ROBBERY to shop checkpoints
    - [ ] add /setplayerskin for admin
    - [ ] add preloaded houses
    - [ ] add checkpoint to /service areas and automatically open dialog
    - [ ] mabe add zombies and aliens or animals
    - [ ] add /jobs cmd to show jobs list and set a marker to their locations and jobs specific commands 
    - [ ] **police tags wanted players with gps devices so they can see where they are in all over the map even which shop and interior they go, the wanted players that are tagged need to buy another device from shops to use it and remove gps tag from themselves.** https://github.com/Kiiruuu/GPSBullet
    - [ ] add hidden admin and make cmd for it (make sure make admin hidden in all chat commands such as /n /new etc.)
    - [ ] add dancing actors close to player skin selector
    - [ ] change car shop and akin shop menus to textdraws with previews
    - [ ] add dancing actors in street
    - [ ] check player VW in skin selector menu
    - [ ] add ranged streaming music for casino and disco entrance
    - [ ] a way for players to reset password
    - [ ] Set player money to 0 always then remove white background textdraw and move money textdraw to fit game money numbers ($0 / $000000)
```pawn
stock GivePlayerCash(playerid, money)
{
    ServerSideCash[playerid] += money;
    ResetServerCash(playerid);
    //UpdateServerCash(playerid,ServerSideCash[playerid]);
  UpdateServerCash(playerid,0);
    return ServerSideCash[playerid];
}

stock SetPlayerCash(playerid, money)
{
    ServerSideCash[playerid] = money;
    ResetServerCash(playerid);
    //UpdateServerCash(playerid,ServerSideCash[playerid]);
  UpdateServerCash(playerid,0);
    return ServerSideCash[playerid];
}

stock ResetPlayerCash(playerid)
{
    ServerSideCash[playerid] = 0;
    ResetServerCash(playerid);
    //UpdateServerCash(playerid,ServerSideCash[playerid]);
  UpdateServerCash(playerid,0);
    return ServerSideCash[playerid];
}

            //Anti Money Cheat
            if(GetPlayerCash(playerid) != GetPlayerCash(playerid))
            {
                ResetServerCash(playerid);
                UpdateServerCash(playerid, 0);
            }
```
```pawn
public OnPlayerUpdate(playerid)
{
    ResetPlayerMoney(playerid);
```

- [ ] adding features from Grand Larceny gamemode
    - [ ] gl_npcs.pwn
    - [ ] ls_elevator.pwn
    - [ ] ls_mall.pwn
    - [ ] maxips.pwn
    - [ ] netstats.pwn
    - [ ] pnetstats.pwn
    - [ ] iradio.pwn
    - [ ] gl_realtime.pwn
    - [ ] gl_property.pwn
    - [ ] gl_mapicon.pwn
    - [ ] gl_chatbubble.pwn
    - [ ] cargoship.pwn

- [ ] adding features from sf-cnr gamemode
    - [ ] Action packed gang wars
    - [ ] Kidnap players and hold them for ransom
    - [ ] Blowing up the jail cells to break out criminals from prisons
    - [ ] Steal furniture and cash them at the Pawn Shop
    - [ ] Create methamphetamine in RVs and export to Cluckin' Bell
    - [ ] Bank, drug house and ship hiests
    - [ ] Rob NPC security trucks
    - [ ] Blowing up Alcatraz to release the high-risk criminals
    - [ ] Jacking cars and exporting them in Shipyard containers
    - [ ] Rob atms
    - [ ] Gamble the casinos in SA-MP
    - [ ] Race players
    - [ ] fireworks
    - [ ] Play 8-Ball Pool
    - [ ] Play Poker
    - [ ] House, vehicle, garage, gate, gang facility, business systems
    - [ ] Toy/clothes system
    - [ ] Paintball system
    - [ ] Battle Royale Minigame
    - [ ]  

- [ ] adding features from GTAopen gamemode
    - [ ] Houses with different interiors that can be customised with an array of furnitures
    - [ ] Be a drug dealer, get the skill to plant cannabis and make cocaine
    - [ ] Gangs, competitive gang system that competes with other gangs kills, deaths and zone captures

- [ ] updating Anti-Cheat
    - [ ] Nex-AC - Anticheat system: https://github.com/NexiusTailer/Nex-AC/tree/master

- [ ] adding features github.com/srafay/SAMP-Server/commits
    - [ ] Added Discord bot to the server with following features :
        - [ ] Can send message to Discord channel if someone joins the server
        - [ ] Admins can send message to discord channel from the game
        - [ ] Admins can send messages in-game from the discord channel
    - [ ] Made system for house entering and exit by pressing [F]
    - [ ] Working with properties, added some houses for test
    - [ ] Added icons filter script to the server
    - [ ] Fixed the Gate object's z-coordinates at Market

- [ ] bug fixes scripts:
    - [ ] MapFix: https://github.com/NexiusTailer/MapFix?tab=readme-ov-file
    - [ ] new open.mp fixes.inc

- [ ] optional:
    - [ ] FilterScript TextDraw-FPS SA:MP: https://github.com/ocalasans/TextDraw-FPS
    - [ ] Headphones(in-game music player): https://github.com/lunosat/Headphone-Filterscript-SA-MP

- [ ] features from other's:
    - [ ] Trucking system: https://github.com/lucian-nk/Romania-Live-Trucking
    - [ ] Pursuit system: https://github.com/NCMohit/Pursuit-Gamemode-SAMP
    - [ ] maps: https://github.com/MacMailler/GWRP-0.3/tree/develop/server/scriptfiles/maps
    - [ ] Apple Valley Speedway map: https://forum.open.mp/showthread.php?tid=2029
    - [ ] SAMP-Blake-Island map: https://github.com/HeLiOn--PrImE/SAMP-Blake-Island
    -  [ ] SAMP - Eiffel Tower map: https://forum.open.mp/showthread.php?tid=2421
    -  [ ] Touge Track map: https://forum.open.mp/showthread.php?tid=2071
    -  [ ] SWAT VS TERRORIST FULL MAP: https://forum.open.mp/showthread.php?tid=2366
    -  [ ] The Farm Prison map: https://forum.open.mp/showthread.php?tid=1635
    -  [ ] Add other GTA games maps

-  [ ] more features:
    -  [ ] add robbing from safe: https://sampforum.blast.hk/showthread.php?tid=632154
    -  [ ] Kill The President minigame: https://sampforum.blast.hk/showthread.php?tid=665076
    -  [ ] https://freegeoip.io/ GeoIP: https://sampforum.blast.hk/showthread.php?tid=591916
    -  [ ] samp-ships: https://sampforum.blast.hk/showthread.php?tid=642692
    -  [ ] drift-detection: https://sampforum.blast.hk/showthread.php?tid=649800
    -  [ ] Maze Generator: https://sampforum.blast.hk/showthread.php?tid=645290
    -  [ ] OnPlayerClickPlayer: https://sampforum.blast.hk/showthread.php?tid=651714
    -  [ ] textdraw fade effect: https://github.com/Gammix/fader.inc/blob/master/pawno/include/fader.inc
    -  [ ] **zmessage: https://github.com/Open-GTO/zmessage
    -  [ ] Ranking system: Code:

```pawn
    if(GetPlayerScore(playerid) >= 0 && GetPlayerScore(playerid) < 100) format(player, sizeof(player), "Newbie");
    else if(GetPlayerScore(playerid) >= 100 && GetPlayerScore(playerid) < 500) format(player, s