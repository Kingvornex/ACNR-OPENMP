
#include <open.mp>
#include <izcmd>
#include <easyDialog>

// Define the vehicle categories with their respective arrays
new const VEHICLE_CATEGORIES[][2][] = {
    {"2-Door & Compact cars", 	"19 Cars"},
    {"4-Door & Luxury cars", 	"20 Cars"},
    {"SUVs & Wagons", 			"8  Cars"},
    {"Lowriders", 				"8  Cars"},
    {"Muscle cars", 			"4  Cars"},
    {"Street racers", 			"19 Cars"},
    {"Recreational", 			"14 Cars"},
    {"Sports Cars", 			"14 Cars"},
    {"SUVs & Pickup Trucks", 	"15 Cars"},
    {"Tuners", 					"6  Cars"},
    {"Coupes & Hatchbacks", 	"18 Cars"},
    {"Sedans & Station Wagons", "23 Cars"},
	{"Bikes",					"12 Bikes"}
};

// Define vehicle shop data
enum E_VEHICLE_SHOP_DATA {
    VEHICLE_MODELID,
    VEHICLE_NAME[35],
    VEHICLE_PRICE,
    VEHICLE_Pic[35]
};

// 2-Door & Compact cars category
new const COMPACT_CARS[][E_VEHICLE_SHOP_DATA] = {
    {602, "Alpha", 			12000, "Alpha.png"},
    {496, "Blista Compact", 6000, "Blistac.png"},
    {401, "Bravura", 		8000, "Bravura.png"},
    {518, "Buccaneer", 		15000, "Buccanee.png"},
    {527, "Cadrona", 		10000, "Cadrona.png"},
    {589, "Club", 			12000, "Club.png"},
    {419, "Esperanto", 		7000, "Esperant.png"},
    {587, "Euros", 			16000, "Euros.png"},
    {533, "Feltzer", 		18000, "Feltzer.png"},
    {526, "Fortune", 		14000, "Fortune.png"},
    {474, "Hermes", 		15000, "Hermes.png"},
    {545, "Hustler", 		13000, "Hustler.png"},
    {517, "Majestic", 		14000, "Majestic.png"},
    {410, "Manana", 		5000, "Manana.png"},
    {600, "Picador", 		7000, "Picador.png"},
    {436, "Previon", 		8000, "Previon.png"},
    {439, "Stallion", 		12000, "Stallion.png"},
    {549, "Tampa", 			11000, "Tampa.png"},
    {491, "Virgo", 			9000, "Virgo.png"}
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
    {412, "Voodoo", 16000, "Voodoo.png"},
    {566, "Tahoma", 12000, "Tahoma-GTASA-front.png"}
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

// Recreational category
new const Recreational[][E_VEHICLE_SHOP_DATA] = {
    {568, "Bandito", 15000, 1},
    {424, "BF Injection", 20000, 2},
    {504, "Bloodring Banger", 25000, 3},
    {457, "Caddy", 10000, 4},
    {483, "Camper", 30000, 5},
    {508, "Journey", 35000, 6},
    {571, "Kart", 5000, 7},
    {500, "Mesa", 18000, 8},
    {444, "Monster", 40000, 9},
    {556, "Monster 2", 45000, 10},
    {557, "Monster 3", 50000, 11},
    {471, "Quadbike", 12000, 12},
    {495, "Sandking", 28000, 13},
    {539, "Vortex", 22000, 14}
};

// Sports Cars category
new const SPORTS_CARS[][E_VEHICLE_SHOP_DATA] = {
    {602, "Alpha", 35000, "Alpha-GTASA-front.png"},
    {429, "Banshee", 45000, "Banshee-GTASA-front.png"},
    {402, "Buffalo", 40000, "Buffalo-GTASA-front.png"},
    {541, "Bullet", 50000, "Bullet-GTASA-front.png"},
    {415, "Cheetah", 55000, "Cheetah-GTASA-front.png"},
    {480, "Comet", 40000, "Comet-GTASA-front.png"},
    {587, "Euros", 25000, "Euros-GTASA-front.png"},
    {434, "Hotknife", 35000, "Hotknife-GTASA-front.png"},
    {411, "Infernus", 70000, "Infernus-GTASA-front.png"},
    {603, "Phoenix", 30000, "Phoenix-GTASA-front.png"},
    {506, "Super GT", 60000, "SuperGT-GTASA-front.png"},
    {451, "Turismo", 65000, "Turismo-GTASA-front.png"},
    {555, "Windsor", 55000, "Windsor-GTASA-front.png"},
    {477, "ZR-350", 55000, "ZR350-GTASA-front.png"}
};

// SUVs & Pickup Trucks category
new const SUVs_PICKUP_TRUCKS[][E_VEHICLE_SHOP_DATA] = {
    {422, "Bobcat", 15000, "Bobcat-GTASA-front.png"},
    {579, "Huntley", 30000, "Huntley-GTASA-front.png"},
    {400, "Landstalker", 25000, "Landstalker-GTASA-front.png"},
    {500, "Mesa", 20000, "Mesa-GTASA-front.png"},
    {444, "Monster", 50000, "Monster-GTASA-monster-front.png"},
    {556, "Monster A", 50000, "Monster-GTASA-monstera-front.png"},
    {557, "Monster B", 50000, "Monster-GTASA-monsterb-front.png"},
    {470, "Patriot", 35000, "Patriot-GTASA-front.png"},
    {600, "Picador", 12000, "Picador-GTASA-front.png"},
    {489, "Rancher", 18000, "Rancher-GTASA-front.png"},
    {543, "Sadler", 10000, "Sadler-GTASA-front.png"},
    {495, "Sandking", 30000, "Sandking-GTASA-front.png"},
    {605, "Sadler (beater)", 8000, "Sadler-GTASA-beater-front.png"},
    {478, "Walton", 15000, "Walton-GTASA-front.png"},
    {554, "Yosemite", 20000, "Yosemite-GTASA-front.png"}
};

// Tuners category
new const TUNERS[][E_VEHICLE_SHOP_DATA] = {
    {562, "Elegy", 45000, "Elegy-GTASA-front.png"},
    {565, "Flash", 40000, "Flash-GTASA-front.png"},
    {559, "Jester", 45000, "Jester-GTASA-front.png"},
    {561, "Stratum", 35000, "Stratum-GTASA-front.png"},
    {560, "Sultan", 50000, "Sultan-GTASA-front.png"},
    {558, "Uranus", 50000, "Uranus-GTASA-front.png"}
};

// Coupes & Hatchbacks category
new const COUPES_HATCHBACKS[][E_VEHICLE_SHOP_DATA] = {
    {496, "Blista Compact", 6000, "BlistaCompact-GTASA-front.png"},
    {401, "Bravura", 8000, "Bravura-GTASA-front.png"},
    {518, "Buccaneer", 15000, "Buccaneer-GTASA-front.png"},
    {527, "Cadrona", 10000, "Cadrona-GTASA-front.png"},
    {542, "Clover", 15000, "Clover-GTASA-front.png"},
    {589, "Club", 12000, "Club-GTASA-front.png"},
    {419, "Esperanto", 7000, "Esperanto-GTASA-front.png"},
    {533, "Feltzer", 18000, "Feltzer-GTASA-front.png"},
    {526, "Fortune", 14000, "Fortune-GTASA-front.png"},
    {474, "Hermes", 15000, "Hermes-GTASA-front.png"},
    {545, "Hustler", 13000, "Hustler-GTASA-front.png"},
    {517, "Majestic", 14000, "Majestic-GTASA-front.png"},
    {410, "Manana", 5000, "Manana-GTASA-front.png"},
    {436, "Previon", 8000, "Previon-GTASA-front.png"},
    {475, "Sabre", 25000, "Sabre-GTASA-front.png"},
    {439, "Stallion", 12000, "Stallion-GTASA-front.png"},
    {549, "Tampa", 11000, "Tampa-GTASA-front.png"},
    {491, "Virgo", 9000, "Virgo-GTASA-front.png"}
};

// Sedans & Station Wagons category
new const SEDANS_STATION_WAGONS[][E_VEHICLE_SHOP_DATA] = {
    {445, "Admiral", 15000, "Admiral-GTASA-front.png"},
    {507, "Elegant", 10000, "Elegant-GTASA-front.png"},
    {585, "Emperor", 25000, "Emperor-GTASA-front.png"},
    {466, "Glendale", 12000, "Glendale-GTASA-front.png"},
    {604, "Glendale (beater)", 8000, "Glendale-GTASA-beater-front.png"},
    {492, "Greenwood", 10000, "Greenwood-GTASA-front.png"},
    {546, "Intruder", 15000, "Intruder-GTASA-front.png"},
    {551, "Merit", 11000, "Merit-GTASA-front.png"},
    {516, "Nebula", 12000, "Nebula-GTASA-front.png"},
    {467, "Oceanic", 15000, "Oceanic-GTASA-front.png"},
    {404, "Perennial", 12000, "Perennial-GTASA-front.png"},
    {426, "Premier", 14000, "Premier-GTASA-front.png"},
    {547, "Primo", 8000, "Primo-GTASA-front.png"},
    {479, "Regina", 13000, "Regina-GTASA-front.png"},
    {442, "Romero Hearse", 25000, "Romero-GTASA-front.png"},
    {405, "Sentinel", 20000, "Sentinel-GTASA-front.png"},
    {458, "Solair", 10000, "Solair-GTASA-front.png"},
    {580, "Stafford", 25000, "Stafford-GTASA-front.png"},
    {409, "Stretch", 35000, "Stretch-GTASA-front.png"},
    {550, "Sunrise", 18000, "Sunrise-GTASA-front.png"},
    {540, "Vincent", 20000, "Vincent-GTASA-front.png"},
    {421, "Washington", 22000, "Washington-GTASA-front.png"},
    {529, "Willard", 13000, "Willard-GTASA-front.png"}
};

// Bikes category
new const BIKES[][E_VEHICLE_SHOP_DATA] = {
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

// Call the function in OnPlayerCommandText or where appropriate
CMD:carshop(playerid, params[])
{
    new dialogString[1024], tempe[1024];
    format(tempe, sizeof(tempe), "Categories\tVehicle Count");
	strcat(dialogString, tempe);
    for (new i = 0; i < sizeof(VEHICLE_CATEGORIES); i++)
    {
        format(tempe, sizeof(tempe), "\n%s\t%s", VEHICLE_CATEGORIES[i][0], VEHICLE_CATEGORIES[i][1]);
		strcat(dialogString, tempe);
    }

    Dialog_Show(playerid, CARMENU, DIALOG_STYLE_TABLIST_HEADERS, "Car Shop", dialogString, "OK", "Close");

    return 1;
}

new PactiveCc[MAX_PLAYERS];

Dialog:CARMENU(playerid, response, listitem, inputtext[])
{
    if(response)
	{
		PactiveCc[playerid] = listitem;
		switch(listitem)
		{
			case 0:
			{
				new dialogString[3500], tempe[250];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(COMPACT_CARS); i++)
			    {
					if(COMPACT_CARS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", COMPACT_CARS[i][VEHICLE_MODELID], COMPACT_CARS[i][VEHICLE_NAME], COMPACT_CARS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", COMPACT_CARS[i][VEHICLE_MODELID], COMPACT_CARS[i][VEHICLE_NAME], COMPACT_CARS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
				
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 1:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(LUXURY_CARS); i++)
			    {
					if(LUXURY_CARS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", LUXURY_CARS[i][VEHICLE_MODELID], LUXURY_CARS[i][VEHICLE_NAME], LUXURY_CARS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", LUXURY_CARS[i][VEHICLE_MODELID], LUXURY_CARS[i][VEHICLE_NAME], LUXURY_CARS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 2:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(SUVS_WAGONS); i++)
			    {
					if(SUVS_WAGONS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", SUVS_WAGONS[i][VEHICLE_MODELID], SUVS_WAGONS[i][VEHICLE_NAME], SUVS_WAGONS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", SUVS_WAGONS[i][VEHICLE_MODELID], SUVS_WAGONS[i][VEHICLE_NAME], SUVS_WAGONS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 3:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(LOWRIDERS); i++)
			    {
					if(LOWRIDERS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", LOWRIDERS[i][VEHICLE_MODELID], LOWRIDERS[i][VEHICLE_NAME], LOWRIDERS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", LOWRIDERS[i][VEHICLE_MODELID], LOWRIDERS[i][VEHICLE_NAME], LOWRIDERS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 4:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(MUSCLE_CARS); i++)
			    {
					if(MUSCLE_CARS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", MUSCLE_CARS[i][VEHICLE_MODELID], MUSCLE_CARS[i][VEHICLE_NAME], MUSCLE_CARS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", MUSCLE_CARS[i][VEHICLE_MODELID], MUSCLE_CARS[i][VEHICLE_NAME], MUSCLE_CARS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 5:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(STREET_RACERS); i++)
			    {
					if(STREET_RACERS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", STREET_RACERS[i][VEHICLE_MODELID], STREET_RACERS[i][VEHICLE_NAME], STREET_RACERS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", STREET_RACERS[i][VEHICLE_MODELID], STREET_RACERS[i][VEHICLE_NAME], STREET_RACERS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 6:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(Recreational); i++)
			    {
					if(Recreational[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", Recreational[i][VEHICLE_MODELID], Recreational[i][VEHICLE_NAME], Recreational[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", Recreational[i][VEHICLE_MODELID], Recreational[i][VEHICLE_NAME], Recreational[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 7:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(SPORTS_CARS); i++)
			    {
					if(SPORTS_CARS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", SPORTS_CARS[i][VEHICLE_MODELID], SPORTS_CARS[i][VEHICLE_NAME], SPORTS_CARS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", SPORTS_CARS[i][VEHICLE_MODELID], SPORTS_CARS[i][VEHICLE_NAME], SPORTS_CARS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 8:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(SUVs_PICKUP_TRUCKS); i++)
			    {
					if(SUVs_PICKUP_TRUCKS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", SUVs_PICKUP_TRUCKS[i][VEHICLE_MODELID], SUVs_PICKUP_TRUCKS[i][VEHICLE_NAME], SUVs_PICKUP_TRUCKS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", SUVs_PICKUP_TRUCKS[i][VEHICLE_MODELID], SUVs_PICKUP_TRUCKS[i][VEHICLE_NAME], SUVs_PICKUP_TRUCKS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 9:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(TUNERS); i++)
			    {
					if(TUNERS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", TUNERS[i][VEHICLE_MODELID], TUNERS[i][VEHICLE_NAME], TUNERS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", TUNERS[i][VEHICLE_MODELID], TUNERS[i][VEHICLE_NAME], TUNERS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 10:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(COUPES_HATCHBACKS); i++)
			    {
					if(COUPES_HATCHBACKS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", COUPES_HATCHBACKS[i][VEHICLE_MODELID], COUPES_HATCHBACKS[i][VEHICLE_NAME], COUPES_HATCHBACKS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", COUPES_HATCHBACKS[i][VEHICLE_MODELID], COUPES_HATCHBACKS[i][VEHICLE_NAME], COUPES_HATCHBACKS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 11:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(SEDANS_STATION_WAGONS); i++)
			    {
					if(SEDANS_STATION_WAGONS[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", SEDANS_STATION_WAGONS[i][VEHICLE_MODELID], SEDANS_STATION_WAGONS[i][VEHICLE_NAME], SEDANS_STATION_WAGONS[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", SEDANS_STATION_WAGONS[i][VEHICLE_MODELID], SEDANS_STATION_WAGONS[i][VEHICLE_NAME], SEDANS_STATION_WAGONS[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
			case 12:
			{
				new dialogString[1024], tempe[1024];
			    format(tempe, sizeof(tempe), "Model ID\tVehicle Name\tPrice");
				strcat(dialogString, tempe);
			    for (new i = 0; i < sizeof(BIKES); i++)
			    {
					if(BIKES[i][VEHICLE_PRICE] >= 1000)
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%dK", BIKES[i][VEHICLE_MODELID], BIKES[i][VEHICLE_NAME], BIKES[i][VEHICLE_PRICE] / 1000);
						strcat(dialogString, tempe);
					}
					else
					{
				        format(tempe, sizeof(tempe), "\n%d\t%s\t$%d", BIKES[i][VEHICLE_MODELID], BIKES[i][VEHICLE_NAME], BIKES[i][VEHICLE_PRICE]);
						strcat(dialogString, tempe);
					}
						
			    }
			
			    Dialog_Show(playerid, NVM_MENU, DIALOG_STYLE_TABLIST_HEADERS, "2-Door & Compact Car Shop", dialogString, "OK", "Back");
				return 1;
			}
		}
	}
	return 1;
}
		
Dialog:NVM_MENU(playerid, response, listitem, inputtext[])
{
    if(response)
	{
		switch(PactiveCc[playerid])
		{
			
//////////////////////////////////////////////			
			if(PlayerInfo[playerid][vLevel] >= 1 && GetPlayerVehicles{playerid} >= MAX_VIP_VEHS)
	        {
	            	    new string[150];
	            	    format(string, sizeof(string), "You already own a maximum of %d vehicles, delete/sell one before buying another.", MAX_VIP_VEHS);
	            	    SendClientMessageACNR(playerid, RED, string);
	            	    return 1;
	        }
			else if(PlayerInfo[playerid][vLevel] < 1 && DegreeInfo[playerid][dDealer] >= 1 && GetPlayerVehicles{playerid} >= MAX_DEGREE_VEHS)
	        {
	            	    new string[150];
	            	    format(string, sizeof(string), "You already own a maximum of %d vehicles, delete/sell one before buying another.", MAX_DEGREE_VEHS);
	            	    SendClientMessageACNR(playerid, RED, string);
	            	    return 1;
	        }
            else if(PlayerInfo[playerid][vLevel] < 1 && DegreeInfo[playerid][dDealer] < 1 && GetPlayerVehicles{playerid} >= MAX_BUYABLE_VEHS)//Player
	        {
	            	    new string[150];
	            	    format(string, sizeof(string), "You already own a maximum of %d vehicles, delete/sell one before buying another.", MAX_BUYABLE_VEHS);
	            	    SendClientMessageACNR(playerid, RED, string);
	            	    return 1;
	        }

			case 0:
			{
	            if(GetPlayerCash(playerid) < COMPACT_CARS[listitem][VEHICLE_PRICE]) return SendClientMessageACNR(playerid, RED, "Pool kafi nadari!.");
	            CreateNewPlayerVehicle(playerid, 411, COMPACT_CARS[listitem][VEHICLE_PRICE]);
				SendClientMessageACNR(playerid, WHITE, "You have successfully purchased a Infernus for $2M.");
				return 1;
			}
			
/////////////////////////////////////////////////////////////			
			
			case 1:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", LUXURY_CARS[listitem][VEHICLE_MODELID], LUXURY_CARS[listitem][VEHICLE_NAME], LUXURY_CARS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 2:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", SUVS_WAGONS[listitem][VEHICLE_MODELID], SUVS_WAGONS[listitem][VEHICLE_NAME], SUVS_WAGONS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 3:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", LOWRIDERS[listitem][VEHICLE_MODELID], LOWRIDERS[listitem][VEHICLE_NAME], LOWRIDERS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 4:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", MUSCLE_CARS[listitem][VEHICLE_MODELID], MUSCLE_CARS[listitem][VEHICLE_NAME], MUSCLE_CARS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 5:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", STREET_RACERS[listitem][VEHICLE_MODELID], STREET_RACERS[listitem][VEHICLE_NAME], STREET_RACERS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 6:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", Recreational[listitem][VEHICLE_MODELID], Recreational[listitem][VEHICLE_NAME], Recreational[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 7:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", SPORTS_CARS[listitem][VEHICLE_MODELID], SPORTS_CARS[listitem][VEHICLE_NAME], SPORTS_CARS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 8:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", SUVs_PICKUP_TRUCKS[listitem][VEHICLE_MODELID], SUVs_PICKUP_TRUCKS[listitem][VEHICLE_NAME], SUVs_PICKUP_TRUCKS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 9:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", TUNERS[listitem][VEHICLE_MODELID], TUNERS[listitem][VEHICLE_NAME], TUNERS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 10:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", COUPES_HATCHBACKS[listitem][VEHICLE_MODELID], COUPES_HATCHBACKS[listitem][VEHICLE_NAME], COUPES_HATCHBACKS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 11:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", SEDANS_STATION_WAGONS[listitem][VEHICLE_MODELID], SEDANS_STATION_WAGONS[listitem][VEHICLE_NAME], SEDANS_STATION_WAGONS[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
			case 12:
			{
				SendClientMessage(playerid, -1, "%d\t%s\t$%dK", BIKES[listitem][VEHICLE_MODELID], BIKES[listitem][VEHICLE_NAME], BIKES[listitem][VEHICLE_PRICE] / 1000);
				return 1;
			}
		}
	}
	else
	{
	    new dialogString[1024], tempe[1024];
	    format(tempe, sizeof(tempe), "Categories\tVehicle Count");
		strcat(dialogString, tempe);
	    for (new i = 0; i < sizeof(VEHICLE_CATEGORIES); i++)
	    {
	        format(tempe, sizeof(tempe), "\n%s\t%s", VEHICLE_CATEGORIES[i][0], VEHICLE_CATEGORIES[i][1]);
			strcat(dialogString, tempe);
	    }
	
	    Dialog_Show(playerid, CARMENU, DIALOG_STYLE_TABLIST_HEADERS, "Car Shop", dialogString, "OK", "Close");
	}
	return 1;
}
			
/*

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

// Recreational category
new const Recreational[][E_VEHICLE_SHOP_DATA] = {
    {568, "Bandito", 15000, 1},
    {424, "BF Injection", 20000, 2},
    {504, "Bloodring Banger", 25000, 3},
    {457, "Caddy", 10000, 4},
    {483, "Camper", 30000, 5},
    {508, "Journey", 35000, 6},
    {571, "Kart", 5000, 7},
    {500, "Mesa", 18000, 8},
    {444, "Monster", 40000, 9},
    {556, "Monster 2", 45000, 10},
    {557, "Monster 3", 50000, 11},
    {471, "Quadbike", 12000, 12},
    {495, "Sandking", 28000, 13},
    {539, "Vortex", 22000, 14}
};

// Sports Cars category
new const SPORTS_CARS[][E_VEHICLE_SHOP_DATA] = {
    {602, "Alpha", 35000, "Alpha-GTASA-front.png"},
    {429, "Banshee", 45000, "Banshee-GTASA-front.png"},
    {402, "Buffalo", 40000, "Buffalo-GTASA-front.png"},
    {541, "Bullet", 50000, "Bullet-GTASA-front.png"},
    {415, "Cheetah", 55000, "Cheetah-GTASA-front.png"},
    {480, "Comet", 40000, "Comet-GTASA-front.png"},
    {587, "Euros", 25000, "Euros-GTASA-front.png"},
    {434, "Hotknife", 35000, "Hotknife-GTASA-front.png"},
    {411, "Infernus", 70000, "Infernus-GTASA-front.png"},
    {603, "Phoenix", 30000, "Phoenix-GTASA-front.png"},
    {506, "Super GT", 60000, "SuperGT-GTASA-front.png"},
    {451, "Turismo", 65000, "Turismo-GTASA-front.png"},
    {555, "Windsor", 55000, "Windsor-GTASA-front.png"},
    {477, "ZR-350", 55000, "ZR350-GTASA-front.png"}
};

// SUVs & Pickup Trucks category
new const SUVs_PICKUP_TRUCKS[][E_VEHICLE_SHOP_DATA] = {
    {422, "Bobcat", 15000, "Bobcat-GTASA-front.png"},
    {579, "Huntley", 30000, "Huntley-GTASA-front.png"},
    {400, "Landstalker", 25000, "Landstalker-GTASA-front.png"},
    {500, "Mesa", 20000, "Mesa-GTASA-front.png"},
    {444, "Monster", 50000, "Monster-GTASA-monster-front.png"},
    {556, "Monster A", 50000, "Monster-GTASA-monstera-front.png"},
    {557, "Monster B", 50000, "Monster-GTASA-monsterb-front.png"},
    {470, "Patriot", 35000, "Patriot-GTASA-front.png"},
    {600, "Picador", 12000, "Picador-GTASA-front.png"},
    {489, "Rancher", 18000, "Rancher-GTASA-front.png"},
    {543, "Sadler", 10000, "Sadler-GTASA-front.png"},
    {495, "Sandking", 30000, "Sandking-GTASA-front.png"},
    {605, "Sadler (beater)", 8000, "Sadler-GTASA-beater-front.png"},
    {478, "Walton", 15000, "Walton-GTASA-front.png"},
    {554, "Yosemite", 20000, "Yosemite-GTASA-front.png"}
};

// Lowriders category
new const LOWRIDERS[][E_VEHICLE_SHOP_DATA] = {
    {536, "Blade", 15000, "Blade-GTASA-front.png"},
    {575, "Broadway", 20000, "Broadway-GTASA-front.png"},
    {534, "Remington", 17000, "Remington-GTASA-front.png"},
    {567, "Savanna", 22000, "Savanna-GTASA-front.png"},
    {535, "Slamvan", 18000, "Slamvan-GTASA-front.png"},
    {566, "Tahoma", 12000, "Tahoma-GTASA-front.png"},
    {576, "Tornado", 13000, "Tornado-GTASA-front.png"},
    {412, "Voodoo", 16000, "Voodoo-GTASA-front.png"}
};

// Tuners category
new const TUNERS[][E_VEHICLE_SHOP_DATA] = {
    {562, "Elegy", 45000, "Elegy-GTASA-front.png"},
    {565, "Flash", 40000, "Flash-GTASA-front.png"},
    {559, "Jester", 45000, "Jester-GTASA-front.png"},
    {561, "Stratum", 35000, "Stratum-GTASA-front.png"},
    {560, "Sultan", 50000, "Sultan-GTASA-front.png"},
    {558, "Uranus", 50000, "Uranus-GTASA-front.png"}
};

// Coupes & Hatchbacks category
new const COUPES_HATCHBACKS[][E_VEHICLE_SHOP_DATA] = {
    {496, "Blista Compact", 6000, "BlistaCompact-GTASA-front.png"},
    {401, "Bravura", 8000, "Bravura-GTASA-front.png"},
    {518, "Buccaneer", 15000, "Buccaneer-GTASA-front.png"},
    {527, "Cadrona", 10000, "Cadrona-GTASA-front.png"},
    {542, "Clover", 15000, "Clover-GTASA-front.png"},
    {589, "Club", 12000, "Club-GTASA-front.png"},
    {419, "Esperanto", 7000, "Esperanto-GTASA-front.png"},
    {533, "Feltzer", 18000, "Feltzer-GTASA-front.png"},
    {526, "Fortune", 14000, "Fortune-GTASA-front.png"},
    {474, "Hermes", 15000, "Hermes-GTASA-front.png"},
    {545, "Hustler", 13000, "Hustler-GTASA-front.png"},
    {517, "Majestic", 14000, "Majestic-GTASA-front.png"},
    {410, "Manana", 5000, "Manana-GTASA-front.png"},
    {436, "Previon", 8000, "Previon-GTASA-front.png"},
    {475, "Sabre", 25000, "Sabre-GTASA-front.png"},
    {439, "Stallion", 12000, "Stallion-GTASA-front.png"},
    {549, "Tampa", 11000, "Tampa-GTASA-front.png"},
    {491, "Virgo", 9000, "Virgo-GTASA-front.png"}
};

// Sedans & Station Wagons category
new const SEDANS_STATION_WAGONS[][E_VEHICLE_SHOP_DATA] = {
    {445, "Admiral", 15000, "Admiral-GTASA-front.png"},
    {507, "Elegant", 10000, "Elegant-GTASA-front.png"},
    {585, "Emperor", 25000, "Emperor-GTASA-front.png"},
    {466, "Glendale", 12000, "Glendale-GTASA-front.png"},
    {604, "Glendale (beater)", 8000, "Glendale-GTASA-beater-front.png"},
    {492, "Greenwood", 10000, "Greenwood-GTASA-front.png"},
    {546, "Intruder", 15000, "Intruder-GTASA-front.png"},
    {551, "Merit", 11000, "Merit-GTASA-front.png"},
    {516, "Nebula", 12000, "Nebula-GTASA-front.png"},
    {467, "Oceanic", 15000, "Oceanic-GTASA-front.png"},
    {404, "Perennial", 12000, "Perennial-GTASA-front.png"},
    {426, "Premier", 14000, "Premier-GTASA-front.png"},
    {547, "Primo", 8000, "Primo-GTASA-front.png"},
    {479, "Regina", 13000, "Regina-GTASA-front.png"},
    {442, "Romero Hearse", 25000, "Romero-GTASA-front.png"},
    {405, "Sentinel", 20000, "Sentinel-GTASA-front.png"},
    {458, "Solair", 10000, "Solair-GTASA-front.png"},
    {580, "Stafford", 25000, "Stafford-GTASA-front.png"},
    {409, "Stretch", 35000, "Stretch-GTASA-front.png"},
    {550, "Sunrise", 18000, "Sunrise-GTASA-front.png"},
    {540, "Vincent", 20000, "Vincent-GTASA-front.png"},
    {421, "Washington", 22000, "Washington-GTASA-front.png"},
    {529, "Willard", 13000, "Willard-GTASA-front.png"}
};

*/

/*
ShowPlayerDialog(playerid, NVM_MENU, DIALOG_STYLE_LIST, "{FFFFFF} Car Shop", "{FFFFFF}Sports Cars\nMotor Bikes\nSpecial Vehicles", "Select", "Cancel");

		case CAR_SHOP:
	    {
	        if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	        {
				Dialog_Show(playerid, Custom_COLOR0, DIALOG_STYLE_TABLIST_HEADERS, "Custom Colour", "Item\tColour\tPrice\n\
				1\tColour 1\t$5K\n\
				2\tColour 2\t$5K", "OK", "Back");
	        	ShowPlayerDialog(playerid, NVM_MENU, DIALOG_STYLE_LIST, "{FFFFFF} Car Shop", "{FFFFFF}Sports Cars\nMotor Bikes\nSpecial Vehicles", "Select", "Cancel");
			}
		}
		
	if(dialogid == NVM_MENU)
	{
	    if(response)
	    switch(listitem)
	    {
	        case 0://Sports Cars
	        {
	            ShowPlayerDialog(playerid, NVM_CARS, DIALOG_STYLE_LIST, "{FFFFFF} Car Shop - Sports Cars", "{FFFFFF}Vehicle: Infernus - Price: $2M\nVehicle: Bullet - Price: $2M\nVehicle: Banshee - Price: $1M\nVehicle: Super-GT - Price: $1M\nVehicle: Sultan - Price: $800K\nVehicle: Elegy - Price: $800K\nVehicle: Phonix - Price: $1M\nVehicle: Turismo - Price: $1M\nVehicle: ZR-350 - Price: $1M\nVehicle: Jester - Price: $1M\nVehicle: Flash - Price: $1M\nVehicle: Cheetah - Price: $1M", "Buy", "Cancel");
	            return 1;
	        }
	        case 1://Motor Bikes
	        {
	            ShowPlayerDialog(playerid, NVM_BIKES, DIALOG_STYLE_LIST, "{FFFFFF} Car Shop - Motor Bikes", "{FFFFFF}Vehicle: NRG-500 - Price: $2M\nVehicle: FCR-900 - Price: $1M\nVehicle: PCJ-600 - Price: $800K\nVehicle: Sanchez - Price: $500K\nVehicle: FreeWay - Price: $800K", "Buy", "Cancel");
	            return 1;
	        }
	        case 2://Special Vehicles
	        {
	            ShowPlayerDialog(playerid, NVM_SPEC, DIALOG_STYLE_LIST, "{FFFFFF} Car Shop - Special Vehicles", "{FFFFFF}Vehicle: Maverick - Price: $5M\nVehicle: Vortex - Price: $3M\nVehicle: Monster Truck - Price: $2M\nVehicle: Bandito - Price: $1M\nVehicle: Quad Bike - Price: $500K\nVehicle: Slamvan - Price: $800K\nVehicle: Remington - Price: $800K\nVehicle: Blade - Price: $800K\nVehicle: Buffalo - Price: $800K\nVehicle: Stratum - Price: $1M", "Buy", "Cancel");
	        }
	    }
	    return 1;
	}
*/