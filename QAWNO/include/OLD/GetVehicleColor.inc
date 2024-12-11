/*
    SA-MP "GetVehicleColor v2.1" Include
    Copyright © 2011 RyDeR`
*/

#if defined _Included_GetVehicleColor
    #endinput
#endif

#define _Included_GetVehicleColor

#define PROPERTY_OFFSET(%0) \
    ((((%0) * ((%0) << 1)) << 2) + 65536)

stock n_AddStaticVehicle(modelID, Float: spawn_X, Float: spawn_Y, Float: spawn_Z, Float: z_Angle, color1, color2)
{
    if(color1 < 0 || color2 < 0)
    {
        color1 = random(127);
        color2 = random(127);
    }
    modelID = AddStaticVehicle(modelID, spawn_X, spawn_Y, spawn_Z, z_Angle, color1, color2);
    
    new
        localColorStr[24]
    ;   
    format(localColorStr, sizeof(localColorStr), "%d-%d", color1, color2);
    setproperty(_, "", PROPERTY_OFFSET(modelID), localColorStr);
    
    return modelID;
}

stock n_AddStaticVehicleEx(modelID, Float: spawn_X, Float: spawn_Y, Float: spawn_Z, Float: z_Angle, color1, color2, respawn_Delay)
{
    if(color1 < 0 || color2 < 0)
    {
        color1 = random(127);
        color2 = random(127);
    }
    modelID = AddStaticVehicleEx(modelID, spawn_X, spawn_Y, spawn_Z, z_Angle, color1, color2, respawn_Delay);

    new
        localColorStrEx[24]
    ;    
    format(localColorStrEx, sizeof(localColorStrEx), "%d-%d", color1, color2);
    setproperty(_, "", PROPERTY_OFFSET(modelID), localColorStrEx);

    return modelID;
}

stock n_CreateVehicle(modelID, Float: spawn_X, Float: spawn_Y, Float: spawn_Z, Float: z_Angle, color1, color2, respawn_Delay)
{
    if(color1 < 0 || color2 < 0)
    {
        color1 = random(127);
        color2 = random(127);
    }
    modelID = CreateVehicle(modelID, spawn_X, spawn_Y, spawn_Z, z_Angle, color1, color2, respawn_Delay);
    
    new
        localColorStrB[24]
    ;   
    format(localColorStrB, sizeof(localColorStrB), "%d-%d", color1, color2);
    setproperty(_, "", PROPERTY_OFFSET(modelID), localColorStrB);
    
    return modelID;
}

stock n_DestroyVehicle(vehicleID)
{
    deleteproperty(_, "", PROPERTY_OFFSET(vehicleID));
    
    return DestroyVehicle(vehicleID);
}

stock n_ChangeVehicleColor(vehicleID, color1, color2)
{
    new
        localColorStrChange[24]
    ;    
    format(localColorStrChange, sizeof(localColorStrChange), "%d-%d", color1, color2);
    setproperty(_, "", PROPERTY_OFFSET(vehicleID), localColorStrChange);

    return ChangeVehicleColours(vehicleID, color1, color2); // Use the updated function name
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
    new
        localColorStrE[24]
    ;   
    format(localColorStrE, sizeof(localColorStrE), "%d-%d", color1, color2);
    setproperty(_, "", PROPERTY_OFFSET(vehicleid), localColorStrE);
    
    if(funcidx("n_OnVehicleRespray") != -1)
    {
        return CallLocalFunction("n_OnVehicleRespray", "iiii", playerid, vehicleid, color1, color2);
    }
    return 1;
}

stock GetVehicleColor(vehicleID, &color1, &color2)
{
    vehicleID = PROPERTY_OFFSET(vehicleID);
    
    if(existproperty(_, "", vehicleID))
    {
        new
            localColorStr[24],
            strPos
        ;
        getproperty(_, "", vehicleID, localColorStr);
        strunpack(localColorStr, localColorStr);
        
        if((strPos = strfind(localColorStr, "-")) != -1)
        {
            color1 = strval(localColorStr);
            color2 = strval(localColorStr[strPos + 1]);
            return 1;
        }
    }
    return 0;
}

#define AddStaticVehicle n_AddStaticVehicle
#define AddStaticVehicleEx n_AddStaticVehicleEx
#define CreateVehicle n_CreateVehicle
#define DestroyVehicle n_DestroyVehicle
#define ChangeVehicleColor n_ChangeVehicleColor

#if defined _ALS_OnVehicleRespray
    #undef OnVehicleRespray
#else
    #define _ALS_OnVehicleRespray
#endif

#define OnVehicleRespray n_OnVehicleRespray

forward n_OnVehicleRespray(playerid, vehicleid, color1, color2);
