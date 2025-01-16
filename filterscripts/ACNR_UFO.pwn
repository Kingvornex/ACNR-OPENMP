
// ACNR UFO

//=========================[Includes]=========================//
#include <open.mp>
#include <streamer>
// Debug
#include <izcmd>
//==========================[Colors]=========================//
#define blue 0x00D7FFFF
//=========================[Forwards]========================//
forward MoveUfo();
//===========================[Defines]============================//
#define THE_MOVE_SPEED 20
//==========================[News]===========================//
new ufo1;
new ufo2;
//=============================================================
#define Loop(%0,%1) for(new %0 = 0; %0 < %1; %0++)

#define UFO_PTS 22

new Float:UFORP[UFO_PTS][3] = {
{-1460.199829, -943.961182, 219.348648}, //1
{-1506.5603, -236.6437, 41.9595},
{-2044.7471, -159.6864, 57.0575},
{-2341.4648, 101.5890, 87.7887},
{-2256.6025, 667.1548, 87.3680},
{-2260.5229, 1228.8458, 101.8017},
{-2435.4058, 2393.3794, 61.7521},
{-1484.6387, 2604.9680, 99.6378},
{-279.8146, 2676.7722, 99.6378},
{252.2976, 2499.8521, 23.1104},
{1331.4113, 2147.8853, 48.7490},
{2068.9707, 2025.3483, 48.7490},
{2313.0459, 1476.3765, 67.6918},
{2060.1272, 889.8865, 67.6918},
{2287.6528, 58.8603, 67.6918},
{2973.0452, -635.7138, 55.1626},
{2839.8010, -1622.6360, 54.2983},
{1901.5543, -1403.1490, 71.2907},
{1559.9883, -1610.8218, 71.2907},
{885.0158, -1095.3879, 71.2907},
{161.9016, -1533.5796, 71.2907},
{-2299.3914, -1655.8417, 495.0936} //22
};

//new currentP;
new nextP;
//===========================================================//

public OnFilterScriptInit()
{     
	printf("||===============||");
    printf("||===============||");
    printf("||= UFO /UFOloc =||");
    printf("||===============||");
    printf("||===============||");

	ufo1 = CreateDynamicObject(13607, -1460.199829, -943.961182, 219.348648, 0.0000, 0.0000, 0.0000);
	ufo2 = CreateDynamicObject(13607, -1460.167114, -944.012512, 206.879150, 179.6226, 0.0000, 0.0000);
	AttachDynamicObjectToObject(ufo2, ufo1, 0.0, 0.0, -13.0, 180.0, 0.0, 0.0, 1);
	SetTimer("MoveUfo", 1, true);
	return 1;
}

public OnFilterScriptExit()
{
	DestroyDynamicObject(ufo1);
	DestroyDynamicObject(ufo2);
	return 1;
}

public MoveUfo()
{
	new Float:X, Float:Y, Float:Z;
	GetDynamicObjectPos(ufo1, X, Y, Z);
    Loop(i, UFO_PTS)
    {
        if(X == UFORP[i][0] && Y == UFORP[i][1] && Z == UFORP[i][2])
        {
            new n = i + 1;
			if( n >= UFO_PTS) { n = 0; }
            MoveDynamicObject(ufo1, UFORP[n][0], UFORP[n][1], Float:UFORP[n][2], THE_MOVE_SPEED);
            //currentP = 22;
            nextP = n;
            break;
        }
    }
    return 1;
}
/*
public MoveUfo()
{
	new Float:X, Float:Y, Float:Z;
	GetDynamicObjectPos(ufo1, X, Y, Z);
	if(X == -1460.199829 && Y == -943.961182 && Z == 219.348648)//1
	{
		MoveDynamicObject(ufo1,-1506.5603,-236.6437,41.9595,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-1506.5603,-236.6437,28.9595,THE_MOVE_SPEED);
		//currentP = 22;
		nextP = 1;
	}
	else if(X == -1506.5603 && Y == -236.6437 && Z == 41.9595)//2
	{
		MoveDynamicObject(ufo1,-2044.7471,-159.6864,57.0575,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-2044.7471,-159.6864,44.0575,THE_MOVE_SPEED);
		//currentP = 1;
		nextP = 2;
	}
	else if(X == -2044.7471 && Y == -159.6864 && Z == 57.0575)//3
	{
		MoveDynamicObject(ufo1,-2341.4648,101.5890,87.7887,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-2341.4648,101.5890,74.0575,THE_MOVE_SPEED);
		//currentP = 2;
		nextP = 3;
	}
	else if(X == -2341.4648 && Y == 101.5890 && Z == 87.7887)//4
	{
		MoveDynamicObject(ufo1,-2256.6025,667.1548,87.3680,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-2256.6025,667.1548,74.3680,THE_MOVE_SPEED);
		//currentP = 3;
		nextP = 4;
	}
	else if(X == -2256.6025 && Y == 667.1548 && Z == 87.3680)//5
	{
		MoveDynamicObject(ufo1,-2260.5229,1228.8458,101.8017,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-2260.5229,1228.8458,88.8017,THE_MOVE_SPEED);
		//currentP = 4;
		nextP = 5;
	}
	else if(X == -2260.5229 && Y == 1228.8458 && Z == 101.8017)//6
	{
		MoveDynamicObject(ufo1,-2435.4058,2393.3794,61.7521,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-2435.4058,2393.3794,48.7521,THE_MOVE_SPEED);
		//currentP = 5;
		nextP = 6;
	}
	else if(X == -2435.4058 && Y == 2393.3794 && Z == 61.7521)//7
	{
		MoveDynamicObject(ufo1,-1484.6387,2604.9680,99.6378,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-1484.6387,2604.9680,86.6378,THE_MOVE_SPEED);
		//currentP = 6;
		nextP = 7;
	}
	else if(X == -1484.6387 && Y == 2604.9680 && Z == 99.6378)//8
	{
		MoveDynamicObject(ufo1,-279.8146,2676.7722,99.6378,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-279.8146,2676.7722,86.6378,THE_MOVE_SPEED);
		//currentP = 7;
		nextP = 8;
	}
	else if(X == -279.8146 && Y == 2676.7722 && Z == 99.6378)//9
	{
		MoveDynamicObject(ufo1,252.2976,2499.8521,23.1104,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,252.2976,2499.8521,10.1104,THE_MOVE_SPEED);
		//currentP = 9;
		nextP = 10;
	}
	else if(X == 252.2976 && Y == 2499.8521 && Z == 23.1104)//10
	{
		MoveDynamicObject(ufo1,1331.4113,2147.8853,48.7490,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,1331.4113,2147.8853,48.7490,THE_MOVE_SPEED);
		//currentP = 10;
		nextP = 11;
	}
	else if(X == 1331.4113 && Y == 2147.8853 && Z == 48.7490)//11
	{
		MoveDynamicObject(ufo1,2068.9707,2025.3483,48.7490,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,2068.9707,2025.3483,35.7490,THE_MOVE_SPEED);
		//currentP = 11;
		nextP = 12;
	}
	else if(X == 2068.9707 && Y == 2025.3483 && Z == 48.7490)//12
	{
		MoveDynamicObject(ufo1,2313.0459,1476.3765,67.6918,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,2313.0459,1476.3765,54.6918,THE_MOVE_SPEED);
		//currentP = 12;
		nextP = 13;
	}
	else if(X == 2313.0459 && Y == 1476.3765 && Z == 67.6918)//13
	{
		MoveDynamicObject(ufo1,2060.1272,889.8865,67.6918,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,2060.1272,889.8865,54.6918,THE_MOVE_SPEED);
		//currentP = 13;
		nextP = 14;
	}
	else if(X == 2060.1272 && Y == 889.8865 && Z == 67.6918)//14
	{
		MoveDynamicObject(ufo1,2287.6528,58.8603,67.6918,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,2287.6528,58.8603,54.6918,THE_MOVE_SPEED);
		//currentP = 14;
		nextP = 15;
	}
	else if(X == 2287.6528 && Y == 58.8603 && Z == 67.6918)//15
	{
		MoveDynamicObject(ufo1,2973.0452,-635.7138,55.1626,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,2973.0452,-635.7138,42.1626,THE_MOVE_SPEED);
		//currentP = 15;
		nextP = 16;
	}
	else if(X == 2973.0452 && Y == -635.7138 && Z == 55.1626)//16
	{
		MoveDynamicObject(ufo1,2839.8010,-1622.6360,54.2983,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,2839.8010,-1622.6360,41.2983,THE_MOVE_SPEED);
		//currentP = 16;
		nextP = 17;
	}
	else if(X == 2839.8010 && Y == -1622.6360 && Z == 54.2983)//17
	{
		MoveDynamicObject(ufo1,1901.5543,-1403.1490,71.2907,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,1901.5543,-1403.1490,58.2907,THE_MOVE_SPEED);
		//currentP = 17;
		nextP = 18;
	}
	else if(X == 1901.5543 && Y == -1403.1490 && Z == 71.2907)//18
	{
		MoveDynamicObject(ufo1,1559.9883,-1610.8218,71.2907,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,1559.9883,-1610.8218,58.2907,THE_MOVE_SPEED);
		//currentP = 18;
		nextP = 19;
	}
	else if(X == 1559.9883 && Y == -1610.8218 && Z == 71.2907)//19
	{
		MoveDynamicObject(ufo1,885.0158,-1095.3879,71.2907,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,885.0158,-1095.3879,58.2907,THE_MOVE_SPEED);
		//currentP = 19;
		nextP = 20;
	}
	else if(X == 885.0158 && Y == -1095.3879 && Z == 71.2907)//20
	{
		MoveDynamicObject(ufo1,161.9016,-1533.5796,71.2907,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,161.9016,-1533.5796,58.2907,THE_MOVE_SPEED);
		//currentP = 20;
		nextP = 21;
	}
	else if(X == 161.9016 && Y == -1533.5796 && Z == 71.2907)//21
	{
		MoveDynamicObject(ufo1,-2299.3914,-1655.8417,495.0936,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-2299.3914,-1655.8417,482.0936,THE_MOVE_SPEED);
		//currentP = 21;
		nextP = 22;
	}
	else if(X == -2299.3914 && Y == -1655.8417 && Z == 495.0936)//22
	{
		MoveDynamicObject(ufo1,-1460.199829,-943.961182, 219.348648,THE_MOVE_SPEED);
		//MoveDynamicObject(ufo2,-1460.167114, -944.012512, 206.879150,THE_MOVE_SPEED);
		//currentP = 22;
		nextP = 1;
	}
	return 1;
}
*/
// Debug
CMD:ufoloc(playerid, params[])
{
	//if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, -1, "Not Admin");
	new Float:X, Float:Y, Float:Z;
	GetDynamicObjectPos(ufo1, X, Y, Z);
	DisablePlayerCheckpoint(playerid);
	new Float:PX, Float:PY, Float:PZ;
	GetPlayerPos(playerid, PX, PY, PZ);
	//PlayerPlaySound(playerid, 1149, 0.0, 0.0, 0.0);
	PlayerPlaySound(playerid, 1149, PX, PY, PZ);
	SetPlayerRaceCheckpoint(playerid, CP_TYPE_GROUND_NORMAL, X, Y, Z, UFORP[nextP][0], UFORP[nextP][1], UFORP[nextP][2], 10.0);
	//SetPlayerCheckpoint(playerid, X, Y, Z, 10.0);
	return 1;
}