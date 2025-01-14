#include <open.mp>
#include <mselection>
#include <eselection>
#include <easyDialog>
#include <izcmd>

#define CAR_SHOP_MENU 100 // Unique ID for the car shop dialog

#define NUM_BIKES 12
#define NUM_2DOOR_COMPACT_CARS 19
#define NUM_4DOOR_LUXURY_CARS 21
#define NUM_CIVIL_SERVICE_VEHICLES 10
#define NUM_GOVERNMENT_VEHICLES 14
#define NUM_HEAVY_UTILITY_TRUCKS 20
#define NUM_LIGHT_TRUCKS_VANS 14
#define NUM_SUVS_WAGONS 8
#define NUM_LOWRIDERS 7
#define NUM_MUSCLE_CARS 4
#define NUM_STREET_RACERS 18
#define NUM_RC_VEHICLES 6
#define NUM_TRAILERS 9
#define NUM_TRAINS 6
#define NUM_RECREATIONAL 14

// Vehicle offsets for each category (example structure)
Float:gVehicleOffsets[NUM_RECREATIONAL][3] = {
    {0.0699, 0.0600, -11.7500}, // Example offset
    {0.1000, 0.0700, -11.7500}, // Another example
    {0.1500, 0.0800, -11.7500},
    // Add more offsets as needed for each vehicle
};

// Bike vehicles
new BikeVehicles[NUM_BIKES][3] = {
    {581, "BF-400", "Bf400.png"},
    {509, "Bike", "Bike.png"},
    {481, "BMX", "Bmx.png"},
    {462, "Faggio", "Faggio.png"},
    {521, "FCR-900", "Fcr900.png"},
    {463, "Freeway", "Freeway.png"},
    {510, "Mountain Bike", "Mtbike.png"},
    {522, "NRG-500", "Nrg500.png"},
    {461, "PCJ-600", "Pcj600.png"},
    {448, "Pizzaboy", "Pizzaboy.png"},
    {468, "Sanchez", "Sanchez.png"},
    {586, "Wayfarer", "Wayfarer.png"}
};

// 2-Door & Compact cars
new TwoDoorCompactCars[NUM_2DOOR_COMPACT_CARS][3] = {
    {602, "Alpha", "Alpha.png"},
    {496, "Blista Compact", "Blistac.png"},
    {401, "Bravura", "Bravura.png"},
    {518, "Buccaneer", "Buccanee.png"},
    {527, "Cadrona", "Cadrona.png"},
    {589, "Club", "Club.png"},
    {419, "Esperanto", "Esperant.png"},
    {587, "Euros", "Euros.png"},
    {533, "Feltzer", "Feltzer.png"},
    {526, "Fortune", "Fortune.png"},
    {474, "Hermes", "Hermes.png"},
    {545, "Hustler", "Hustler.png"},
    {517, "Majestic", "Majestic.png"},
    {410, "Manana", "Manana.png"},
    {600, "Picador", "Picador.png"},
    {436, "Previon", "Previon.png"},
    {439, "Stallion", "Stallion.png"},
    {549, "Tampa", "Tampa.png"},
    {491, "Virgo", "Virgo.png"}
};

// 4-Door & Luxury cars
new FourDoorLuxuryCars[NUM_4DOOR_LUXURY_CARS][3] = {
    {445, "Admiral", "Admiral.png"},
    {604, "Damaged Glendale", "Glenshit.png"},
    {507, "Elegant", "Elegant.png"},
    {585, "Emperor", "Emperor.png"},
    {466, "Glendale", "Glendale.png"},
    {492, "Greenwood", "Greenwoo.png"},
    {546, "Intruder", "Intruder.png"},
    {551, "Merit", "Merit.png"},
    {516, "Nebula", "Nebula.png"},
    {467, "Oceanic", "Oceanic.png"},
    {426, "Premier", "Premier.png"},
    {547, "Primo", "Primo.png"},
    {405, "Sentinel", "Sentinel.png"},
    {580, "Stafford", "Stafford.png"},
    {409, "Stretch", "Stretch.png"},
    {550, "Sunrise", "Sunrise.png"},
    {566, "Tahoma", "Tahoma.png"},
    {540, "Vincent", "Vincent.png"},
    {421, "Washington", "Washing.png"},
    {529, "Willard", "Willard.png"}
};

// Civil service vehicles
new CivilServiceVehicles[NUM_CIVIL_SERVICE_VEHICLES][3] = {
    {485, "Baggage", "Baggage.png"},
    {431, "Bus", "Bus.png"},
    {438, "Cabbie", "Cabbie.png"},
    {437, "Coach", "Coach.png"},
    {574, "Sweeper", "Sweeper.png"},
    {420, "Taxi", "Taxi.png"},
    {525, "Towtruck", "Towtruck.png"},
    {408, "Trashmaster", "Trash.png"},
    {552, "Utility Van", "Utility.png"}
};

// Government vehicles
new GovernmentVehicles[NUM_GOVERNMENT_VEHICLES][3] = {
    {416, "Ambulance", "Ambulan.png"},
    {433, "Barracks", "Barracks.png"},
    {427, "Enforcer", "Enforcer.png"},
    {490, "FBI Rancher", "Fbiranch.png"},
    {528, "FBI Truck", "Fbitruck.png"},
    {407, "Fire Truck", "Firetruk.png"},
    {544, "Fire Truck", "Firela.png"},
    {523, "HPV1000", "Hpv1000.png"},
    {470, "Patriot", "Patriot.png"},
    {596, "Police LS", "Policels.png"},
    {598, "Police LV", "Policelv.png"},
    {599, "Police Ranger", "Policeru.png"},
    {597, "Police SF", "Policesf.png"},
    {432, "Rhino", "Rhino.png"},
    {601, "S.W.A.T.", "Swatvan.png"},
    {428, "Securicar", "Securica.png"}
};

// Heavy & Utility trucks
new HeavyUtilityTrucks[NUM_HEAVY_UTILITY_TRUCKS][3] = {
    {499, "Benson", "Benson.png"},
    {609, "Boxville Mission", "Boxburg.png"},
    {498, "Boxville", "Boxville.png"},
    {524, "Cement Truck", "Cement.png"},
    {532, "Combine Harvester", "Combine.png"},
    {578, "DFT-30", "Dft30.png"},
    {486, "Dozer", "Dozer.png"},
    {406, "Dumper", "Dumper.png"},
    {573, "Dune", "Dune.png"},
    {455, "Flatbed", "Flatbed.png"},
    {588, "Hotdog", "Hotdog.png"},
    {403, "Linerunner", "Linerun.png"},
    {423, "Mr. Whoopee", "Mrwhoop.png"},
    {414, "Mule", "Mule.png"},
    {443, "Packer", "Packer.png"},
    {515, "Roadtrain", "Rdtrain.png"},
    {514, "Tanker", "Tanker.png"},
    {531, "Tractor", "Tractor.png"},
    {456, "Yankee", "Yankee.png"}
};

// You can continue similarly for other categories...

// Show the car shop categories
ShowCarShopMenu(playerid)
{
    // Define the categories for the car shop
    new categories[] = {
        "Bikes",
        "2-Door & Compact cars",
        "4-Door & Luxury cars",
        "Lowriders",
        "Muscle cars",
        "Street racers",
        "Recreational"
    };

    // Create a list for the menu
    new List:carShopList = list_new();

    // Add each category to the menu
    for (new i = 0; i < sizeof(categories) / sizeof(categories[0]); i++)
    {
        AddDialogMenuItem(carShopList, categories[i]);
    }

    // Show the dialog to the player with the car categories
    ShowDialog(playerid, CAR_SHOP_MENU, "Select a category", carShopList);
}

// Handle the response from the car shop dialog
public OnDialogResponse(playerid, dialogid, response, selected)
{
    // Check if the player interacted with the car shop dialog
    if (dialogid == CAR_SHOP_MENU)
    {
        if (response == 1) // Player selected a category
        {
            switch (selected)
            {
                case 0:
                    // Player selected "Bikes"
                    ShowBikesMenu(playerid);
                    break;
                case 1:
                    // Player selected "2-Door & Compact cars"
                    Show2DoorCompactCarsMenu(playerid);
                    break;
                case 2:
                    // Player selected "4-Door & Luxury cars"
                    Show4DoorLuxuryCarsMenu(playerid);
                    break;
                case 3:
                    // Player selected "Lowriders"
                    ShowLowridersMenu(playerid);
                    break;
                case 4:
                    // Player selected "Muscle cars"
                    ShowMuscleCarsMenu(playerid);
                    break;
                case 5:
                    // Player selected "Street racers"
                    ShowStreetRacersMenu(playerid);
                    break;
                case 6:
                    // Player selected "Recreational"
                    ShowRecreationalCarsMenu(playerid);
                    break;
            }
        }
    }
}

// Command to trigger the car shop menu
AddCommand("/carshop", playerid)
{
    ShowCarShopMenu(playerid);
}

// Bikes Menu
ShowBikesMenu(playerid)
{
    new List:bikes = list_new();
    AddModelMenuItemWithImage(bikes, 581, "BF-400", "Bf400.png");
    AddModelMenuItemWithImage(bikes, 509, "Bike", "Bike.png");
    AddModelMenuItemWithImage(bikes, 481, "BMX", "Bmx.png");
    AddModelMenuItemWithImage(bikes, 462, "Faggio", "Faggio.png");
    AddModelMenuItemWithImage(bikes, 521, "FCR-900", "Fcr900.png");
    AddModelMenuItemWithImage(bikes, 463, "Freeway", "Freeway.png");
    AddModelMenuItemWithImage(bikes, 510, "Mountain Bike", "Mtbike.png");
    AddModelMenuItemWithImage(bikes, 522, "NRG-500", "Nrg500.png");
    AddModelMenuItemWithImage(bikes, 461, "PCJ-600", "Pcj600.png");
    AddModelMenuItemWithImage(bikes, 448, "Pizzaboy", "Pizzaboy.png");
    AddModelMenuItemWithImage(bikes, 468, "Sanchez", "Sanchez.png");
    AddModelMenuItemWithImage(bikes, 586, "Wayfarer", "Wayfarer.png");
    
    ShowModelSelectionMenu(playerid, "Bikes", bikes);
}

// 2-Door & Compact Cars Menu
Show2DoorCompactCarsMenu(playerid)
{
    new List:compactCars = list_new();
    AddModelMenuItemWithImage(compactCars, 602, "Alpha", "Alpha.png");
    AddModelMenuItemWithImage(compactCars, 496, "Blista Compact", "Blistac.png");
    AddModelMenuItemWithImage(compactCars, 401, "Bravura", "Bravura.png");
    AddModelMenuItemWithImage(compactCars, 518, "Buccaneer", "Buccanee.png");
    AddModelMenuItemWithImage(compactCars, 527, "Cadrona", "Cadrona.png");
    AddModelMenuItemWithImage(compactCars, 589, "Club", "Club.png");
    AddModelMenuItemWithImage(compactCars, 419, "Esperanto", "Esperant.png");
    AddModelMenuItemWithImage(compactCars, 587, "Euros", "Euros.png");
    AddModelMenuItemWithImage(compactCars, 533, "Feltzer", "Feltzer.png");
    AddModelMenuItemWithImage(compactCars, 526, "Fortune", "Fortune.png");
    AddModelMenuItemWithImage(compactCars, 474, "Hermes", "Hermes.png");
    AddModelMenuItemWithImage(compactCars, 545, "Hustler", "Hustler.png");
    AddModelMenuItemWithImage(compactCars, 517, "Majestic", "Majestic.png");
    AddModelMenuItemWithImage(compactCars, 410, "Manana", "Manana.png");
    AddModelMenuItemWithImage(compactCars, 600, "Picador", "Picador.png");
    AddModelMenuItemWithImage(compactCars, 436, "Previon", "Previon.png");
    AddModelMenuItemWithImage(compactCars, 439, "Stallion", "Stallion.png");
    AddModelMenuItemWithImage(compactCars, 549, "Tampa", "Tampa.png");
    AddModelMenuItemWithImage(compactCars, 491, "Virgo", "Virgo.png");
    
    ShowModelSelectionMenu(playerid, "2-Door & Compact Cars", compactCars);
}

// 4-Door & Luxury Cars Menu
Show4DoorLuxuryCarsMenu(playerid)
{
    new List:luxuryCars = list_new();
    AddModelMenuItemWithImage(luxuryCars, 445, "Admiral", "Admiral.png");
    AddModelMenuItemWithImage(luxuryCars, 604, "Damaged Glendale", "Glenshit.png");
    AddModelMenuItemWithImage(luxuryCars, 507, "Elegant", "Elegant.png");
    AddModelMenuItemWithImage(luxuryCars, 585, "Emperor", "Emperor.png");
    AddModelMenuItemWithImage(luxuryCars, 466, "Glendale", "Glendale.png");
    AddModelMenuItemWithImage(luxuryCars, 492, "Greenwood", "Greenwoo.png");
    AddModelMenuItemWithImage(luxuryCars, 546, "Intruder", "Intruder.png");
    AddModelMenuItemWithImage(luxuryCars, 551, "Merit", "Merit.png");
    AddModelMenuItemWithImage(luxuryCars, 516, "Nebula", "Nebula.png");
    AddModelMenuItemWithImage(luxuryCars, 467, "Oceanic", "Oceanic.png");
    AddModelMenuItemWithImage(luxuryCars, 426, "Premier", "Premier.png");
    AddModelMenuItemWithImage(luxuryCars, 547, "Primo", "Primo.png");
    AddModelMenuItemWithImage(luxuryCars, 405, "Sentinel", "Sentinel.png");
    AddModelMenuItemWithImage(luxuryCars, 580, "Stafford", "Stafford.png");
    AddModelMenuItemWithImage(luxuryCars, 409, "Stretch", "Stretch.png");
    AddModelMenuItemWithImage(luxuryCars, 550, "Sunrise", "Sunrise.png");
    AddModelMenuItemWithImage(luxuryCars, 566, "Tahoma", "Tahoma.png");
    AddModelMenuItemWithImage(luxuryCars, 540, "Vincent", "Vincent.png");
    AddModelMenuItemWithImage(luxuryCars, 421, "Washington", "Washing.png");
    AddModelMenuItemWithImage(luxuryCars, 529, "Willard", "Willard.png");
    
    ShowModelSelectionMenu(playerid, "4-Door & Luxury Cars", luxuryCars);
}

// You can continue similarly for other categories (Lowriders, Muscle cars, Street racers, Recreational)...
