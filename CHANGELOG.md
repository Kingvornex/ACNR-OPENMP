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