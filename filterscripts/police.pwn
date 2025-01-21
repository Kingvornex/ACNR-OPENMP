#define FILTERSCRIPT

#include <a_samp>

#if defined FILTERSCRIPT

enum PoliceEnum
{
	bool:Use,
	Siren,
	Blue,
	Red,
	Value,
	Timer
};
new Police[MAX_VEHICLES][PoliceEnum];
forward OnPoliceSiren(vehicleid);

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" POLICE NEON LIGHTS (NUM4) (NUM6)");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" POLICE NEON LIGHTS (NUM4) (NUM6)");
	print("----------------------------------\n");
}

#endif

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == 8192)
	{
        if(IsPlayerInAnyVehicle(playerid) == 1)
	    {
           new car = GetPlayerVehicleID(playerid);
		   new param[7];
		   GetVehicleParamsEx(car,param[0],param[1],param[2],param[3],param[4],param[5],param[6]);
		   if(Police[car][Use] == false)
		   {
		        Police[car][Use]   = true;
		        Police[car][Siren] = CreateObject(18646,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
		        Police[car][Blue]  = CreateObject(18648,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
		        Police[car][Red]   = CreateObject(18647,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
		        Police[car][Timer] = SetTimerEx("OnPoliceSiren",200,1,"d",car);
		        AttachObjectToVehicle(Police[car][Siren],car,0.0,0.0,0.6,0.0,0.0,0.0);
		        SetVehicleParamsEx(car,1,param[1],param[2],param[3],param[4],param[5],param[5]);
		    }
		}
	}
	if(newkeys == 16384)
	{
		if(IsPlayerInAnyVehicle(playerid) == 1)
		{
		    new car  = GetPlayerVehicleID(playerid);
		    new param[7];
		    GetVehicleParamsEx(car,param[0],param[1],param[2],param[3],param[4],param[5],param[6]);
	        if(Police[car][Use] == true)
		    {
			    Police[car][Use] = false;
			    AttachObjectToVehicle(Police[car][Siren],0,0.0,0.0,0.0,0.0,0.0,0.0);
			    AttachObjectToVehicle(Police[car][Blue],0,0.0,0.0,0.0,0.0,0.0,0.0);
			    AttachObjectToVehicle(Police[car][Red],0,0.0,0.0,0.0,0.0,0.0,0.0);
			    DestroyObject(Police[car][Siren]);
			    DestroyObject(Police[car][Blue]);
			    DestroyObject(Police[car][Red]);
			    KillTimer(Police[car][Timer]);
	    	}
		}
	}
	return 1;
}

public OnPoliceSiren(vehicleid)
{
    if(Police[vehicleid][Use] == true)
    {
        new param[4];
	    GetVehicleDamageStatus(vehicleid,param[0],param[1],param[2],param[3]);
		if(Police[vehicleid][Value] == 0)
		{
	        UpdateVehicleDamageStatus(vehicleid,param[0],param[1],1,param[3]);
			AttachObjectToVehicle(Police[vehicleid][Blue],vehicleid,0.7,0.0,-0.7,0.0,0.0,0.0);
			AttachObjectToVehicle(Police[vehicleid][Red],vehicleid,-0.7,0.0,-0.7,0.0,0.0,0.0);
			Police[vehicleid][Value] = 1;
		}
		else if(Police[vehicleid][Value] == 1)
		{
	        UpdateVehicleDamageStatus(vehicleid,param[0],param[1],4,param[3]);
            AttachObjectToVehicle(Police[vehicleid][Blue],vehicleid,-0.7,0.0,-0.7,0.0,0.0,0.0);
            AttachObjectToVehicle(Police[vehicleid][Red],vehicleid,0.7,0.0,-0.7,0.0,0.0,0.0);
            Police[vehicleid][Value] = 0;
		}
    }
}
