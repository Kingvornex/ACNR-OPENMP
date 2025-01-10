
// ISLAND MAP

#define FILTERSCRIPT

#include <open.mp>
#include <streamer>

public OnFilterScriptInit()
{
	printf(" ");
	printf("|===========================================|");
	printf("|=============== ISLAND MAP! ===============|");
	printf("|===========================================|");
	printf(" ");
	
	new g_DynamicObject[56];
	new g_Vehicle[3];
	new g_Pickup[2];
	new g_DynamicActor[10];
	g_DynamicObject[0] = CreateDynamicObject(1492, 2173.7607, 490.9059, 8.8661, 0.0000, 0.0000, 55.4999); //Gen_doorINT02
	SetDynamicObjectMaterial(g_DynamicObject[0], 1, 10778, "airportcpark_sfse", "vgsclubdoor02_128", 0xFFFFFFFF);
	g_DynamicObject[1] = CreateDynamicObject(1713, 2176.0095, 492.2947, 8.8663, 0.0000, 0.0000, 57.7000); //kb_couch04
	g_DynamicObject[2] = CreateDynamicObject(18751, 2181.1218, 481.4277, 1.8344, 0.0000, 0.0000, -49.9995); //IslandBase1
	SetDynamicObjectMaterial(g_DynamicObject[2], 0, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[2], 1, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[2], 2, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[2], 3, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	g_DynamicObject[3] = CreateDynamicObject(18751, 2181.1218, 481.4277, 2.4446, 0.0000, 0.0000, 0.0000); //IslandBase1
	SetDynamicObjectMaterial(g_DynamicObject[3], 0, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[3], 1, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[3], 2, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[3], 3, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	g_DynamicObject[4] = CreateDynamicObject(18225, 2188.8020, 517.5869, -16.7273, -21.7999, 0.0000, 21.1000); //cunt_rockgp2_18
	SetDynamicObjectMaterial(g_DynamicObject[4], 0, 16175, "des2vegas_join", "vgs_rockmid1a", 0xFFFFFFFF);
	g_DynamicObject[5] = CreateDynamicObject(621, 2160.9846, 471.2495, 5.9503, 0.0000, 0.0000, 0.0000); //veg_palm02
	g_DynamicObject[6] = CreateDynamicObject(621, 2160.9846, 507.7994, 4.4102, 0.0000, 0.0000, -160.6999); //veg_palm02
	g_DynamicObject[7] = CreateDynamicObject(2041, 2056.8105, 360.3481, 23.7003, 0.0000, 18.0998, 1.4998); //AMMO_BOX_M2
	g_DynamicObject[8] = CreateDynamicObject(621, 2130.8454, 481.9765, 3.4203, 0.0000, 0.0000, -160.6999); //veg_palm02
	g_DynamicObject[9] = CreateDynamicObject(622, 2168.9079, 425.3687, 1.0405, 0.0000, 0.0000, 159.1999); //veg_palm03
	g_DynamicObject[10] = CreateDynamicObject(622, 2206.7395, 433.4674, 0.9904, 0.0000, 0.0000, -171.3997); //veg_palm03
	g_DynamicObject[11] = CreateDynamicObject(622, 2224.8596, 461.3142, 0.7304, 0.0000, 0.0000, -101.1996); //veg_palm03
	g_DynamicObject[12] = CreateDynamicObject(622, 2236.8029, 490.6752, -0.0293, 0.0000, 0.0000, -74.1996); //veg_palm03
	g_DynamicObject[13] = CreateDynamicObject(622, 2222.9514, 518.9398, 0.2506, 0.0000, 0.0000, -52.5998); //veg_palm03
	g_DynamicObject[14] = CreateDynamicObject(622, 2198.5561, 526.7470, -0.1093, 0.0000, 0.0000, -34.5998); //veg_palm03
	g_DynamicObject[15] = CreateDynamicObject(622, 2172.6137, 541.3748, -0.2090, 0.0000, 0.0000, 71.5998); //veg_palm03
	g_DynamicObject[16] = CreateDynamicObject(622, 2146.2500, 522.2276, -1.0290, 0.0000, 0.0000, 71.5998); //veg_palm03
	g_DynamicObject[17] = CreateDynamicObject(622, 2123.2165, 491.0161, -0.8292, 0.0000, 0.0000, 71.5998); //veg_palm03
	g_DynamicObject[18] = CreateDynamicObject(622, 2133.3261, 462.3121, 1.0204, 0.0000, 0.0000, 121.4001); //veg_palm03
	g_DynamicObject[19] = CreateDynamicObject(621, 2200.2487, 450.1000, 4.2203, 0.0000, 0.0000, 0.0000); //veg_palm02
	g_DynamicObject[20] = CreateDynamicObject(621, 2165.7294, 442.6900, 2.8001, 0.0000, 0.0000, 0.0000); //veg_palm02
	g_DynamicObject[21] = CreateDynamicObject(621, 2209.9218, 477.3298, 4.4903, 0.0000, 0.0000, 0.0000); //veg_palm02
	g_DynamicObject[22] = CreateDynamicObject(17068, 2129.2314, 513.1724, 0.8787, 0.0000, 0.0000, -86.0998); //xjetty01
	g_DynamicObject[23] = CreateDynamicObject(18225, 2183.2331, 474.5238, -13.9088, -21.7999, 0.0000, -99.0000); //cunt_rockgp2_18
	SetDynamicObjectMaterial(g_DynamicObject[23], 0, 16175, "des2vegas_join", "vgs_rockmid1a", 0xFFFFFFFF);
	g_DynamicObject[24] = CreateDynamicObject(19466, 2176.7526, 495.4602, 10.9525, 0.0000, 0.0000, -34.2000); //window001
	SetDynamicObjectMaterial(g_DynamicObject[24], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[25] = CreateDynamicObject(18259, 2178.5629, 488.8659, 8.7875, 0.0000, 0.0000, -36.7997); //logcabinn01
	SetDynamicObjectMaterial(g_DynamicObject[25], 0, 12862, "sw_block03", "sw_woodwall1", 0xFF9F9D94);
	SetDynamicObjectMaterial(g_DynamicObject[25], 1, 1453, "break_farm", "CJ_HAY", 0xFFFFFFFF);
	g_DynamicObject[26] = CreateDynamicObject(2404, 2144.0847, 506.3255, 4.1714, 0.0000, 0.0000, 0.0000); //CJ_SURF_BOARD
	g_DynamicObject[27] = CreateDynamicObject(19466, 2171.0310, 487.0690, 10.9525, 0.0000, 0.0000, -34.2000); //window001
	SetDynamicObjectMaterial(g_DynamicObject[27], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[28] = CreateDynamicObject(19466, 2179.6499, 481.2308, 10.9525, 0.0000, 0.0000, -34.2999); //window001
	SetDynamicObjectMaterial(g_DynamicObject[28], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[29] = CreateDynamicObject(2405, 2145.5827, 504.6748, 4.2754, 0.0000, 0.0000, -48.4000); //CJ_SURF_BOARD2
	g_DynamicObject[30] = CreateDynamicObject(2406, 2144.0847, 503.9902, 4.1661, 0.0000, 0.0000, 0.0000); //CJ_SURF_BOARD3
	g_DynamicObject[31] = CreateDynamicObject(18751, 2181.1218, 481.4277, 2.4446, 0.0000, 0.0000, -125.0997); //IslandBase1
	SetDynamicObjectMaterial(g_DynamicObject[31], 0, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[31], 1, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[31], 2, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	SetDynamicObjectMaterial(g_DynamicObject[31], 3, 16093, "a51_ext", "des_dirt1", 0xFFFFFFFF);
	g_DynamicObject[32] = CreateDynamicObject(19466, 2185.3588, 489.6072, 10.9525, 0.0000, 0.0000, -34.2999); //window001
	SetDynamicObjectMaterial(g_DynamicObject[32], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[33] = CreateDynamicObject(19466, 2184.5000, 493.6953, 11.0128, 0.0000, 0.0000, 55.7999); //window001
	SetDynamicObjectMaterial(g_DynamicObject[33], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[34] = CreateDynamicObject(19466, 2180.8095, 496.2239, 11.0128, 0.0000, 0.0000, 55.7999); //window001
	SetDynamicObjectMaterial(g_DynamicObject[34], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[35] = CreateDynamicObject(19466, 2171.3232, 482.2554, 11.0128, 0.0000, 0.0000, 55.7999); //window001
	SetDynamicObjectMaterial(g_DynamicObject[35], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[36] = CreateDynamicObject(19466, 2174.9755, 479.7835, 11.0128, 0.0000, 0.0000, 55.6999); //window001
	SetDynamicObjectMaterial(g_DynamicObject[36], 0, 8409, "gnhotel1", "glass_64", 0xFFFFFFFF);
	g_DynamicObject[37] = CreateDynamicObject(19632, 2140.3200, 504.5262, 2.4000, 0.0000, 0.0000, 0.0000); //FireWood1
	g_DynamicObject[38] = CreateDynamicObject(19360, 2181.5383, 487.7128, 10.5733, 0.0000, 0.0000, 56.5998); //wall008
	SetDynamicObjectMaterial(g_DynamicObject[38], 0, 12862, "sw_block03", "sw_woodwall1", 0xFF9F9D94);
	SetDynamicObjectMaterial(g_DynamicObject[38], 1, 1453, "break_farm", "CJ_HAY", 0xFFFFFFFF);
	g_DynamicObject[39] = CreateDynamicObject(1527, 2176.5017, 478.6947, 10.3268, -0.2998, -0.1999, 55.9000); //tag_rollin
	g_DynamicObject[40] = CreateDynamicObject(19386, 2178.9438, 489.3779, 10.5733, 0.0000, 0.0000, 58.5000); //wall034
	SetDynamicObjectMaterial(g_DynamicObject[40], 0, 12862, "sw_block03", "sw_woodwall1", 0xFF9F9D94);
	SetDynamicObjectMaterial(g_DynamicObject[40], 1, 1453, "break_farm", "CJ_HAY", 0xFFFFFFFF);
	g_DynamicObject[41] = CreateDynamicObject(19360, 2176.2407, 491.1090, 10.5733, 0.0000, 0.0000, 56.5998); //wall008
	SetDynamicObjectMaterial(g_DynamicObject[41], 0, 12862, "sw_block03", "sw_woodwall1", 0xFF9F9D94);
	SetDynamicObjectMaterial(g_DynamicObject[41], 1, 1453, "break_farm", "CJ_HAY", 0xFFFFFFFF);
	g_DynamicObject[42] = CreateDynamicObject(19173, 2176.5205, 490.8138, 10.6134, 0.0000, 0.0000, -32.9999); //SAMPPicture2
	g_DynamicObject[43] = CreateDynamicObject(14446, 2183.1850, 490.4536, 9.1908, 0.0000, 0.0000, -124.5000); //Smokes_bed
	g_DynamicObject[44] = CreateDynamicObject(2559, 2184.8413, 490.5486, 10.3134, 0.0000, 0.0000, -124.9000); //CURTAIN_1_OPEN
	SetDynamicObjectMaterial(g_DynamicObject[44], 1, 14407, "carter_block", "zebra_skin", 0x00000000);
	g_DynamicObject[45] = CreateDynamicObject(11737, 2173.7673, 491.8208, 8.8695, 0.0000, 0.0000, -125.4999); //RockstarMat1
	SetDynamicObjectMaterial(g_DynamicObject[45], 0, 18901, "matclothes", "bandanacloth2", 0xFFA0522D);
	g_DynamicObject[46] = CreateDynamicObject(355, 2176.5439, 492.7456, 9.3522, 96.0000, 126.8000, 106.3999); //ak47
	g_DynamicObject[47] = CreateDynamicObject(19836, 2176.1452, 476.8280, 8.5251, 0.0000, 0.0000, 0.0000); //BloodPool1
	SetDynamicObjectMaterial(g_DynamicObject[47], 0, 14612, "ab_abattoir_box", "ab_bloodfloor", 0xFF8A2BE2);
	g_DynamicObject[48] = CreateDynamicObject(365, 2176.0554, 476.7699, 8.5534, -90.4999, 0.0000, 0.0000); //spraycan
	g_DynamicObject[49] = CreateDynamicObject(358, 2056.2553, 359.8197, 23.7915, -30.8999, -50.5998, -60.8998); //sniper
	g_DynamicObject[50] = CreateDynamicObject(803, 2058.5852, 357.1856, 24.6450, -12.3999, 0.0000, 0.0000); //genVEG_bush09
	g_DynamicObject[51] = CreateDynamicObject(803, 2058.5244, 363.6217, 22.8560, -12.3999, 9.1998, 0.0000); //genVEG_bush09
	g_DynamicObject[52] = CreateDynamicObject(359, 2243.4587, 394.9552, 2.9461, 0.0000, 0.0000, 0.0000); //rocketla
	g_DynamicObject[53] = CreateDynamicObject(2993, 2173.0871, 496.7554, 11.6667, 0.0000, 88.2998, 145.9001); //kmb_goflag
	SetDynamicObjectMaterial(g_DynamicObject[53], 1, 18901, "matclothes", "bandgang", 0x00000000);
	g_DynamicObject[54] = CreateDynamicObject(1829, 2177.5725, 494.5357, 9.3367, 0.0000, 0.0000, 55.3998); //man_safenew
	g_DynamicObject[55] = CreateDynamicObject(19786, 2176.7819, 490.7102, 10.7334, 0.0000, 0.0000, 146.7996); //LCDTVBig1
	SetDynamicObjectMaterial(g_DynamicObject[55], 1, 2266, "picture_frame", "CJ_PAINTING11", 0x00000000);
	g_Vehicle[0] = CreateVehicle(493, 2125.0346, 516.5249, -0.0370, 93.3524, 3, 6, -1); //Jetmax
	g_Vehicle[1] = CreateVehicle(539, 2144.8027, 491.5484, 3.9284, 321.8580, 1, 6, -1); //Vortex
	g_Vehicle[2] = CreateVehicle(412, 2245.1257, 394.4960, 3.4834, -35.5998, 22, 1, -1); //Voodoo
	g_Pickup[0] = CreatePickup(1242, 1, 2173.5781, 488.1806, 9.8291, -1); //bodyarmour
	g_Pickup[1] = CreatePickup(953, 1, 2143.1523, 498.8263, 4.1184, -1); //CJ_OYSTER
	g_DynamicActor[0] = CreateDynamicActor(18, 2110.5754, 522.2066, -0.1202, 0.0000); //Beach Visitor
	g_DynamicActor[1] = CreateDynamicActor(251, 2144.1630, 504.7874, 4.1585, 62.7000); //Lifeguard
	ApplyDynamicActorAnimation(g_DynamicActor[1], "BEACH", "SITNWAIT_LOOP_W", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[2] = CreateDynamicActor(154, 2114.1499, 523.5388, 0.6901, 25.4999); //Beach Visitor
	ApplyDynamicActorAnimation(g_DynamicActor[2], "PED", "SWIM_TREAD", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[3] = CreateDynamicActor(269, 2172.5209, 490.5905, 9.8733, 57.7999); //Melvin "Big Smoke" H
	ApplyDynamicActorAnimation(g_DynamicActor[3], "GANGS", "LEANIDLE", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[4] = CreateDynamicActor(271, 2178.2473, 491.9002, 10.1834, -117.6999); //Lance "Ryder" Wilson
	ApplyDynamicActorAnimation(g_DynamicActor[4], "TATTOOS", "TAT_SIT_LOOP_P", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[5] = CreateDynamicActor(102, 2244.5759, 394.8916, 2.4212, -38.6999); //Balla
	ApplyDynamicActorAnimation(g_DynamicActor[5], "PED", "CAR_SIT_PRO", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[6] = CreateDynamicActor(104, 2168.3435, 483.0215, 9.4587, -10.9998); //Balla
	ApplyDynamicActorAnimation(g_DynamicActor[6], "PED", "WEAPON_CROUCH", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[7] = CreateDynamicActor(285, 2056.4631, 359.9328, 23.4263, -50.5000); //S.W.A.T Special Forc
	ApplyDynamicActorAnimation(g_DynamicActor[7], "COP_AMBIENT", "COPBROWSE_LOOP", 4.0998, 1, 1, 0, 1, 500);
	g_DynamicActor[8] = CreateDynamicActor(285, 2057.6098, 362.1044, 23.8882, -37.9000); //S.W.A.T Special Forc
	ApplyDynamicActorAnimation(g_DynamicActor[8], "ON_LOOKERS", "POINT_LOOP", 4.0998, 1, 0, 0, 0, 0);
	g_DynamicActor[9] = CreateDynamicActor(285, 2055.4904, 361.2442, 24.0063, -60.7000); //S.W.A.T Special Forc
	ApplyDynamicActorAnimation(g_DynamicActor[9], "PED", "WEAPON_CROUCH", 4.0998, 1, 0, 0, 0, 0);
	AttachDynamicObjectToVehicle(g_DynamicObject[52], g_Vehicle[2], 0.0000, -0.8999, -0.2599, 90.0000, 1.5599, 0.0000);
}
/*
public OnFilterScriptExit()
{
	return 1;
}
*/
/*
public OnPlayerConnect(playerid)
{
	//SetPlayerAttachedDynamicObject(playerid, 0, 18898, 2, 0.1239, 0.0000, -0.0008, 270.0000, 0.0000, 270.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // Bandana8 attached to the Head of fusez
	//SetPlayerAttachedDynamicObject(playerid, 1, 19008, 2, 0.1040, 0.0359, 0.0028, 90.0000, 90.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // GlassesType3 attached to the Head of fusez
	//SetPlayerAttachedDynamicObject(playerid, 2, 372, 6, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0x96228B22, 0xFFFFFFFF); // tec9 attached to the Right Hand of fusez
	//SetPlayerAttachedDynamicObject(playerid, 3, 372, 5, 0.0000, 0.0710, 0.0000, 180.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFF696969, 0xFFFFFFFF); // tec9 attached to the Left Hand of fusez
	return 1;
}
*/
