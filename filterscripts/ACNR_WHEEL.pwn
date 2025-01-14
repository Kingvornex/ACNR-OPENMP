#include <open.mp>
#include <streamer>
//#include <izcmd>

/////////////////////////////////////////////////////////////////////////////////FERRISWHEEL BY REDREAPER666
 new rotY=0;

 new wheel;//MAINWHEEL
 new gondel1,gondel2,gondel3,gondel4,gondel5,gondel6,gondel7,gondel8;//gondels
/*
 COMMAND:ferris(playerid, params[])
 {
	 SetPlayerPos(playerid,376.9577, -2032.7040, 7.0);
	 return 1;
 }
*/
 public OnFilterScriptInit()
 {
	 print("\n--------------------------------------");
	 print(" Redreaper666`s Working Ferris Wheel v 1.0");
	 print("--------------------------------------\n");
	
	 //CREATE NEW FERRIS WHEEL
	 CreateDynamicObject(18878, 390.1633, -2028.6056, 21.9822,   0.0000, 0.0000, 90.0000);//MAINSTAND
	
	 wheel = CreateDynamicObject(18877, 390.1562, -2028.6246, 21.9786, 0.0000, rotY, 90.000);//MAINWHEEL
	 gondel1 = CreateDynamicObject(19316, 390.16, -2028.62, 21.98, 0.0, 0.0, 90.0);
	 gondel2 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 gondel3 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 gondel4 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 gondel5 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 gondel6 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 gondel7 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 gondel8 = CreateDynamicObject(19316, 1453.2300, 1614.0100, 0.0, 0.0, 0.0, 90.0);
	 return 1;
 }

 forward Turn(playerid);
 public Turn(playerid)
 {
	 MoveDynamicObject(wheel, 390.1562, -2028.6246, 21.9786,12.0, 0.0, rotY, 90.0);//MAINWHEEL
	 AttachDynamicObjectToObject(gondel1, wheel, 0.0, 0.0, -11.66, 0.0, -rotY, 0.0);//gondel1
	 AttachDynamicObjectToObject(gondel2, wheel, 0.0, 0.0, 11.66, 0.0, -rotY, 0.0);//gondel2
	 AttachDynamicObjectToObject(gondel3, wheel, -11.66, 0.0, 0.0, 0.0, -rotY, 0.0);//gondel3
	 AttachDynamicObjectToObject(gondel4, wheel, 11.66, 0.0, 0.0, 0.0, -rotY, 0.0);//gondel4
	 AttachDynamicObjectToObject(gondel5, wheel, 9.33, 0.0, -7.0, 0.0 , -rotY, 0.0);//gondel5
	 AttachDynamicObjectToObject(gondel6, wheel, -9.33, 0.0, 7.0, 0.0, -rotY, 0.0);//gondel6
	 AttachDynamicObjectToObject(gondel7, wheel, 9.33, 0.0, 7.0, 0.0, -rotY, 0.0);//gondel7
	 AttachDynamicObjectToObject(gondel8, wheel, -9.33, 0.0, -7.0, 0.0, -rotY, 0.0);//gondel8
	
	 rotY ++;
 }
 public OnPlayerConnect(playerid)
 {
	 RemoveBuildings(playerid);
	 SetTimer("Turn", 80, true);
	 PlayerPlaySound(playerid, 6000, 390.1562, -2028.6246, 21.9786);
	 return 1;
 }
 RemoveBuildings(playerid)
 {
	 //REMOVE OLD FERRISWHEEL DynamicObjects
	 RemoveBuildingForPlayer(playerid, 6463, 389.7734, -2028.4688, 19.8047, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2028.5000, 32.2266, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2021.6406, 29.9297, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2017.4531, 24.0313, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2017.4297, 16.8516, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2021.6328, 10.9844, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2028.5156, 8.7813, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2035.3984, 10.9453, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2039.6406, 16.8438, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2039.6563, 24.1094, 0.25);
	 RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2035.3828, 29.9531, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2039.6406, 16.8438, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2039.6563, 24.1094, 0.25);
	 RemoveBuildingForPlayer(playerid, 6298, 389.7734, -2028.4688, 19.8047, 0.25);
	 RemoveBuildingForPlayer(playerid, 6461, 389.7734, -2028.5000, 20.1094, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2028.5000, 32.2266, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2021.6406, 29.9297, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2017.4531, 24.0313, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2017.4297, 16.8516, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2021.6328, 10.9844, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2028.5156, 8.7813, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2035.3984, 10.9453, 0.25);
	 RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2035.3828, 29.9531, 0.25);
 }