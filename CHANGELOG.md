//New Vegas Cops and Robbers(NVCNR) - v2.3 - by Weponz 2010-2012 : https://github.com/WeponzTV/NVCNR
//New Vegas Cops and Robbers(NVCNR) - v2.3 - by Weponz 2010-2012 Edit: DopeX aka [ND]xXZeusXx : https://sampforum.blast.hk/showthread.php?tid=566923

//Abolfazl Cops and Robbers(ACNR) - v2.1.5 - by Abolfazl 2015 - 2018 : https://github.com/Kingvornex/ACNR-OPENMP/blob/main/OLD%20VERSION%20UPDATES.MD
//Abolfazl Cops and Robbers(ACNR) - OPEN.mp - v2.2.0 - by Abolfazl 2024 : https://github.com/Kingvornex/ACNR-OPENMP

# SA-MP version Changelog

## NVCNR 13.09.2013 version :

https://sampforum.blast.hk/showthread.php?tid=463657

## ZCNR 09.03.2015 version :

### Added Features:
- Script Birth: Early 2010
- Script Developer: Weponz
- Starting Version: 1.0
- Current Version: 2.3 (13 major updates)
- Script Build: pawn, zcmd, sscanf2, foreach, y_ini, Whirlpool, streamer, y_timers, CheckpointManager, GetVehicleColor
- Script Line Count: 28,466 lines
- Script Bugs: None Known

https://sampforum.blast.hk/showthread.php?tid=566923
1. Roadblocks Removed. (You're now not limited to LV.)
2. Wanted level saves even after you die. (You'll still be wanted after respawning.)
3. Medics can interact with shops now. (Medics can buy food and guns now.)
4. Unoccupied Vehicles can get damaged now. (Like Original game.)
5. Gas tank explosion feature. (Like Original game.)
6. New Damage Textdraw.(Intensity of textdraw depends on the damage you take, can be Edited Under OnPlayerTakeDamage (ShowBloodScreen Function.)
7. Removed a Custom Mapped House from the script at LV (Threshold's Map.)
8. Removed the dull /help dialog showing everytime you respawn. (Now /help triggers a beautiful textdraw menu which can be closed by pressing LMB. (Fire key.)
9. Anticheat now also deals with Airbrake and Speed Hacks.
10. LS has now cars spawned (SF doesn't still; Originally Vehicles were limited to LV.)
11. Removed the NVCNR Zone Names and added Original Zone names.
12. Updated Speed-o-meter with colorful textdraws.
13. Added a beautiful "Rules" Textdraw when the player connects rather than the dull gametext which says "Welcome to NVCNR."
14. New and Better Dialogs. (Colorful)
15. OnPlayerRequestClass scrapped and redone with animations when you browse skins.
16. Incomplete car shop at Las Venturas. (Just Checkpoint added XD)
17. More Robberies in LS and SF, and car shops can be created by replicating the original dialogs easily. (Not exactly a new feature but what I planned on doing.)
18. Added a new FPS counter above the HP Bar. (Works perfectly.)
19. Dull /rules dialog removed, rather shows the same textdraw which it showed OnPlayerConnect.
20. Added more skins for Civillians and Cops.
21. Added Gameday + Gametime (Days and Weather changes accordingly.)

## ACNR v1.4 :
- Added /updates
- Added many cmds
- Added /unban
- Added /setteam
- Added more cars to car shop
- Added /bankhelp for Beta Persian translate
- Added /gps
- Added Elevator Map
- Added more commands to /event 
- Now admin 2+ can receive SendAdminMessage()s & admin 4 can see /pm s
- Improved admin system
- Account Ban bug fixed
- Now medics can buy things from shops
- Show accs/bans/kicks/joins in ACNR textdraw
- Show rules box on connect

## ACNR v1.5 :
- Fixed cmd /goto & /get & /loadpos
- Fixed Come-A-Lot location position in /ap teleport menu
- Added /anopm (Admon No PM(SendAdminMessage))
- Fixed /gps
- Added time & vehicle name textdraw
- Added admin warn for speed hack & air break cheat
- Improved anti-cheat sys
- Added more cars to car shop
- Added checkpoint to ammunition 
- Added white neon 
- Removed Comet veh from carshop 

## ACNR v1.6 :
- No fuel message spam bug fixed
- Anti bot attack bug fixed
- Fixed /housemenu bug
- Fixed /bug 
- Fixed god mode
- Changed gates to automatic gates
- Some map changes
- Added anti bad word
- Added /respawncars to admin 3+
- Added /jail & /uncage
- Added audio stream system
- Added /fly to admin 4
- Added Anti Car Park/Drive By & Anti FakeKill & Anti Fly Hack & Anti Car Jack to Lock vehicle & Anti Anti-Eject. :))
- Changed /loc
 
## ACNR v1.7 :
- Added anti spawn kill
- Added /settime & /setweather to admin 3+
- Added load screen
- Added afk sys
- Changed audio stream sys
- Removed /forec 
- Changed /stats to dialog
- Fixed /(start/stop)fly
- Fixed admin cmds
- Fixed wanted level sys
- Checkpoint exit bug fixed
- Fixed /accept
- Fixed jail bugs

## ACNR v1.8 :
- Fixed /eventvehs
- Fixed dead player color
- Now you can use left alt to start robbing stores
- Added animation to shop actors
- Added shops list to /roblist

## ACNR v1.8.5 :
- On player spawn bugs fixed
- Anti weapon hack bugs fixed
- Fixed wanted level sys bugs
- Fixed /roblist
- Fixed /dcar
- Fixed textdraws bugs
- Fixed /bankhelp
- Fixed some of CMD_TIMERS
- Fixed /sellhouse & /sellbiz
- Now wanted level won’t remove on player death
- Closed pay n spray doors because of free vehicle fix and color change
- Removed /afk & /back because of /unfreeze bug [ but you can fix this whit writhing TogglePlayerControllable(playerid,false); in onplayerupdate like god mode ]
- Now accs/kicks/bans/joins/newestname will save
- Respawning shop vehs with /respawncars
- Some map changes
- Now you cant use /phone in vehicle [ but you can change it to let players to use /phone to hide phone when they are in veh ]
- Removed shop actors animations 
- Changed audiostream sys
- Changed /dinfo 
- Changed /vcmds
- Changed admin cmds
- Changed textdraws
- Added money-wantedlevel-score textdraw
- Now medic can heal himself
- Now vehs can attach to twos
- Added vote system
- Added anti ammo hack
- Added /acmds to helper & head helper
- Added /objects to admins
- Added 6 churches
- Added /cheackweap
- Now medics & mechanics & weapons degrees don’t  get scores whit giving service to themselves
- Improved /tz time
- Now for choosing police class you have to have 25 or more scores

## ACNR v1.9 :
- Fixed /loc & /break & /sethelper
- Fixed some other bugs
- Added more objects to /objlist
- Change /vbike , /vcar , /gcar & /car vehs to temporary vehs
- Stop respawning shop vehs with /respawncars
- Show score under money
- Show chat bubble for mute players to show others that this player is muted

## ACNR v2.0 :
- Update anti cheat 
- Added anti veh crasher
- Fixed and added some anti cheats
- Stop sending avoiding messages to connecting player
- Some map changes
- Fixed some bugs 
- Removed /skydive
- Added /reloadbans

## ACNR v2.0.5 :
- Some map changes 
- Fixed some text bugs
- Fixed some map bugs

## ACNR v2.1.0 :
- Improved admin system
- Fixed some bugs
- Changes /acmds
- Changed /setbuilder
- Improved anti spawn kill time from 10s to 15s
- Respawn shop vehs with /respawncars

## ACNR v2.1.5 :
- Fixed /ap teleport menu exteriors
- Fixed some other little bugs
- Added /force
- Added /carrespawn
- Stop respawning shop vehs
- Send afk message to only nearby players
- Removed UsePlayerPedAnims()
- Changed rcon cmds
- Changed admin cmds
- Changed /dcar admin level
- Changed onplayerconnect audio stream
- Changed anti cheat sys

# OPEN.mp version Changelog:

## ACNR-OPENMP-v2.2.0 :
- Updating to OPEN.mp
- Updating libraries
- Updated foreach
- Removed fixes.inc //because of compiler erros: error 017: undefined symbol "_ALS" & "_ALS_go", error 029: invalid expression, assumed zero
- Removed OnPlayerCheat //because of SAMP_AC_v2 NOT SUPPORTED OR MAINTAINED

## ACNR-OPENMP-v2.2.1 :
- Enabled UsePlayerPedAnims
- Enabled AllowInteriorWeapons
- Fixed Insufficient specifiers given to `format`: "Las Venturas"
- Fixed GetVehicleName
- Updated 6 filterscripts

## ACNR-OPENMP-v2.2.2 :
- Fixed a Loop problem under GamemodeInit.
- Fixed speed numbers.
- Added /todolist cmd

## ACNR-OPENMP-v2.2.2 BETA :
- Login dialog bug fix
- Creates scriptfiles directories

## ACNR-OPENMP-v2.2.2 ALFA :
- Added some DEBUG massages
- Fixed IsPlayersFirstSpawn
- Fixed Player health on SaveUserStats
- Fixed /savestats cmd
- Removed hashing password
- Fixed SavePosStats

## ACNR-OPENMP-v2.2.2 TETA :
- Fixed loading user file bug : it won't load LoadUser_%s it will load LoadUser_data
- Disabled debug massages
- Fixed Login_menu bug
- Hide car name textdraw on player state change
- Fixed vehicle speed numbers
- Added 3D speedo meter /tdspeedo
- Added Client Commands to cmd list
- Updated some callbacks
- Disabled Anti Bad Words
- Fixed /sleep cmd
- Added /stopanim cmd
- Added /getplayer cmd to Admin+3
- Added /vehhelp cmd
- Now /dcar will change vehiclepos to 0,0,3
- Increased police station gates range
- Increased police cmds range
- Added /helpme cmd
- Added/helpadmin cmd
- Changed Vehicle Neons to Streamer Dynamic Objects.
- Changed to PLAYER_MARKERS_MODE_GLOBAL
- Added Group names to chat massages

# Updated FilterScripts :
- Updated FilterScripts to Open.MP
- Change AddStaticVehicleEx to CreateVehicle in acnr2.pwn
- Used izcmd in acnr6.pwn
- Changed Objects to streamer DynamicObjects
- Change Vehicles loading from filterscript to Streamed Vehicles

## ACNR-OPENMP-v2.2.3:
- Now Tune Menu Saves Shop Vehicle Paint Job And Colours
- Added Custom Colorus to Tune Menu
- Fixing bugs with 0.3DL
- Fixed /stopanim bug
- Changed All Objects to Dynamic Objects
- MAX_PLAYER_BIZ_HOUSE_VEHS 10, MAX_DEGREE_BIZ_HOUSE_VEHS 20, MAX_VIP_BIZ_HOUSE_VEHS 30
- Added more skins to class selection
- Updated /myvehs cmd
- Added /playplaylist to Admin 4
- Added /CarRadio CMD
- Now 3D speedo will automatically Enable when player is in Arena
- Added Debug Files and save reports to them.
- Fixed REGISTER_MENU bug
- Give back player guns after /finishevent adn /levent
- Chaned classes and class spawn weapons
- Enabled Car Radio by default
- Fixed some small map bugs
- Added /RespawnShopCars to Admin 3+
- Adde /vmenu  /vehmenu
- Added Color -1 to /color and /vcol
- Added /RespawnMyCars
- Added /unstuck
- Changed OnPlayerStateChange for exiting vehicle
- Added Points of intrests to /gps (Added /gogps)
- Fixed a small /myvehs bug
- Added Vehicle Health and Fuel to /myvehs
- Updated Car Sho to easyDialog
- Added More category and cars to car shop
- Disabled Case Sensitive of srtcmp for names and password

