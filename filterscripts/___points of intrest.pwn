/*
name, x, y ,z, description
army base, 165.6000, 1792.0000, 21.2000
kenar army, 266.8027, 1413.4496, 9.4290
edited village, -193.4547, 1093.7825, 18.5945
favareh, -329.4037, 1861.1232, 43.0437
bridge, -531.1959, 1990.5964, 63.6800
hidden base, -414.7000, 2220.5540, 50.1901
desert air port, 302.5474, 2503.1116, 20.3000
edited village 2, -266.6833, 2672.1633, 63.5942
ufo, /ufoloc
pirateship, /shiploc
arena 0, 1097.9602, 1609.2200, 11.5365 , /enterarena
arena 1, 2861.3235, 1874.2607, 10.0345
arena 2, 1213.0013, 674.8533, 9.9836
arena 3, 2546.070068, 460.899414, 5.000
island 0, 2177.1460, 486.5380, 8.8694
island 1, 525.0092, 3691.9287, 29.4745
island 2, 3202.6047, 411.9922, 7.7629
jail, -1196.5997, -988.5609, 128.2458
prison, 2902.8962, -604.2015, 10.0424
house, 941.4606, 1968.7744, 9.8344
ferris wheel, 390.3552, -2028.3500, 6.8261
building, -2663.9956, -139.9177, 5.7007
zir gozar, 1794.1208, 842.7214, 0.4594
sf train station, -1991.4653, 118.0570, 26.6863
base 1, 2787.4753, 949.7017, 9.7549
base 2, 1926.1913, 702.3910, 9.8077
construction site, 2589.0630, 813.8148, 4.3094
meydan asli, 2316.8438, 2352.9297, 13.2734
asansoor, 1961.5653, 2376.6826, 9.8070
dragon house, 2095.5142, 2786.6809, 9.7794
only up, 2923.3210, 2100.3835, 16.8852
manstion, 957.7600, 2464.6799, 7.3400
basketball playground, 2582.7990, 2447.7505, 12.0100

*/

#include <open.mp>
#include <izcmd>
#include <easyDialog>

// Define the names of the locations
new const gpsnames[35][] = {
    "Army Base",
    "Army UFO",
    "Army Village",
    "Favareh",
    "Bridge / Dam / Sad",
    "Hidden Base",
    "Desert AirPort",
    "Army Village 2",
    "Arena 0",
    "Arena 1",
    "Arena 2",
    "Arena 3",
    "Island 0",
    "Island 1",
    "Island 2",
    "Jail",
    "Prison",
    "House",
    "Ferris Wheel 1",
    "Ferris Wheel 2",
    "Building",
    "Zir Gozar",
    "SF Train Station",
    "Base 1",
    "Base 2",
    "Construction Site",
    "Meydan Ssli",
    "Ssansoor",
    "Dragon House",
    "Only Up",
    "Manstion",
    "Basketball Playground",   
	"UFO",
    "PirateShip",
	"CargoShip"

};

// Define the locations array
new Float:gpslocations[35][3] = {
    {165.6000, 1792.0000, 21.2000}, // army base
    {266.8027, 1413.4496, 9.4290},  // kenar army
    {-193.4547, 1093.7825, 18.5945}, // edited village
    {-329.4037, 1861.1232, 43.0437}, // favareh
    {-531.1959, 1990.5964, 63.6800}, // bridge
    {-414.7000, 2220.5540, 50.1901}, // hidden base
    {302.5474, 2503.1116, 20.3000},  // desert air port
    {-266.6833, 2672.1633, 63.5942}, // edited village 2
    {1097.9602, 1609.2200, 11.5365}, // arena 0
    {2861.3235, 1874.2607, 10.0345}, // arena 1
    {1213.0013, 674.8533, 9.9836},   // arena 2
    {2546.070068, 460.899414, 5.000},// arena 3
    {2177.1460, 486.5380, 8.8694},   // island 0
    {525.0092, 3691.9287, 29.4745},  // island 1
    {3202.6047, 411.9922, 7.7629},   // island 2
    {-1196.5997, -988.5609, 128.2458},// jail
    {2902.8962, -604.2015, 10.0424}, // prison
    {941.4606, 1968.7744, 9.8344},   // house
    {390.1562, -2028.6246, 21.9786},  // ferris wheel 1
    {832.8393, -2046.1990, 27.0900},  // ferris wheel 2
    {-2663.9956, -139.9177, 5.7007}, // building
    {1794.1208, 842.7214, 0.4594},   // zir gozar
    {-1991.4653, 118.0570, 26.6863}, // sf train station
    {2787.4753, 949.7017, 9.7549},   // base 1
    {1926.1913, 702.3910, 9.8077},   // base 2
    {2589.0630, 813.8148, 4.3094},   // construction site
    {2316.8438, 2352.9297, 13.2734}, // meydan asli
    {1961.5653, 2376.6826, 9.8070},  // asansoor
    {2095.5142, 2786.6809, 9.7794},  // dragon house
    {2923.3210, 2100.3835, 16.8852}, // only up
    {957.7600, 2464.6799, 7.3400},   // mansion
    {2582.7990, 2447.7505, 12.0100},  // basketball playground    
	{0.0, 0.0, 0.0}, // placeholder for UFO
    {0.0, 0.0, 0.0}, // placeholder for Pirateship
    {0.0, 0.0, 0.0} // placeholder for CargoShip
};

// Command to show GPS locations dialog
CMD:gogps(playerid, params[])
{
    new dialogText[1024], temptext[1024];
    new i;

    // Generate the dialog text
    for (i = 0; i < sizeof(gpslocations); i++)
    {
        format(temptext, sizeof(temptext), "%s\n", gpsnames[i]);
		strcat(dialogText, temptext);
    }

    // Show the dialog with location choices
    Dialog_Show(playerid, GPSdialogID, DIALOG_STYLE_LIST, "Select GPS Location", dialogText, "Select", "Cancel");
	return true;
}

// GPS Dialog selection handler
Dialog:GPSdialogID(playerid, response, listitem, inputtext[])
{
    new Float:x, Float:y, Float:z;

    // If the player selected UFO or Pirate Ship, run the respective command
    if (listitem == 32) // UFO (index 8)
    {
        SendClientMessage(playerid, -1, "Use  [ /ufoLoc ]  to find the UFO location!");
        return 1;
    }
    else if (listitem == 33) // Pirateship (index 9)
    {
        // Run the /shiploc command
        SendClientMessage(playerid, -1, "Use  [ /ShipLoc ]  to find Pirate Ship location!");
        return 1;
    }
    else if (listitem == 34) // Pirateship (index 9)
    {
        // Run the /shiploc command
        SendClientMessage(playerid, -1, "Use  [ /cargo ]  to find the Cargo Ship location!");
        return 1;
    }

    // Get the selected location coordinates
    x = gpslocations[listitem][0];
    y = gpslocations[listitem][1];
    z = gpslocations[listitem][2];

	new Float:PX, Float:PY, Float:PZ;
	GetPlayerPos(playerid, PX, PY, PZ);
    PlayerPlaySound(playerid, 1149, PX, PY, PZ); // Ding sound

	DisablePlayerCheckpoint(playerid);
	
    SetPlayerCheckpoint(playerid, x, y, z, 20.0); // 5.0 is the size of the checkpoint radius
	return 1;
}












