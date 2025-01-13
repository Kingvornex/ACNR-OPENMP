#include <open.mp>
#include <streamer>

#define MAP_FILE "ACNR/ACNR-DEBUG/MAPs.txt"

//new Objects[5000];

new Float:xd = -2185.21847, Float:yd = 2243.4699, Float:zd = -323.00;

stock DiffCalculator()
{
	// new x y z : 2546.0701, 460.8994, 4.5765
	// old x y z : 3770.34888, -1391.94788, 333.00000
	xd = floatadd(2546.0701 , -3770.34888), yd = floatadd(460.8994 , 1391.94788), zd = floatadd(5.0 , -333.0);
}

stock MoveTheObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new Float:xx, Float:yy, Float:zz;
	xx = x + xd, yy = y + yd, zz = z + zd;
	new stringe[300];
	format(stringe, sizeof(stringe), " CreateDynamicObject(%d, %f, %f, %f, %f, %f, %f);", modelid, xx, yy, zz, rx, ry, rz);
	SaveDebug(MAP_FILE, stringe);
}

stock SaveDebug(const filename[], const stringl[])
{
    new File:handle;

    if (fexist(filename))
    {
        // File exists, open in append mode
        handle = fopen(filename, io_append);
    }
    else
    {
        // File does not exist, create it
        handle = fopen(filename, io_write);
        printf("%s did not exist. Got Created", filename);
    }

    // Check if file is open
    if (handle)
    {
        // Append the string
        fwrite(handle, "\r\n");
        fwrite(handle, stringl);
		
		print(stringl);

        // Close the file
        fclose(handle);
    }
    else
    {
        // Error
        print("Failed to open or create file.");
    }
}

public OnFilterScriptInit()
{
	 if (fcreatedir("ACNR/ACNR-DEBUG")) { printf("The directory \"ACNR/ACNR-DEBUG\" created successfully."); }
	 else { print("Failed to create the directory \"ACNR/ACNR-DEBUG\""); }
	 DiffCalculator();
     MoveTheObject(13657, 3770.34888, -1391.94788, 333.00000,   0.00000, 0.00000, 0.00000);
     MoveTheObject(18228, 3876.04370, -1415.10315, 329.73340,   0.00000, 0.00000, 0.00000);
     MoveTheObject(18228, 3875.93896, -1320.01367, 333.46890,   0.00000, 0.00000, 287.00000);
     MoveTheObject(18228, 3734.66797, -1328.24390, 329.74329,   0.00000, 0.00000, 193.00000);
     MoveTheObject(18228, 3737.00146, -1417.12061, 328.92041,   0.00000, 0.00000, -76.00000);
     MoveTheObject(1649, 3764.42749, -1420.40540, 331.25641,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3853.53369, -1388.89392, 330.25220,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3852.42920, -1363.42078, 329.75159,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3815.66626, -1342.55725, 329.75229,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3789.35889, -1346.65125, 330.75009,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3773.33862, -1374.18213, 329.96643,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3795.64819, -1392.44849, 329.74475,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3822.13086, -1391.69128, 329.74258,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3739.85254, -1366.85608, 329.74872,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3813.54175, -1367.50305, 329.71472,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3766.13281, -1403.44812, 329.94806,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3838.61011, -1406.87317, 332.22791,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16304, 3759.51392, -1344.39612, 331.70999,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16310, 3811.45044, -1406.24097, 329.73160,   0.00000, 0.00000, 0.00000);
     MoveTheObject(13607, 3794.54810, -1371.34448, 329.72589,   0.00000, 0.00000, 0.00000);
     MoveTheObject(0, 3831.64746, -1370.34827, 329.74109,   0.00000, 0.00000, 0.00000);
     MoveTheObject(1631, 3834.30713, -1371.51184, 331.23190,   0.00000, 0.00000, -47.00000);
     MoveTheObject(3363, 3750.55566, -1388.77808, 329.72751,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16401, 3794.66870, -1367.81836, 329.74927,   0.00000, 0.00000, 0.00000);
     MoveTheObject(13590, 3788.29028, -1401.63831, 330.74619,   0.00000, 0.00000, 0.00000);
     MoveTheObject(16085, 3753.24097, -1354.98193, 329.75140,   0.00000, 0.00000, 0.00000);
     MoveTheObject(12956, 3842.66650, -1344.07373, 332.73141,   0.00000, 0.00000, 0.00000);
     //MoveTheObject(19650, 3897.46802, -1369.64221, 355.06021,   0.00000, 0.00000, 0.00000);
     MoveTheObject(3364, 3862.97876, -1402.58105, 329.75241,   0.00000, 0.00000, 0.00000);
     //MoveTheObject(19645, 3864.46680, -1369.20496, 346.72559,   0.00000, 0.00000, 269.00000);

}
