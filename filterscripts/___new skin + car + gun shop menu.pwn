PreviewModelDialog.inc

CMD:skins(playerid) {
    const MAX_SKINS = 312;
    new subString[16];
    static string[MAX_SKINS * sizeof(subString)];

    // Populate the string with skin IDs and names
    if (string[0] == EOS) {
        for (new i = 0; i < MAX_SKINS; i++) {
            format(subString, sizeof(subString), "%i\tID: %i\n", i, i);
            strcat(string, subString);
        }
    }
    
    // Show the skin selection dialog with a preview model
    return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_PREVIEW_MODEL, "Skin Selection", string, "Select", "Cancel");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 0) { // Skin selection dialog
        if (response) {
            SetPlayerSkin(playerid, listitem);
            GameTextForPlayer(playerid, "~g~Skin Changed!", 3000, 3);
        }
    }
    return 1;
}


enum E_WEAPON_SHOP_DATA {
    WEAPON_MODELID,
    WEAPON_NAME[35],
    WEAPON_PRICE,
    WEAPON_AMMO,
    WEAPON_ID
};

new const WEAPON_SHOP[][E_WEAPON_SHOP_DATA] = {
    {335, "Knife", 0, 1, WEAPON_KNIFE},
    {341, "Chainsaw", 1500, 1, WEAPON_CHAINSAW},
    {342, "Grenade", 1545, 1, WEAPON_GRENADE},
    {343, "Moltove", 1745, 1, WEAPON_MOLTOV},
    {347, "Silenced 9mm", 1500, 150, WEAPON_SILENCED},
    {348, "Desert Eagle", 3199, 150, WEAPON_DEAGLE},
    {350, "Sawed Off Shotgun", 4999, 100, WEAPON_SAWEDOFF},
    {351, "Spas12 Shotgun", 3870, 100, WEAPON_SHOTGSPA},
    {352, "Micro-UZI", 3500, 300, WEAPON_UZI},
    {353, "MP5", 2999, 200, WEAPON_MP5},
    {372, "Tec-9", 3500, 300, WEAPON_TEC9},
    {358, "Sniper Rifle", 4999, 50, WEAPON_SNIPER},
    {355, "Ak47", 2999, 200, WEAPON_AK47},
    {356, "M4", 3155, 200, WEAPON_M4},
    {359, "RPG", 1999, 1, WEAPON_ROCKETLAUNCHER},
    {361, "Flamethrower", 3500, 350, WEAPON_FLAMETHROWER},
    {362, "Minigun", 10000, 350, WEAPON_MINIGUN},
    {363, "Satchel Charge", 1999, 2, WEAPON_SATCHEL},
    {365, "Spray Can", 800, 200, WEAPON_SPRAYCAN},
    {366, "Fire Extinguisher", 855, 200, WEAPON_FIREEXTINGUISHER}
};

CMD:weapons(playerid) {
    new subString[64];
    static string[sizeof(WEAPON_SHOP) * sizeof(subString)];

    // Populate weapon shop list
    if (string[0] == EOS) {
        for (new i = 0; i < sizeof(WEAPON_SHOP); i++) {
            format(subString, sizeof(subString), "%i (Model: %.2f)\t%s~n~~g~~h~$%i\n", 
                WEAPON_SHOP[i][WEAPON_MODELID], 0.0, WEAPON_SHOP[i][WEAPON_NAME], WEAPON_SHOP[i][WEAPON_PRICE]);
            strcat(string, subString);
        }
    }

    // Show weapon selection dialog with preview model
    return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PREVIEW_MODEL, "Weapon Shop", string, "Purchase", "Cancel");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 1) { // Weapon selection dialog
        if (response) {
            if (GetPlayerMoney(playerid) < WEAPON_SHOP[listitem][WEAPON_PRICE]) {
                SendClientMessage(playerid, 0xAA0000FF, "Not enough money to purchase this gun!");
                return cmd_weapons(playerid);
            }

            // Deduct the price and give the weapon to the player
            GivePlayerMoney(playerid, -WEAPON_SHOP[listitem][WEAPON_PRICE]);
            GivePlayerWeapon(playerid, WEAPON_SHOP[listitem][WEAPON_ID], WEAPON_SHOP[listitem][WEAPON_AMMO]);

            GameTextForPlayer(playerid, "~g~Gun Purchased!", 3000, 3);
        }
    }
    return 1;
}


// Define vehicle shop data
enum E_VEHICLE_SHOP_DATA {
    VEHICLE_MODELID,
    VEHICLE_NAME[35],
    VEHICLE_PRICE,
    VEHICLE_ID
};

new const VEHICLE_SHOP[][E_VEHICLE_SHOP_DATA] = {
    {411, "Infernus", 25000, VEHICLE_INFERNUS},
    {415, "Cheetah", 15000, VEHICLE_CHEETAH},
    {429, "Turismo", 20000, VEHICLE_TURISMO},
    {402, "Buffalo", 12000, VEHICLE_BUFFALO},
    {474, "Elegy", 22000, VEHICLE_ELEGY},
    {451, "Phoenix", 18000, VEHICLE_PHOENIX},
    {520, "Banshee", 24000, VEHICLE_BANSHEE},
    {586, "Linerunner", 30000, VEHICLE_LINERUNNER}
};

CMD:carshop(playerid) {
    new subString[64];
    static string[sizeof(VEHICLE_SHOP) * sizeof(subString)];

    // Populate vehicle shop list
    if (string[0] == EOS) {
        for (new i = 0; i < sizeof(VEHICLE_SHOP); i++) {
            format(subString, sizeof(subString), "%i (Model: %.2f)\t%s~n~~g~~h~$%i\n", 
                VEHICLE_SHOP[i][VEHICLE_MODELID], 0.0, VEHICLE_SHOP[i][VEHICLE_NAME], VEHICLE_SHOP[i][VEHICLE_PRICE]);
            strcat(string, subString);
        }
    }

    // Show car selection dialog with preview model
    return ShowPlayerDialog(playerid, 2, DIALOG_STYLE_PREVIEW_MODEL, "Car Shop", string, "Purchase", "Cancel");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 2) { // Car selection dialog
        if (response) {
            if (GetPlayerMoney(playerid) < VEHICLE_SHOP[listitem][VEHICLE_PRICE]) {
                SendClientMessage(playerid, 0xAA0000FF, "Not enough money to purchase this car!");
                return cmd_carshop(playerid); // Show the car shop again
            }

            // Deduct the price and spawn the car for the player
            GivePlayerMoney(playerid, -VEHICLE_SHOP[listitem][VEHICLE_PRICE]);

            // Get the model ID for the selected vehicle
            new vehicleModel = VEHICLE_SHOP[listitem][VEHICLE_MODELID];

            // Spawn the vehicle for the player at their location
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            CreateVehicle(vehicleModel, x + 5.0, y + 5.0, z, 0.0, 0, 0, 0);

            GameTextForPlayer(playerid, "~g~Car Purchased!", 3000, 3);
        }
    }
    return 1;
}


// Define the categories and their vehicles
enum E_VEHICLE_SHOP_DATA {
    VEHICLE_MODELID,
    VEHICLE_NAME[35],
    VEHICLE_PRICE,
    VEHICLE_IMAGE[35]
};

// Land vehicles category
new const LAND_VEHICLES[][E_VEHICLE_SHOP_DATA] = {
    {581, "BF-400", 5000, "Bf400.png"},
    {509, "Bike", 1500, "Bike.png"},
    {481, "BMX", 300, "Bmx.png"},
    {462, "Faggio", 2500, "Faggio.png"},
    {521, "FCR-900", 7000, "Fcr900.png"},
    {463, "Freeway", 4000, "Freeway.png"},
    {510, "Mountain Bike", 1000, "Mtbike.png"},
    {522, "NRG-500", 10000, "Nrg500.png"},
    {461, "PCJ-600", 6000, "Pcj600.png"},
    {448, "Pizzaboy", 1500, "Pizzaboy.png"},
    {468, "Sanchez", 4000, "Sanchez.png"},
    {586, "Wayfarer", 3000, "Wayfarer.png"}
};

// 2-Door & Compact Cars category
new const COMPACT_CARS[][E_VEHICLE_SHOP_DATA] = {
    {602, "Alpha", 12000, "Alpha.png"},
    {496, "Blista Compact", 6000, "Blistac.png"},
    {401, "Bravura", 8000, "Bravura.png"},
    {518, "Buccaneer", 15000, "Buccanee.png"},
    {527, "Cadrona", 10000, "Cadrona.png"},
    {589, "Club", 12000, "Club.png"},
    {419, "Esperanto", 7000, "Esperant.png"},
    {587, "Euros", 16000, "Euros.png"},
    {533, "Feltzer", 18000, "Feltzer.png"},
    {526, "Fortune", 14000, "Fortune.png"}
};

// Add other categories (4-Door & Luxury Cars, SUVs, etc.) similarly

// Show categories
CMD:carshop(playerid) {
    new subString[64];
    static string[1024];
    if (string[0] == EOS) {
        format(subString, sizeof(subString), "1. Land Vehicles\n2. Compact Cars\n3. SUVs\n4. Bikes\n...");
        strcat(string, subString);
    }

    return ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Select Vehicle Category", string, "Select", "Cancel");
}

// Display vehicle list for selected category
CMD:selectcategory(playerid, categoryID) {
    new subString[64];
    static string[1024];
    if (string[0] == EOS) {
        // Loop through the selected category (e.g., Land Vehicles)
        for (new i = 0; i < sizeof(LAND_VEHICLES); i++) {
            format(subString, sizeof(subString), "%i. %s ~n~~g~$%i\n", i + 1, LAND_VEHICLES[i][VEHICLE_NAME], LAND_VEHICLES[i][VEHICLE_PRICE]);
            strcat(string, subString);
        }
    }

    return ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Select Your Vehicle", string, "Purchase", "Cancel");
}

// Handle vehicle purchase
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 3) { // Car categories dialog
        if (response) {
            // Call the function for the appropriate category
            if (listitem == 0) {
                return selectcategory(playerid, 0); // Land Vehicles
            }
            if (listitem == 1) {
                return selectcategory(playerid, 1); // Compact Cars
            }
            // Add more categories as needed
        }
    }

    if (dialogid == 4) { // Vehicle selection dialog
        if (response) {
            new vehicleModel = LAND_VEHICLES[listitem][VEHICLE_MODELID];
            new vehiclePrice = LAND_VEHICLES[listitem][VEHICLE_PRICE];

            if (GetPlayerMoney(playerid) < vehiclePrice) {
                SendClientMessage(playerid, 0xAA0000FF, "Not enough money to purchase this vehicle!");
                return selectcategory(playerid, 0); // Show Land Vehicles again
            }

            GivePlayerMoney(playerid, -vehiclePrice); // Deduct the money

            // Spawn the vehicle at the player's position
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            CreateVehicle(vehicleModel, x + 5.0, y + 5.0, z, 0.0, 0, 0, 0);

            GameTextForPlayer(playerid, "~g~Vehicle Purchased!", 3000, 3);
        }
    }

    return 1;
}

// Define the vehicle categories and their data

enum E_VEHICLE_SHOP_DATA {
    VEHICLE_MODELID,
    VEHICLE_NAME[35],
    VEHICLE_PRICE,
    VEHICLE_IMAGE[35]
};

// Land vehicles category
new const LAND_VEHICLES[][E_VEHICLE_SHOP_DATA] = {
    {581, "BF-400", 5000, "Bf400.png"},
    {509, "Bike", 1500, "Bike.png"},
    {481, "BMX", 300, "Bmx.png"},
    {462, "Faggio", 2500, "Faggio.png"},
    {521, "FCR-900", 7000, "Fcr900.png"},
    {463, "Freeway", 4000, "Freeway.png"},
    {510, "Mountain Bike", 1000, "Mtbike.png"},
    {522, "NRG-500", 10000, "Nrg500.png"},
    {461, "PCJ-600", 6000, "Pcj600.png"},
    {448, "Pizzaboy", 1500, "Pizzaboy.png"},
    {468, "Sanchez", 4000, "Sanchez.png"},
    {586, "Wayfarer", 3000, "Wayfarer.png"}
};

// 2-Door & Compact cars category
new const COMPACT_CARS[][E_VEHICLE_SHOP_DATA] = {
    {602, "Alpha", 12000, "Alpha.png"},
    {496, "Blista Compact", 6000, "Blistac.png"},
    {401, "Bravura", 8000, "Bravura.png"},
    {518, "Buccaneer", 15000, "Buccanee.png"},
    {527, "Cadrona", 10000, "Cadrona.png"},
    {589, "Club", 12000, "Club.png"},
    {419, "Esperanto", 7000, "Esperant.png"},
    {587, "Euros", 16000, "Euros.png"},
    {533, "Feltzer", 18000, "Feltzer.png"},
    {526, "Fortune", 14000, "Fortune.png"},
    {474, "Hermes", 15000, "Hermes.png"},
    {545, "Hustler", 13000, "Hustler.png"},
    {517, "Majestic", 14000, "Majestic.png"},
    {410, "Manana", 5000, "Manana.png"},
    {600, "Picador", 7000, "Picador.png"},
    {436, "Previon", 8000, "Previon.png"},
    {439, "Stallion", 12000, "Stallion.png"},
    {549, "Tampa", 11000, "Tampa.png"},
    {491, "Virgo", 9000, "Virgo.png"}
};

// 4-Door & Luxury cars category
new const LUXURY_CARS[][E_VEHICLE_SHOP_DATA] = {
    {445, "Admiral", 15000, "Admiral.png"},
    {604, "Damaged Glendale", 8000, "Glenshit.png"},
    {507, "Elegant", 10000, "Elegant.png"},
    {585, "Emperor", 25000, "Emperor.png"},
    {466, "Glendale", 12000, "Glendale.png"},
    {492, "Greenwood", 10000, "Greenwoo.png"},
    {546, "Intruder", 15000, "Intruder.png"},
    {551, "Merit", 11000, "Merit.png"},
    {516, "Nebula", 12000, "Nebula.png"},
    {467, "Oceanic", 15000, "Oceanic.png"},
    {426, "Premier", 14000, "Premier.png"},
    {547, "Primo", 8000, "Primo.png"},
    {405, "Sentinel", 20000, "Sentinel.png"},
    {580, "Stafford", 25000, "Stafford.png"},
    {409, "Stretch", 35000, "Stretch.png"},
    {550, "Sunrise", 18000, "Sunrise.png"},
    {566, "Tahoma", 12000, "Tahoma.png"},
    {540, "Vincent", 20000, "Vincent.png"},
    {421, "Washington", 22000, "Washing.png"},
    {529, "Willard", 13000, "Willard.png"}
};

// Civil service category
new const CIVIL_SERVICE[][E_VEHICLE_SHOP_DATA] = {
    {485, "Baggage", 5000, "Baggage.png"},
    {431, "Bus", 20000, "Bus.png"},
    {438, "Cabbie", 15000, "Cabbie.png"},
    {437, "Coach", 25000, "Coach.png"},
    {574, "Sweeper", 15000, "Sweeper.png"},
    {420, "Taxi", 15000, "Taxi.png"},
    {525, "Towtruck", 20000, "Towtruck.png"},
    {408, "Trashmaster", 10000, "Trash.png"},
    {552, "Utility Van", 10000, "Utility.png"}
};

// Government vehicles category
new const GOVERNMENT_VEHICLES[][E_VEHICLE_SHOP_DATA] = {
    {416, "Ambulance", 25000, "Ambulan.png"},
    {433, "Barracks", 50000, "Barracks.png"},
    {427, "Enforcer", 35000, "Enforcer.png"},
    {490, "FBI Rancher", 50000, "Fbiranch.png"},
    {528, "FBI Truck", 60000, "Fbitruck.png"},
    {407, "Fire Truck", 45000, "Firetruk.png"},
    {544, "Fire Truck", 45000, "Firela.png"},
    {523, "HPV1000", 30000, "Hpv1000.png"},
    {470, "Patriot", 35000, "Patriot.png"},
    {596, "Police LS", 40000, "Policels.png"},
    {598, "Police LV", 40000, "Policelv.png"},
    {599, "Police Ranger", 40000, "Policeru.png"},
    {597, "Police SF", 40000, "Policesf.png"},
    {432, "Rhino", 100000, "Rhino.png"},
    {601, "S.W.A.T.", 80000, "Swatvan.png"},
    {428, "Securicar", 50000, "Securica.png"}
};

// Heavy & Utility trucks category
new const HEAVY_UTILITY_TRUCKS[][E_VEHICLE_SHOP_DATA] = {
    {499, "Benson", 30000, "Benson.png"},
    {609, "Boxville Mission", 25000, "Boxburg.png"},
    {498, "Boxville", 20000, "Boxville.png"},
    {524, "Cement Truck", 45000, "Cement.png"},
    {532, "Combine Harvester", 35000, "Combine.png"},
    {578, "DFT-30", 30000, "Dft30.png"},
    {486, "Dozer", 50000, "Dozer.png"},
    {406, "Dumper", 45000, "Dumper.png"},
    {573, "Dune", 35000, "Dune.png"},
    {455, "Flatbed", 30000, "Flatbed.png"},
    {588, "Hotdog", 20000, "Hotdog.png"},
    {403, "Linerunner", 25000, "Linerun.png"},
    {423, "Mr. Whoopee", 15000, "Mrwhoop.png"},
    {414, "Mule", 18000, "Mule.png"},
    {443, "Packer", 35000, "Packer.png"},
    {515, "Roadtrain", 50000, "Rdtrain.png"},
    {514, "Tanker", 45000, "Tanker.png"},
    {531, "Tractor", 25000, "Tractor.png"},
    {456, "Yankee", 22000, "Yankee.png"}
};

// Light trucks & Vans category
new const LIGHT_TRUCKS_VANS[][E_VEHICLE_SHOP_DATA] = {
    {459, "Berkley's RC Van", 10000, "Topfun.png"},
    {422, "Bobcat", 15000, "Bobcat.png"},
    {482, "Burrito", 12000, "Burrito.png"},
    {605, "Damaged Sadler", 8000, "Sadlshit.png"},
    {530, "Forklift", 10000, "Forklift.png"},
    {418, "Moonbeam", 12000, "Moonbeam.png"},
    {572, "Mower", 15000, "Mower.png"},
    {582, "News Van", 18000, "Newsvan.png"},
    {413, "Pony", 7000, "Pony.png"},
    {440, "Rumpo", 12000, "Rumpo.png"},
    {543, "Sadler", 10000, "Sadler.png"},
    {583, "Tug", 25000, "Tug.png"},
    {478, "Walton", 15000, "Walton.png"},
    {554, "Yosemite", 20000, "Yosemite.png"}
};

// SUVs & Wagons category
new const SUVS_WAGONS[][E_VEHICLE_SHOP_DATA] = {
    {579, "Huntley", 30000, "Huntley.png"},
    {400, "Landstalker", 25000, "Landstal.png"},
    {404, "Perennial", 12000, "Peren.png"},
    {489, "Rancher", 18000, "Rancher.png"},
    {505, "Rancher Lure", 20000, "Rnchlure.png"},
    {479, "Regina", 13000, "Regina.png"},
    {442, "Romero", 25000, "Romero.png"},
    {458, "Solair", 10000, "Solair.png"}
};

// Lowriders category
new const LOWRIDERS[][E_VEHICLE_SHOP_DATA] = {
    {536, "Blade", 15000, "Blade.png"},
    {575, "Broadway", 20000, "Broadway.png"},
    {534, "Remington", 17000, "Remingtn.png"},
    {567, "Savanna", 22000, "Savanna.png"},
    {535, "Slamvan", 18000, "Slamvan.png"},
    {576, "Tornado", 13000, "Tornado.png"},
    {412, "Voodoo", 16000, "Voodoo.png"}
};

// Muscle cars category
new const MUSCLE_CARS[][E_VEHICLE_SHOP_DATA] = {
    {402, "Buffalo", 20000, "Buffalo.png"},
    {542, "Clover", 22000, "Clover.png"},
    {603, "Phoenix", 30000, "Phoenix.png"},
    {475, "Sabre", 25000, "Sabre.png"}
};

// Street racers category
new const STREET_RACERS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Banshee", 35000, "Banshee.png"},
    {541, "Bullet", 40000, "Bullet.png"},
    {415, "Cheetah", 50000, "Cheetah.png"},
    {480, "Comet", 45000, "Comet.png"},
    {562, "Elegy", 45000, "Elegy.png"},
    {565, "Flash", 40000, "Flash.png"},
    {434, "Hotknife", 35000, "Hotknife.png"},
    {494, "Hotring Racer", 55000, "Hotring.png"},
    {502, "Hotring Racer 2", 60000, "Hotrina.png"},
    {503, "Hotring Racer 3", 65000, "Hotrinb.png"},
    {411, "Infernus", 70000, "411.png"},
    {559, "Jester", 45000, "Jester.png"},
    {561, "Stratum", 35000, "Stratum.png"},
    {560, "Sultan", 50000, "Sultan.png"},
    {506, "Super GT", 60000, "Supergt.png"},
    {451, "Turismo", 65000, "Turismo.png"},
    {558, "Uranus", 50000, "Uranus.png"},
    {555, "Windsor", 60000, "Windsor.png"},
    {477, "ZR-350", 55000, "Zr350.png"}
};

// RC Vehicles category
new const RC_VEHICLES[][E_VEHICLE_SHOP_DATA] = {
    {441, "RC Bandit", 5000, "Rcbandit.png"},
    {464, "RC Baron", 6000, "Rcbaron.png"},
    {594, "RC Cam", 7000, "Rccam.png"},
    {501, "RC Goblin", 8000, "Rcgoblin.png"},
    {465, "RC Raider", 9000, "Rcraider.png"},
    {564, "RC Tiger", 10000, "Rctiger.png"}
};

// Trailers category
new const TRAILERS[][E_VEHICLE_SHOP_DATA] = {
    {606, "Baggage Trailer", 2000, "Bagboxa.png"},
    {607, "Baggage Trailer", 2500, "Bagboxb.png"},
    {610, "Trailer", 3000, "Trailer.png"},
    {611, "Boat Trailer", 3500, "Boattril.png"}
};

// Define the vehicle categories and their data

enum E_VEHICLE_SHOP_DATA {
    VEHICLE_MODELID,
    VEHICLE_NAME[35],
    VEHICLE_PRICE,
    VEHICLE_IMAGE[35]
};

// Sports Cars category
new const SPORTS_CARS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Alpha", 35000, "Alpha-GTASA-front.png"},
    {429, "Banshee", 45000, "Banshee-GTASA-front.png"},
    {429, "Buffalo", 40000, "Buffalo-GTASA-front.png"},
    {429, "Bullet", 50000, "Bullet-GTASA-front.png"},
    {429, "Cheetah", 55000, "Cheetah-GTASA-front.png"},
    {429, "Comet", 40000, "Comet-GTASA-front.png"},
    {429, "Euros", 25000, "Euros-GTASA-front.png"},
    {429, "Hotknife", 35000, "Hotknife-GTASA-front.png"},
    {429, "Infernus", 70000, "Infernus-GTASA-front.png"},
    {429, "Phoenix", 30000, "Phoenix-GTASA-front.png"},
    {429, "Super GT", 60000, "SuperGT-GTASA-front.png"},
    {429, "Turismo", 65000, "Turismo-GTASA-front.png"},
    {429, "Windsor", 55000, "Windsor-GTASA-front.png"},
    {429, "ZR-350", 55000, "ZR350-GTASA-front.png"}
};

// SUVs & Pickup Trucks category
new const SUVs_PICKUP_TRUCKS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Bobcat", 15000, "Bobcat-GTASA-front.png"},
    {429, "Huntley", 30000, "Huntley-GTASA-front.png"},
    {429, "Landstalker", 25000, "Landstalker-GTASA-front.png"},
    {429, "Mesa", 20000, "Mesa-GTASA-front.png"},
    {429, "Monster", 50000, "Monster-GTASA-monster-front.png"},
    {429, "Monster", 50000, "Monster-GTASA-monstera-front.png"},
    {429, "Monster", 50000, "Monster-GTASA-monsterb-front.png"},
    {429, "Patriot", 35000, "Patriot-GTASA-front.png"},
    {429, "Picador", 12000, "Picador-GTASA-front.png"},
    {429, "Rancher", 18000, "Rancher-GTASA-front.png"},
    {429, "Sadler", 10000, "Sadler-GTASA-front.png"},
    {429, "Sandking", 30000, "Sandking-GTASA-front.png"},
    {429, "Sadler (beater)", 8000, "Sadler-GTASA-beater-front.png"},
    {429, "Walton", 15000, "Walton-GTASA-front.png"},
    {429, "Yosemite", 20000, "Yosemite-GTASA-front.png"}
};

// Lowriders category
new const LOWRIDERS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Blade", 15000, "Blade-GTASA-front.png"},
    {429, "Broadway", 20000, "Broadway-GTASA-front.png"},
    {429, "Remington", 17000, "Remington-GTASA-front.png"},
    {429, "Savanna", 22000, "Savanna-GTASA-front.png"},
    {429, "Slamvan", 18000, "Slamvan-GTASA-front.png"},
    {429, "Tahoma", 12000, "Tahoma-GTASA-front.png"},
    {429, "Tornado", 13000, "Tornado-GTASA-front.png"},
    {429, "Voodoo", 16000, "Voodoo-GTASA-front.png"}
};

// Tuners category
new const TUNERS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Elegy", 45000, "Elegy-GTASA-front.png"},
    {429, "Flash", 40000, "Flash-GTASA-front.png"},
    {429, "Jester", 45000, "Jester-GTASA-front.png"},
    {429, "Stratum", 35000, "Stratum-GTASA-front.png"},
    {429, "Sultan", 50000, "Sultan-GTASA-front.png"},
    {429, "Uranus", 50000, "Uranus-GTASA-front.png"}
};

// Coupes & Hatchbacks category
new const COUPES_HATCHBACKS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Blista Compact", 6000, "BlistaCompact-GTASA-front.png"},
    {429, "Bravura", 8000, "Bravura-GTASA-front.png"},
    {429, "Buccaneer", 15000, "Buccaneer-GTASA-front.png"},
    {429, "Cadrona", 10000, "Cadrona-GTASA-front.png"},
    {429, "Clover", 15000, "Clover-GTASA-front.png"},
    {429, "Club", 12000, "Club-GTASA-front.png"},
    {429, "Esperanto", 7000, "Esperanto-GTASA-front.png"},
    {429, "Feltzer", 18000, "Feltzer-GTASA-front.png"},
    {429, "Fortune", 14000, "Fortune-GTASA-front.png"},
    {429, "Hermes", 15000, "Hermes-GTASA-front.png"},
    {429, "Hustler", 13000, "Hustler-GTASA-front.png"},
    {429, "Majestic", 14000, "Majestic-GTASA-front.png"},
    {429, "Manana", 5000, "Manana-GTASA-front.png"},
    {429, "Previon", 8000, "Previon-GTASA-front.png"},
    {429, "Sabre", 25000, "Sabre-GTASA-front.png"},
    {429, "Stallion", 12000, "Stallion-GTASA-front.png"},
    {429, "Tampa", 11000, "Tampa-GTASA-front.png"},
    {429, "Virgo", 9000, "Virgo-GTASA-front.png"}
};

// Sedans & Station Wagons category
new const SEDANS_STATION_WAGONS[][E_VEHICLE_SHOP_DATA] = {
    {429, "Admiral", 15000, "Admiral-GTASA-front.png"},
    {429, "Elegant", 10000, "Elegant-GTASA-front.png"},
    {429, "Emperor", 25000, "Emperor-GTASA-front.png"},
    {429, "Glendale", 12000, "Glendale-GTASA-front.png"},
    {429, "Glendale (beater)", 8000, "Glendale-GTASA-beater-front.png"},
    {429, "Greenwood", 10000, "Greenwood-GTASA-front.png"},
    {429, "Intruder", 15000, "Intruder-GTASA-front.png"},
    {429, "Merit", 11000, "Merit-GTASA-front.png"},
    {429, "Nebula", 12000, "Nebula-GTASA-front.png"},
    {429, "Oceanic", 15000, "Oceanic-GTASA-front.png"},
    {429, "Perennial", 12000, "Perennial-GTASA-front.png"},
    {429, "Premier", 14000, "Premier-GTASA-front.png"},
    {429, "Primo", 8000, "Primo-GTASA-front.png"},
    {429, "Regina", 13000, "Regina-GTASA-front.png"},
    {429, "Romero Hearse", 25000, "Romero-GTASA-front.png"},
    {429, "Sentinel", 20000, "Sentinel-GTASA-front.png"},
    {429, "Solair", 10000, "Solair-GTASA-front.png"},
    {429, "Stafford", 25000, "Stafford-GTASA-front.png"},
    {429, "Stretch", 35000, "Stretch-GTASA-front.png"},
    {429, "Sunrise", 18000, "Sunrise-GTASA-front.png"},
    {429, "Vincent", 20000, "Vincent-GTASA-front.png"},
    {429, "Washington", 22000, "Washington-GTASA-front.png"},
    {429, "Willard", 13000, "Willard-GTASA-front.png"}
};

// Define the vehicle categories and their data

// Airplanes category
new const AIRPLANES[][E_VEHICLE_SHOP_DATA] = {
    {592, "Andromada", 100000, "Androm.png"},
    {577, "AT-400", 80000, "At400.png"},
    {511, "Beagle", 25000, "Beagle.png"},
    {512, "Cropduster", 15000, "Cropdust.png"},
    {593, "Dodo", 20000, "Dodo.png"},
    {520, "Hydra", 50000, "Hydra.png"},
    {553, "Nevada", 75000, "Nevada.png"},
    {476, "Rustler", 30000, "Rustler.png"},
    {519, "Shamal", 90000, "Shamal.png"},
    {460, "Skimmer", 35000, "Skimmer.png"},
    {513, "Stuntplane", 40000, "Stunt.png"}
};

// Helicopters category
new const HELICOPTERS[][E_VEHICLE_SHOP_DATA] = {
    {548, "Cargobob", 100000, "Cargobob.png"},
    {425, "Hunter", 60000, "Hunter.png"},
    {417, "Leviathan", 75000, "Leviathn.png"},
    {487, "Maverick", 25000, "Maverick.png"},
    {488, "News Chopper", 30000, "Newschop.png"},
    {497, "Police Maverick", 35000, "Polmav.png"},
    {563, "Raindance", 50000, "Raindanc.png"},
    {447, "Seasparrow", 60000, "Seaspar.png"},
    {469, "Sparrow", 40000, "Sparrow.png"}
};

// Boats category
new const BOATS[][E_VEHICLE_SHOP_DATA] = {
    {472, "Coastguard", 35000, "Coastg.png"},
    {473, "Dinghy", 12000, "Dinghy.png"},
    {493, "Jetmax", 25000, "Jetmax.png"},
    {595, "Launch", 20000, "Launch.png"},
    {484, "Marquis", 40000, "Marquis.png"},
    {430, "Predator", 30000, "Predator.png"},
    {453, "Reefer", 22000, "Reefer.png"},
    {452, "Speeder", 18000, "Speeder.png"},
    {446, "Squalo", 25000, "Squalo.png"},
    {454, "Tropic", 20000, "Tropic.png"}
};

const COMPACT_CARS[][E_VEHICLE_SHOP_DATA] = {
    {400, "Landstalker", 10000},
    {401, "Bravura", 15000},
    {402, "Buffalo", 20000}
};
CMD:vehicles(playerid) {
    new subString[128];
    static string[sizeof(COMPACT_CARS) * sizeof(subString)];
    
    if (string[0] == EOS) {
        for (new i; i < sizeof(COMPACT_CARS); i++) {
            format(subString, sizeof(subString), "%i(0.0, 0.0, -50.0, 1.0)\t%s~n~~g~~h~$%i\n", COMPACT_CARS[i][VEHICLE_MODELID], COMPACT_CARS[i][VEHICLE_NAME], COMPACT_CARS[i][VEHICLE_PRICE]);
            strcat(string, subString);
        }
    }
    return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PREVIEW_MODEL, "Vehicle Shop Dialog", string, "Purchase", "Cancel");
}

CMD:vehicles(playerid) {
    new subString[128];
    static string[sizeof(HELICOPTERS) * sizeof(subString) + sizeof(BOATS) * sizeof(subString)];
    
    if (string[0] == EOS) {
        // Helicopters
        for (new i; i < sizeof(HELICOPTERS); i++) {
            format(subString, sizeof(subString), "%i(0.0, 0.0, -50.0, 1.0)\t%s~n~~g~~h~$%i\n", HELICOPTERS[i][VEHICLE_MODELID], HELICOPTERS[i][VEHICLE_NAME], HELICOPTERS[i][VEHICLE_PRICE]);
            strcat(string, subString);
        }

        // Boats
        for (new i; i < sizeof(BOATS); i++) {
            format(subString, sizeof(subString), "%i(0.0, 0.0, -50.0, 1.0)\t%s~n~~g~~h~$%i\n", BOATS[i][VEHICLE_MODELID], BOATS[i][VEHICLE_NAME], BOATS[i][VEHICLE_PRICE]);
            strcat(string, subString);
        }
    }
    return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PREVIEW_MODEL, "Vehicle Shop Dialog", string, "Purchase", "Cancel");
}


Vehicle lists:
Land vehicles
Bikes
Name	ID	Image
BF-400	581	Bf400.png
Bike	509	Bike.png
BMX	481	Bmx.png
Faggio	462	Faggio.png
FCR-900	521	Fcr900.png
Freeway	463	Freeway.png
Mountain Bike	510	Mtbike.png
NRG-500	522	Nrg500.png
PCJ-600	461	Pcj600.png
Pizzaboy	448	Pizzaboy.png
Sanchez	468	Sanchez.png
Wayfarer	586	Wayfarer.png
2-Door & Compact cars
Name	ID	Image
Alpha	602	Alpha.png
Blista Compact	496	Blistac.png
Bravura	401	Bravura.png
Buccaneer	518	Buccanee.png
Cadrona	527	Cadrona.png
Club	589	Club.png
Esperanto	419	Esperant.png
Euros	587	Euros.png
Feltzer	533	Feltzer.png
Fortune	526	Fortune.png
Hermes	474	Hermes.png
Hustler	545	Hustler.png
Majestic	517	Majestic.png
Manana	410	Manana.png
Picador	600	Picador.png
Previon	436	Previon.png
Stallion	439	Stallion.png
Tampa	549	Tampa.png
Virgo	491	Virgo.png
4-Door & Luxury cars
Name	ID	Image
Admiral	445	Admiral.png
Damaged Glendale	604	Glenshit.png
Elegant	507	Elegant.png
Emperor	585	Emperor.png
Glendale	466	Glendale.png
Greenwood	492	Greenwoo.png
Intruder	546	Intruder.png
Merit	551	Merit.png
Nebula	516	Nebula.png
Oceanic	467	Oceanic.png
Premier	426	Premier.png
Primo	547	Primo.png
Sentinel	405	Sentinel.png
Stafford	580	Stafford.png
Stretch	409	Stretch.png
Sunrise	550	Sunrise.png
Tahoma	566	Tahoma.png
Vincent	540	Vincent.png
Washington	421	Washing.png
Willard	529	Willard.png
Civil service
Name	ID	Image
Baggage	485	Baggage.png
Bus	431	Bus.png
Cabbie	438	Cabbie.png
Coach	437	Coach.png
Sweeper	574	Sweeper.png
Taxi	420	Taxi.png
Towtruck	525	Towtruck.png
Trashmaster	408	Trash.png
Utility Van	552	Utility.png
Government vehicles
Name	ID	Image
Ambulance	416	Ambulan.png
Barracks	433	Barracks.png
Enforcer	427	Enforcer.png
FBI Rancher	490	Fbiranch.png
FBI Truck	528	Fbitruck.png
Fire Truck	407	Firetruk.png
Fire Truck	544	Firela.png
HPV1000	523	Hpv1000.png
Patriot	470	Patriot.png
Police LS	596	Policels.png
Police LV	598	Policelv.png
Police Ranger	599	Policeru.png
Police SF	597	Policesf.png
Rhino	432	Rhino.png
S.W.A.T.	601	Swatvan.png
Securicar	428	Securica.png
Heavy & Utility trucks
Name	ID	Image
Benson	499	Benson.png
Boxville Mission	609	Boxburg.png
Boxville	498	Boxville.png
Cement Truck	524	Cement.png
Combine Harvester	532	Combine.png
DFT-30	578	Dft30.png
Dozer	486	Dozer.png
Dumper	406	Dumper.png
Dune	573	Dune.png
Flatbed	455	Flatbed.png
Hotdog	588	Hotdog.png
Linerunner	403	Linerun.png
Mr. Whoopee	423	Mrwhoop.png
Mule	414	Mule.png
Packer	443	Packer.png
Roadtrain	515	Rdtrain.png
Tanker	514	Tanker.png
Tractor	531	Tractor.png
Yankee	456	Yankee.png
Light trucks & Vans
Name	ID	Image
Berkley's RC Van	459	Topfun.png
Bobcat	422	Bobcat.png
Burrito	482	Burrito.png
Damaged Sadler	605	Sadlshit.png
Forklift	530	Forklift.png
Moonbeam	418	Moonbeam.png
Mower	572	Mower.png
News Van	582	Newsvan.png
Pony	413	Pony.png
Rumpo	440	Rumpo.png
Sadler	543	Sadler.png
Tug	583	Tug.png
Walton	478	Walton.png
Yosemite	554	Yosemite.png
SUVs & Wagons
Name	ID	Image
Huntley	579	Huntley.png
Landstalker	400	Landstal.png
Perennial	404	Peren.png
Rancher	489	Rancher.png
Rancher Lure	505	Rnchlure.png
Regina	479	Regina.png
Romero	442	Romero.png
Solair	458	Solair.png
Lowriders
Name	ID	Image
Blade	536	Blade.png
Broadway	575	Broadway.png
Remington	534	Remingtn.png
Savanna	567	Savanna.png
Slamvan	535	Slamvan.png
Tornado	576	Tornado.png
Voodoo	412	Voodoo.png
Muscle cars
Name	ID	Image
Buffalo	402	Buffalo.png
Clover	542	Clover.png
Phoenix	603	Phoenix.png
Sabre	475	Sabre.png
Street racers
Name	ID	Image
Banshee	429	Banshee.png
Bullet	541	Bullet.png
Cheetah	415	Cheetah.png
Comet	480	Comet.png
Elegy	562	Elegy.png
Flash	565	Flash.png
Hotknife	434	Hotknife.png
Hotring Racer	494	Hotring.png
Hotring Racer 2	502	Hotrina.png
Hotring Racer 3	503	Hotrinb.png
Infernus	411	411.png
Jester	559	Jester.png
Stratum	561	Stratum.png
Sultan	560	Sultan.png
Super GT	506	Supergt.png
Turismo	451	Turismo.png
Uranus	558	Uranus.png
Windsor	555	Windsor.png
ZR-350	477	Zr350.png
RC Vehicles
Name	ID	Image
RC Bandit	441	Rcbandit.png
RC Baron	464	Rcbaron.png
RC Cam	594	Rccam.png
RC Goblin	501	Rcgoblin.png
RC Raider	465	Rcraider.png
RC Tiger	564	Rctiger.png
Trailers
Name	ID	Image
Baggage Trailer	606	Bagboxa.png
Baggage Trailer	607	Bagboxb.png
Farm Trailer	610	Farmtr1.png
Petrol trailer	584	Petrotr.png
Trailer	611	Utiltr1.png
Trailer	608	Tugstair.png
Trailer 1	435	Artict1.png
Trailer 2	450	Artict2.png
Trailer 3	591	Artict3.png
Trains & Railroad cars
Name	ID	Image
Box Freight	590	Freibox.png
Brown Streak	538	Streak.png
Brown Streak Carriage	570	Streakc.png
Flat Freight	569	Freiflat.png
Freight	537	Freight.png
Tram	449	Tram.png
Recreational
Name	ID	Image
Bandito	568	Bandito.png
BF Injection	424	Bfinject.png
Bloodring Banger	504	Bloodra.png
Caddy	457	Caddy.png
Camper	483	Camper.png
Jou
rney	508	Journey.png
Kart	571	Kart.png
Mesa	500	Mesa.png
Monster	444	Monster.png
Monster 2	556	Monstera.png
Monster 3	557	Monsterb.png
Quadbike	471	Quad.png
Sandking	495	Sandking.png
Vortex	539	Vortex.png

Land Vehicles
Sports Cars
Alpha-GTASA-front
Alpha

Banshee-GTASA-front
Banshee

Buffalo-GTASA-front
Buffalo

Bullet-GTASA-front
Bullet

Cheetah-GTASA-front
Cheetah

Comet-GTASA-front
Comet

Euros-GTASA-front
Euros

Hotknife-GTASA-front
Hotknife

Infernus-GTASA-front
Infernus

Phoenix-GTASA-front
Phoenix

SuperGT-GTASA-front
Super GT

Turismo-GTASA-front
Turismo

Windsor-GTASA-front
Windsor

ZR350-GTASA-front
ZR-350

SUVs & Pickup Trucks
Bobcat-GTASA-front
Bobcat

Huntley-GTASA-front
Huntley

Landstalker-GTASA-front
Landstalker

Mesa-GTASA-front
Mesa

Monster-GTASA-monster-front
Monster

Monster-GTASA-monstera-front
Monster

Monster-GTASA-monsterb-front
Monster

Patriot-GTASA-front
Patriot

Picador-GTASA-front
Picador

Rancher-GTASA-front
Rancher

Sadler-GTASA-front
Sadler

Sandking-GTASA-front
Sandking

Sadler-GTASA-beater-front
Sadler (beater)

Walton-GTASA-front
Walton

Yosemite-GTASA-front
Yosemite

Lowriders
Blade-GTASA-front
Blade

Broadway-GTASA-front
Broadway

Remington-GTASA-front
Remington

Savanna-GTASA-front
Savanna

Slamvan-GTASA-front
Slamvan

Tahoma-GTASA-front
Tahoma

Tornado-GTASA-front
Tornado

Voodoo-GTASA-front
Voodoo

Tuners
Elegy-GTASA-front
Elegy

Flash-GTASA-front
Flash

Jester-GTASA-front
Jester

Stratum-GTASA-front
Stratum

Sultan-GTASA-front
Sultan

Uranus-GTASA-front
Uranus

Coupes & Hatchbacks
BlistaCompact-GTASA-front
Blista Compact

Bravura-GTASA-front
Bravura

Buccaneer-GTASA-front
Buccaneer

Cadrona-GTASA-front
Cadrona

Clover-GTASA-front
Clover

Club-GTASA-front
Club

Esperanto-GTASA-front
Esperanto

Feltzer-GTASA-front
Feltzer

Fortune-GTASA-front
Fortune

Hermes-GTASA-front
Hermes

Hustler-GTASA-front
Hustler

Majestic-GTASA-front
Majestic

Manana-GTASA-front
Manana

Previon-GTASA-front
Previon

Sabre-GTASA-front
Sabre

Stallion-GTASA-front
Stallion

Tampa-GTASA-front
Tampa

Virgo-GTASA-front
Virgo

Sedans & Station Wagons
Admiral-GTASA-front
Admiral

Elegant-GTASA-front
Elegant

Emperor-GTASA-front
Emperor

Glendale-GTASA-front
Glendale

Glendale-GTASA-beater-front
Glendale (beater)

Greenwood-GTASA-front
Greenwood

Intruder-GTASA-front
Intruder

Merit-GTASA-front
Merit

Nebula-GTASA-front
Nebula

Oceanic-GTASA-front
Oceanic

Perennial-GTASA-front
Perennial

Premier-GTASA-front
Premier

Primo-GTASA-front
Primo

Regina-GTASA-front
Regina

Romero-GTASA-front
Romero Hearse

Sentinel-GTASA-front
Sentinel

Solair-GTASA-front
Solair

Stafford-GTASA-front
Stafford

Stretch-GTASA-front
Stretch

Sunrise-GTASA-front
Sunrise

Vincent-GTASA-front
Vincent

Washington-GTASA-front
Washington

Willard-GTASA-front
Willard