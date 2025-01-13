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

samp pawn

new Float:gpslocations[gpscount][3] = {
    {2782.3027, -2019.0826, 13.5547},   // Ball Spawn Location


CMD:gps(player id, params)
{dialog_show(playerid, GPSdialogID, color, dialog_type, dialog text);}
Dialog:GPSdialogID(player id, listitem)
{new x,y,z)
getplayerpos(player id,x,y,z)
playplayersound,playerid, ding,x,y,z)
setplayercheckpoint(gpsloc[listitem][0], gpsloc[listitem][1],gpsloc[listitem][2])}
















