#include <open.mp>
#include <mselection>
#include <eselection>
#include <easyDialog>
#include <izcmd>

#define CAR_SHOP_MENU 100 // Unique ID for the car shop dialog

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
