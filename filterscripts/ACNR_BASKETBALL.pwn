#pragma warning disable 213 //tag mismatch

#include <open.mp>

new HavingBall[MAX_PLAYERS];
new Anim[MAX_PLAYERS];
new Ball = INVALID_OBJECT_ID;
new BallStatus;
new Baller = INVALID_PLAYER_ID;
new ShootingBall;
new BallBounce;

#define NUM_BALL_LOCATIONS 5 // Number of ball locations

new Float:gBallLocations[NUM_BALL_LOCATIONS][3] = {
    {2782.3027, -2019.0826, 13.5547},   // Ball Spawn Location
    {2795.5237, -2019.6152, 13.5547},   // Under team A basket
    {2794.9612, -2019.5415, 15.5075},   // Team A basket
    {2768.3669, -2019.6644, 13.5547},   // Under team B basket
    {2768.6289, -2019.7227, 15.6287},   // Team B basket
};
/*
//LV LOCATIONS
new Float:gBallLocations[NUM_BALL_LOCATIONS][3] = {
    {2582.7990, 2447.7505, 12.0100},   // Ball Spawn Location
    {2565.0580, 2447.6960, 11.0400},   // Under team A basket
    {2565.0580, 2447.6960, 12.9600},   // Team A basket
    {2600.5400, 2447.8050, 11.0600},   // Under team B basket
    {2600.5400, 2447.8050, 12.9800},   // Team B basket
};
*/
public OnFilterScriptInit()
{
	Baller = INVALID_PLAYER_ID; // CHANGE IT TI INVALID_PLAYER_ID
	//DestroyObject(Ball); //on FilterScriptInit Ball is 0 and it will destroy object 0
	Ball = CreateObject(2114, gBallLocations[0][0], gBallLocations[0][1], gBallLocations[0][2]-0.8, 0, 0, 96); // 
	return 1;
}

public OnFilterScriptExit()
{
// destroy the ball
	return 1;
}

public OnObjectMoved(objectid)
{
    new i = Baller;
    if(ShootingBall == 2)
    {
		BallDown2(i);
		return 1;
    }
    else if(ShootingBall == 3)
    {
		BallDown3(i);
		return 1;
    }
    else if(ShootingBall == 4)
    {
		BallDown4(i);
		return 1;
    }
    else if(ShootingBall == 5)
    {
		BallDown5(i);
		return 1;
    }
    else if(ShootingBall == 6)
    {
        ApplyAnimation(i,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
		HavingBall[i] = 1;
		Anim[i] = 0;
    }
    if(BallBounce == 1)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z+1.2, 4);
	    BallBounce = 2;
	}
	else if(BallBounce == 2)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z-1.2, 4);
	    BallBounce = 3;
	}
	else if(BallBounce == 3)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z+0.8, 3);
	    BallBounce = 4;
	}
	else if(BallBounce == 4)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z-0.8, 3);
	    BallBounce = 5;
	}
	else if(BallBounce == 5)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z+0.5, 2);
	    BallBounce = 6;
	}
	else if(BallBounce == 6)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z-0.5, 2);
	    BallBounce = 7;
	}
	else if(BallBounce == 7)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z+0.2, 1);
	    BallBounce = 8;
	}
	else if(BallBounce == 8)
    {
        new Float:x, Float:y, Float:z;
	    GetObjectPos(Ball, x, y, z);
	    MoveObject(Ball, x, y, z-0.2, 1);
	    BallBounce = 0;
	}
    if(!HavingBall[i]) return 1;
	new Keys, ud, lr;
	GetPlayerKeys(i, Keys, ud, lr);
    if(Anim[i])
    {
        switch(BallStatus)
	    {
			case 0:
			{
				BallStatus = 1;
				new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x, y, z);
				StopObject(Ball);
				new Float:x2, Float:y2;
		 	    GetXYInFrontOfPlayer(i, x2, y2, 0.4);
				MoveObject(Ball, x2, y2, z+0.1, 5.5);
			}
			case 1:
			{
        		BallStatus = 0;
        		new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x, y, z);
				StopObject(Ball);
				new Float:x2, Float:y2;
				GetXYInFrontOfPlayer(i, x2, y2, 0.4);
				MoveObject(Ball, x2, y2, z-0.8, 5.5);
			}
		}
		return 1;
    }
    if(Keys & KEY_SPRINT)
	{
        ApplyAnimation(i,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1);
        switch(BallStatus)
		{
			case 0:
			{
				BallStatus = 1;
				new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x, y, z);
				StopObject(Ball);
				new Float:x2, Float:y2;
		        GetXYInFrontOfPlayer(i, x2, y2, 1.5);
				MoveObject(Ball, x2, y2, z+0.1, 8);
			}
			case 1:
			{
        		BallStatus = 0;
        		new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x, y, z);
				StopObject(Ball);
				new Float:x2, Float:y2;
				GetXYInFrontOfPlayer(i, x2, y2, 1.5);
				MoveObject(Ball, x2, y2, z-0.8, 8);
			}
		}
		return 1;
    }
    else
    {
        ApplyAnimation(i,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
    }
	switch(BallStatus)
	{
		case 0:
		{
			BallStatus = 1;
			new Float:x, Float:y, Float:z;
			GetPlayerPos(i, x, y, z);
			StopObject(Ball);
			new Float:x2, Float:y2;
		    GetXYInFrontOfPlayer(i, x2, y2, 1.2);
			MoveObject(Ball, x2, y2, z+0.1, 5);
		}
		case 1:
		{
        	BallStatus = 0;
        	new Float:x, Float:y, Float:z;
			GetPlayerPos(i, x, y, z);
			StopObject(Ball);
			new Float:x2, Float:y2;
			GetXYInFrontOfPlayer(i, x2, y2, 1.2);
			MoveObject(Ball, x2, y2, z-0.8, 5);
		}
	}
    return 1;
}
/*
public OnPlayerConnect(playerid)
{
	return 1;
}
*/
public OnPlayerDisconnect(playerid, reason)
{
    HavingBall[playerid] = 0;
    Anim[playerid] = 0;
    if(HavingBall[playerid]) Baller = INVALID_PLAYER_ID;
	return 1;
}

public OnPlayerDeath(playerid, killerid, WEAPON:reason)
{
    HavingBall[playerid] = 0;
    if(HavingBall[playerid]) Baller = INVALID_PLAYER_ID;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/ball", cmdtext, true, 6) == 0)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		DestroyObject(Ball);
		Ball = CreateObject(2114, x+random(3), y+random(3), z-0.8, 0, 0, 96);
		return 1;
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    if ((newkeys & KEY_CROUCH) && !(oldkeys & KEY_CROUCH) && !IsPlayerInAnyVehicle(playerid))
	{
		if(HavingBall[playerid])
		{
            ApplyAnimation(playerid,"BSKTBALL","BBALL_idleloop",4.1,1,1,1,1,1);
		}
		else
		{
            ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
		}
		Anim[playerid] = 1;
	}
	if (!(newkeys & KEY_CROUCH) && (oldkeys & KEY_CROUCH) && !IsPlayerInAnyVehicle(playerid))
	{
		ClearAnimations(playerid);
		Anim[playerid] = 0;
	}
	if(newkeys & KEY_FIRE && !IsPlayerInAnyVehicle(playerid))
	{
        if(!HavingBall[playerid])
		{
			new Float:x, Float:y, Float:z;
			GetObjectPos(Ball, x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z))
			{
				HavingBall[playerid] = 1;
				ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
				if(Baller != INVALID_PLAYER_ID)
				{
					HavingBall[Baller] = 0;
					ClearAnimations(Baller);
					ApplyAnimation(Baller, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
				}
				Baller = playerid;
				BallStatus = 1;
				new Float:x2, Float:y2;
				GetXYInFrontOfPlayer(playerid, x2, y2, 0.8);
				GetPlayerPos(playerid, x, y, z);
				StopObject(Ball);
				MoveObject(Ball, x2, y2, z, 2.5);
				Anim[playerid] = 0;
				BallBounce = 0;
			}
		}
		else
		{
            if(IsPlayerInRangeOfPoint(playerid, 2, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]))
			{
				MoveObject(Ball, gBallLocations[2][0], gBallLocations[2][1], gBallLocations[2][2], 7.5);
				SetPlayerPos(playerid, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
				HavingBall[playerid] = 0;
				SetTimerEx("ClearAnim", 1100, 0, "d", playerid);
				SetTimerEx("BallDown2", 1100, 0, "d", playerid);
				return 1;
			}
            else if(IsPlayerInRangeOfPoint(playerid, 4, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]) && IsPlayerFacingPoint(playerid, 20, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]))
			{
				new rand = random(1);
				if(rand == 0)
				{
					MoveObject(Ball, gBallLocations[2][0], gBallLocations[2][1], gBallLocations[2][2], 10.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid);
				return 1;
			}
            else if(IsPlayerInRangeOfPoint(playerid, 7, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]) && IsPlayerFacingPoint(playerid, 20, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]))
			{
				new rand = random(2);
				if(rand == 0)
				{
					MoveObject(Ball, gBallLocations[2][0], gBallLocations[2][1], gBallLocations[2][2], 11.0+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 10, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]) && IsPlayerFacingPoint(playerid, 20, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]))
			{
				new rand = random(3);
				if(rand == 0)
				{
					MoveObject(Ball, gBallLocations[2][0], gBallLocations[2][1], gBallLocations[2][2], 11.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]))
			{
				MoveObject(Ball, gBallLocations[4][0], gBallLocations[4][1], gBallLocations[4][2], 7.5);
				SetPlayerPos(playerid, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
				HavingBall[playerid] = 0;
				SetTimerEx("ClearAnim", 800, 0, "d", playerid);
				SetTimerEx("BallDown3", 1100, 0, "d", playerid);
				return 1;
			}
            else if(IsPlayerInRangeOfPoint(playerid, 4, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]) && IsPlayerFacingPoint(playerid, 20, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]))
			{
				new rand = random(1);
				if(rand == 0)
				{
					MoveObject(Ball, gBallLocations[4][0], gBallLocations[4][1], gBallLocations[4][2], 10.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid);
				return 1;
			}
            else if(IsPlayerInRangeOfPoint(playerid, 7, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]) && IsPlayerFacingPoint(playerid, 20, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]))
			{
				new rand = random(2);
				if(rand == 0)
				{
					MoveObject(Ball, gBallLocations[4][0], gBallLocations[4][1], gBallLocations[4][2], 11.0+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 10, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]) && IsPlayerFacingPoint(playerid, 20, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]))
			{
				new rand = random(3);
				if(rand == 0)
				{
					MoveObject(Ball, gBallLocations[4][0], gBallLocations[4][1], gBallLocations[4][2], 11.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
                ShootMiss2(playerid);
				return 1;
			}
			for(new i; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(IsPlayerFacingPlayer(playerid, i, 15))
					{
						new Float:x, Float:y, Float:z;
						GetPlayerPos(i, x, y, z);
						if(IsPlayerInRangeOfPoint(playerid, 20.0, x, y, z))
						{
							Baller = i;
							HavingBall[playerid] = 0;
							ClearAnimations(playerid);
							ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
							SetTimerEx("ClearAnim", 700, 0, "d", playerid);
							MoveObject(Ball, x, y, z, 13+random(4));
							Anim[i] = 0;
							ShootingBall = 6;
							ApplyAnimation(i,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
							return 1;
						}
					}
				}
			}
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			HavingBall[playerid] = 0;
			new Float:x2, Float:y2;
			GetXYInFrontOfPlayer(playerid, x2, y2, 6.0);
			SetTimerEx("BallDown", 600, 0, "df", playerid, z);
			MoveObject(Ball, x2, y2, z+random(8)+3, 10.0+random(4));
			ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
			ShootingBall = 0;
		}
	}
	return 1;
}

stock IsPlayerFacingPoint(playerid, Float:dOffset, Float:pX, Float:pY, Float:pZ)
{
	#pragma unused pZ
	new
		Float:X,
		Float:Y,
		Float:Z,
		Float:pA,
		Float:ang;

	if(!IsPlayerConnected(playerid)) return 0;

	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, pA);

	if( Y > pY ) ang = (-acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);
	else if( Y < pY && X < pX ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 450.0);
	else if( Y < pY ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);

	if(AngleInRangeOfAngle(-ang, pA, dOffset)) return true;

	return false;

}

stock IsPlayerFacingPlayer(playerid, targetid, Float:dOffset)
{

	new
		Float:pX,
		Float:pY,
		Float:pZ,
		Float:pA,
		Float:X,
		Float:Y,
		Float:Z,
		Float:ang;

	if(!IsPlayerConnected(playerid) || !IsPlayerConnected(targetid)) return 0;

	GetPlayerPos(targetid, pX, pY, pZ);
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, pA);

	if( Y > pY ) ang = (-acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);
	else if( Y < pY && X < pX ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 450.0);
	else if( Y < pY ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);

	if(AngleInRangeOfAngle(-ang, pA, dOffset)) return true;

	return false;

}

stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range)
{

	a1 -= a2;
	if((a1 < range) && (a1 > -range)) return true;

	return false;

}

forward BallDown(playerid, Float:oldz);
public BallDown(playerid, Float:oldz)
{
    new Float:x, Float:y, Float:z;
	GetObjectPos(Ball, x, y, z);
	new Float:a;
	new Float:x2, Float:y2;
	GetPlayerPos(playerid, x2, y2, a);
	GetPlayerFacingAngle(playerid, a);
	x2 += (16 * floatsin(-a, degrees));
	y2 += (16 * floatcos(-a, degrees));
	MoveObject(Ball, x2, y2, oldz-0.8, 10.0+random(3));
	Baller = INVALID_PLAYER_ID;
	ShootingBall = 0;
	BallBounce = 1;
	return 1;
}

forward BallDown2(playerid);
public BallDown2(playerid)
{
	MoveObject(Ball, gBallLocations[1][0], gBallLocations[1][1], gBallLocations[1][2]-0.8, 10.0+random(3));
	Baller = INVALID_PLAYER_ID;
	ShootingBall = 0;
	GameTextForPlayer(playerid, "Goal :D!", 3000, 3);
	BallBounce = 1;
	return 1;
}

forward BallDown3(playerid);
public BallDown3(playerid)
{
	MoveObject(Ball, gBallLocations[3][0], gBallLocations[3][1], gBallLocations[3][2]-0.8, 10.0+random(3));
	Baller = INVALID_PLAYER_ID;
	ShootingBall = 0;
	GameTextForPlayer(playerid, "Goal :D!", 3000, 3);
	BallBounce = 1;
	return 1;
}

forward BallDown4(playerid);
public BallDown4(playerid)
{
	MoveObject(Ball, gBallLocations[1][0]+random(5),gBallLocations[1][1]+random(5),gBallLocations[1][2]-0.8, 10.0+random(3));
	Baller = INVALID_PLAYER_ID;
	ShootingBall = 0;
	GameTextForPlayer(playerid, "Missed :(!", 3000, 3);
	BallBounce = 1;
	return 1;
}

forward BallDown5(playerid);
public BallDown5(playerid)
{
	MoveObject(Ball, gBallLocations[3][0] + random(5), gBallLocations[3][1] + random(5), gBallLocations[3][2] - 0.8, 10.0 + random(3));
	Baller = INVALID_PLAYER_ID;
	ShootingBall = 0;
	GameTextForPlayer(playerid, "Missed :(!", 3000, 3);
	BallBounce = 1;
	return 1;
}

forward ShootMiss(playerid);
public ShootMiss(playerid)
{
	MoveObject(Ball, gBallLocations[2][0] + random(2), gBallLocations[2][1] + random(2), gBallLocations[2][2] + random(2), 12.5 + random(4));
	ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
	ShootingBall = 4;
	HavingBall[playerid] = 0;
	return 1;
}

forward ShootMiss2(playerid);
public ShootMiss2(playerid)
{
	MoveObject(Ball, gBallLocations[4][0] + random(2), gBallLocations[4][1] + random(2), gBallLocations[4][2] + random(2), 12.5 + random(4));
	ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
	ShootingBall = 5;
	HavingBall[playerid] = 0;
	return 1;
}

forward ClearAnim(playerid);
public ClearAnim(playerid)
{
	ClearAnimations(playerid);
	return 1;
}

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid))
	{
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}