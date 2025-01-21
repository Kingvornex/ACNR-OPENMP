//[ISS]jumbo ((Subwoofer On Elegy!))

#include <a_samp>
#define RED  0xF40B74FF
new Sub[6];
new bool:openclose[MAX_PLAYERS]=false;
new engine,lights,alarm,doors,bonnet,boot,objective;

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Subwoofer On Elegy loaded! by [ISS]jumbo");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	print("\n--------------------------------------");
	print(" Subwoofer On Elegy unloaded! by [ISS]jumbo");
	print("--------------------------------------\n");
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp("/subwoofer", cmdtext, true))
    {
    	if(IsAElegy(GetPlayerVehicleID(playerid)))
        {
            ShowPlayerDialog(playerid,7212,DIALOG_STYLE_LIST,"{FFFFFF}Subwoofer Elegy system by [ISS]jumbo","{008000}Super Subwoofer\
			\n{008000}Medium Subwoofer\
			\n{008000}Normal Subwoofer\
			\n{008000}Subwoofer\
			\n{008000}Small subwoofer\
			\n{800080}Remove Subwoofer\
			\n{FF0000}Open/close boot","Accept","Cancel");
        }
		else return SendClientMessage(playerid,RED,"You must be an elegy in to add a subwoofer!");
		return 1;
    }
	return 0;
}
stock IsAElegy(vehicleid)
{
	new result;
	new model = GetVehicleModel(vehicleid);
    switch(model)
    {
        case 562: result = model;
        default: result = 0;
    }
	return result;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 7212)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0://super subwoofer
	            {
             		//DestroyObject(Sub[0]);
	                DestroyObject(Sub[1]);
	                DestroyObject(Sub[2]);
	                DestroyObject(Sub[3]);
	                DestroyObject(Sub[4]);
	                DestroyObject(Sub[5]);
	                Sub[0] = CreateObject(2232,0,0,0,0,0,0);
	                AttachObjectToVehicle(Sub[0], GetPlayerVehicleID(playerid), 0.025002, -1.729998, -0.020000, -74.369995, 87.133476, -3.015000);
					SendClientMessage(playerid,RED,"Subwoofer {FF0000}Added");
	            }
	            case 1://medium subwoofer
				{
    				DestroyObject(Sub[0]);
	                //DestroyObject(Sub[1]);
	                //DestroyObject(Sub[2]);
	                DestroyObject(Sub[3]);
	                DestroyObject(Sub[4]);
	                DestroyObject(Sub[5]);
				    Sub[1] = CreateObject(2231,0,0,0,0,0,0);
				    Sub[2] = CreateObject(2231,0,0,0,0,0,0);
				    AttachObjectToVehicle(Sub[1], GetPlayerVehicleID(playerid), -0.039997, -2.190002, -0.229999, -85.424964, 84.419967, -6.030000);
					AttachObjectToVehicle(Sub[2], GetPlayerVehicleID(playerid), -0.829996, -2.190002, -0.229999, -85.424964, 84.419967, -6.030000);
					SendClientMessage(playerid,RED,"Subwoofer {FF0000}Added");
				}
				case 2://normal subwoofer
				{
					DestroyObject(Sub[0]);
	                DestroyObject(Sub[1]);
	                DestroyObject(Sub[2]);
	                //DestroyObject(Sub[3]);
	                DestroyObject(Sub[4]);
	                DestroyObject(Sub[5]);
				    Sub[3] = CreateObject(2230,0,0,0,0,0,0);
				    AttachObjectToVehicle(Sub[3], GetPlayerVehicleID(playerid), -0.664996, -2.190002, -0.229999, -85.424964, 84.419967, -6.030000);
				    SendClientMessage(playerid,RED,"Subwoofer {FF0000}Added");
				}
				case 3://sub1
				{
					DestroyObject(Sub[0]);
	                DestroyObject(Sub[1]);
	                DestroyObject(Sub[2]);
	                DestroyObject(Sub[3]);
	                //DestroyObject(Sub[4]);
	                DestroyObject(Sub[5]);
				    Sub[4] = CreateObject(2229,0,0,0,0,0,0);
				    AttachObjectToVehicle(Sub[4], GetPlayerVehicleID(playerid), -0.649996, -2.190002, -0.229999, -85.424964, 84.419967, -6.030000);
				    SendClientMessage(playerid,RED,"Subwoofer {FF0000}Added");
				}
				case 4://sub 2
				{
					DestroyObject(Sub[0]);
	                DestroyObject(Sub[1]);
	                DestroyObject(Sub[2]);
	                DestroyObject(Sub[3]);
	                DestroyObject(Sub[4]);
	                //DestroyObject(Sub[5]);
				    Sub[5] = CreateObject(1840,0,0,0,0,0,0);
				    AttachObjectToVehicle(Sub[5], GetPlayerVehicleID(playerid), -0.264997, -1.639998, 0.105000, 29.144989, 89.444953, 0.000000);
				    SendClientMessage(playerid,RED,"Subwoofer {FF0000}Added");
				}
	            case 5:
	            {
	                DestroyObject(Sub[0]);
	                DestroyObject(Sub[1]);
	                DestroyObject(Sub[2]);
	                DestroyObject(Sub[3]);
	                DestroyObject(Sub[4]);
	                DestroyObject(Sub[5]);
					SendClientMessage(playerid,RED,"Subwoofer {FF0000}Deleted");
	            }
	            case 6:
	            {
	                if(openclose[playerid] == false)
	                {
						GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
						SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,1,objective);
						openclose[playerid] = true;
						SendClientMessage(playerid,RED,"boot {FF0000}open");
					}
					else if(openclose[playerid] == true)
					{
						GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
						SetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,0,objective);
						openclose[playerid] = false;
						SendClientMessage(playerid,RED,"boot {FF0000}Closed");
					}
	            }
	        }
     	}
	}
	return 1;
}
//
//



