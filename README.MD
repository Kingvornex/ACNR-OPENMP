<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a id="readme-top"></a>


<!-- PROJECT SHIELDS -->
<!--

*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]
[![GitHub watchers][watchers-shield]][watchers-url]




<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Kingvornex/ACNR-OPENMP">
    <img src="images/logo 1.png" alt="Logo" width="200" height="200">
  </a>

<h3 align="center">ACNR-OPENMP</h3>

  <p align="center">
    SAMP ACNR GAME MODE UPDATING TO OPEN.MP WORK IN PROGRESS
<br />  <a href="https://github.com/Kingvornex/ACNR-OPENMP/blob/main/DevStory.md"><strong>Development Story»</strong></a> 
<!--    <br />
     <a href="https://github.com/Kingvornex/ACNR-OPENMP/watchers"><strong>Watchers »</strong></a> 
    <br /> -->
    <br />
     <a href="https://github.com/Kingvornex/ACNR-OPENMP/commits/main/">Commits</a>
    · 
    <a href="https://github.com/Kingvornex/ACNR-OPENMP/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/Kingvornex/ACNR-OPENMP/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#acnr-openmp">ACNR-OPENMP</a>
    </li>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#built-with-pawn">Built With PAWN</a>
    </li>
    <li>
      <a href="#roadmap">Roadmap</a>
    </li>
    <li>
      <a href="#voting">Voting</a>
    </li>
    <li>
      <a href="#current-state">CURRENT STATE</a>
      <ul>
        <li><a href="#known-issues">Know issues</a></li>
        <li><a href="#compiler-errors">Compiler errors</a></li>
        <li><a href="#server-log">Server Log</a></li>
      </ul>
    </li>
    <li>
      <a href="#list">LIST</a>
    </li>
    <li>
      <a href="#changelog">Changelog</a>
      <ul>
        <li><a href="#old-version-changelogs">Old version changelogs</a></li>
        <li><a href="#new-version-changelogs">New version changelogs</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#youtube-video">YouTube Video</a>
    </li>
    <li>
      <a href="#contributing">Contributing</a>
      <ul>
        <li><a href="#top-contributors">Top Contributors</a></li>
      </ul>
    </li>
    <li>
      <a href="#license">License</a>
    </li>
    <li>
      <a href="#contact">Contact</a>
    </li>
    <li>
      <a href="#credits">Credits</a>
    </li>
  </ol>
</details>




<!-- ABOUT THE PROJECT -->
# About The Project

![product screenshot](https://github.com/Kingvornex/ACNR-OPENMP/blob/main/images/logo%202.png)

`Kingvornex`, `ACNR-OPENMP`, `ACNR-OPENMP`, `SAMP ACNR GAME MODE UPDATING TO OPEN.MP WORK IN PROGRESS`, `project_license`

<p align="right">(<a href="#readme-top">back to top</a>)</p>



# Built With PAWN

* CompuPhase
https://www.compuphase.com/pawn/pawn.htm
The Pawn language
* GitHub
https://github.com/compuphase/pawn
* AlliedModders LLC
https://wiki.alliedmods.net/Pawn_tutorial
* GitHub
https://github.com/pawn-lang
* Visual Studio Marketplace
PAWN Language for Visual Studio Code
https://marketplace.visualstudio.com/items?itemName=Qoo.pawn
* open.mp
Pawn Style Guide
https://www.open.mp/docs/scripting/language/Style
* SA-MP Forums
[Tutorial] PAWN For Beginners : 1 - Understanding PAWN
https://sampforum.blast.hk/showthread.php?tid=451445
* SA-MP Forums
https://sampforum.blast.hk › showth...
[Tutorial] PAWN Syntax and Compiler for Visual Studio Code
* GitHub
https://github.com/Southclaws/sampctl
Southclaws/sampctl: The Swiss Army Knife of SA:MP - vital tools for any ...
* open.mp forum
https://forum.open.mp/showthread.php?tid=1256
How to use SAMPCTL vscode/sublime.
* SA-MP Forums
https://github.com/sampctl/tutorial-helloworld https://sampforum.blast.hk/showthread.php?tid=651240
[Tutorial] sampctl hello world - learn the sampctl workflow in 10 minutes
* SA:MP Develop, alternative to "Pawno": https://github.com/Gomaink/SAMP-Develop

<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- ROADMAP -->
# Roadmap

- [ ] updating to OPEN.mp
    - [x] #define NO_TAGS
    - [x] #pragma warning disable 213/214
    - [x] #pragma warning disable 219/239
    - [x] #define MIXED_SPELLINGS
    - [x] #include <open.mp>
    - [ ] use upgrade tool
    - [ ] use y_hooks?
    - [ ] update whirlpool to bcrypt: https://github.com/Kingvornex/ACNR-OPENMP/blob/main/How%20to%20update%20to%20bcryp.md
    - [ ] 

- [ ] CODE BUG FIXES
    - [ ] FIX VEHICLE SPEED CODES (OnPlayerUpdate, soratbegirs, GetPlayerSpeed, GetVehicleSpeed, ACNR_anticheat) TOO MANY DIFFRENT CODES FOR SPEED, MAKE THEM ONE (SOME DIDN'T USE Z VELOCITY)
    - [ ] MAKE A WAY TO SHORTEN OnDialogResponse CODES (maybe https://github.com/Awsomedude/easyDialog)
    - [ ] SEEMS TO HAVE REPEATED CODES UNDER OnVehicleDeath
    - [ ] FIX AUDIO STREAM LINKS (EXPIRED)
    - [ ] fix << `format(zone, len, SACities[i][City_Name], 0);` >> to << `format(zone, len, "%s", SACities[i][City_Name]);` >>
    - [ ] same problem with `format` under `GetVehicleName`
    - [ ] some interiors change player VW, make sure set it back when they come out of interior
    - [ ] create scripfiles folders and files automatically if the don't exist: https://github.com/JaTochNietDan/SA-MP-FileManager
    - [ ] open dialog automaticly when player goes to elevator checkpoint like : case NVPD_ELEV_CP
    - [ ] change `AllowInteriorWeapons(0);` to `AllowInteriorWeapons(true);` or allow robbing stores without weapons. now players can't rob stores.
    - [ ] make help and cmd_list dialogs more readable and also make cmds dialog clickable to execute commands form it
    - [ ] 

- [ ] ADD NEW FEATURES
    - [ ] MAYBE ADD TIMERS TO AFK MASSAGE (HOW MANY SECONDS, MINUTES, HOURS PLAYER WAS AFK)
    - [ ] ADD "BACK" OPTION TO DIALOGS
    - [ ] add /run cmd to change running animation
    - [ ] add /skin cmd to change skin
    - [ ]  add /tune for car tuning
    - [ ] add START ROBBERY to shop checkpoints
    - [ ] add /setplayerskin for admin
    - [ ] add preloaded houses
    - [ ] add checkpoint to /service areas and automatically open dialog
    - [ ] mabe add zombies and aliens or animals
    - [ ] add /jobs cmd to show jobs list and set a marker to their locations and jobs specific commands 
    - [ ] **police tags wanted players with gps devices so they can see where they are in all over the map even which shop and interior they go, the wanted players that are tagged need to buy another device from shops to use it and remove gps tag from themselves.** https://github.com/Kiiruuu/GPSBullet

- [ ] adding features from Grand Larceny gamemode
    - [ ] gl_npcs.pwn
    - [ ] ls_elevator.pwn
    - [ ] ls_mall.pwn
    - [ ] maxips.pwn
    - [ ] netstats.pwn
    - [ ] pnetstats.pwn
    - [ ] iradio.pwn
    - [ ] gl_realtime.pwn
    - [ ] gl_property.pwn
    - [ ] gl_mapicon.pwn
    - [ ] gl_chatbubble.pwn
    - [ ] cargoship.pwn
    - [ ]  

- [ ] adding features from sf-cnr gamemode
    - [ ] Action packed gang wars
    - [ ] Kidnap players and hold them for ransom
    - [ ] Blowing up the jail cells to break out criminals from prisons
    - [ ] Steal furniture and cash them at the Pawn Shop
    - [ ] Create methamphetamine in RVs and export to Cluckin' Bell
    - [ ] Bank, drug house and ship hiests
    - [ ] Rob NPC security trucks
    - [ ] Blowing up Alcatraz to release the high-risk criminals
    - [ ] Jacking cars and exporting them in Shipyard containers
    - [ ] Rob atms
    - [ ] Gamble the casinos in SA-MP
    - [ ] Race players
    - [ ] fireworks
    - [ ] Play 8-Ball Pool
    - [ ] Play Poker
    - [ ] House, vehicle, garage, gate, gang facility, business systems
    - [ ] Toy/clothes system
    - [ ] Paintball system
    - [ ] Battle Royale Minigame
    - [ ]  

- [ ] adding features from GTAopen gamemode
    - [ ] Houses with different interiors that can be customised with an array of furnitures
    - [ ] Be a drug dealer, get the skill to plant cannabis and make cocaine
    - [ ] Gangs, competitive gang system that competes with other gangs kills, deaths and zone captures
    - [ ]  
    - [ ]  

- [ ] updating Anti-Cheat
    - [ ] Nex-AC - Anticheat system: https://github.com/NexiusTailer/Nex-AC/tree/master
    - [ ]  
    - [ ]  
    - [ ]  
    - [ ]  

- [ ] adding features github.com/srafay/SAMP-Server/commits
    - [ ] Added Discord bot to the server with following features :
        - [ ] Can send message to Discord channel if someone joins the server
        - [ ] Admins can send message to discord channel from the game
        - [ ] Admins can send messages in-game from the discord channel
    - [ ] Made system for house entering and exit by pressing [F]
    - [ ] Working with properties, added some houses for test
    - [ ] Added icons filter script to the server
    - [ ] Fixed the Gate object's z-coordinates at Market
    - [ ] 

- [ ] bug fixes scripts:
    - [ ] MapFix: https://github.com/NexiusTailer/MapFix?tab=readme-ov-file
    - [ ] new open.mp fixes.inc

- [ ] optional:
    - [ ] FilterScript TextDraw-FPS SA:MP: https://github.com/ocalasans/TextDraw-FPS
    - [ ] Headphones(in-game music player): https://github.com/lunosat/Headphone-Filterscript-SA-MP

- [ ] features from other's:
    - [ ] Trucking system: https://github.com/lucian-nk/Romania-Live-Trucking
    - [ ] Pursuit system: https://github.com/NCMohit/Pursuit-Gamemode-SAMP

    - [ ] maps: https://github.com/MacMailler/GWRP-0.3/tree/develop/server/scriptfiles/maps
    - [ ] Apple Valley Speedway map: https://forum.open.mp/showthread.php?tid=2029
    - [ ] SAMP-Blake-Island map: https://github.com/HeLiOn--PrImE/SAMP-Blake-Island
    -  [ ] SAMP - Eiffel Tower map: https://forum.open.mp/showthread.php?tid=2421
    -  [ ] Touge Track map: https://forum.open.mp/showthread.php?tid=2071
    -  [ ] SWAT VS TERRORIST FULL MAP: https://forum.open.mp/showthread.php?tid=2366
    -  [ ] The Farm Prison map: https://forum.open.mp/showthread.php?tid=1635
    -  [ ] Add other GTA games maps
    -  [ ]
    -  [ ]
    -  [ ]

-  [ ] more features:
    -  [ ] add robbing from safe: https://sampforum.blast.hk/showthread.php?tid=632154
    -  [ ] Kill The President minigame: https://sampforum.blast.hk/showthread.php?tid=665076
    -  [ ] https://freegeoip.io/ GeoIP: https://sampforum.blast.hk/showthread.php?tid=591916
    -  [ ] samp-ships: https://sampforum.blast.hk/showthread.php?tid=642692
    -  [ ] drift-detection: https://sampforum.blast.hk/showthread.php?tid=649800
    -  [ ] Maze Generator: https://sampforum.blast.hk/showthread.php?tid=645290
    -  [ ] OnPlayerClickPlayer: https://sampforum.blast.hk/showthread.php?tid=651714
    -  [ ] textdraw fade effect: https://github.com/Gammix/fader.inc/blob/master/pawno/include/fader.inc
    -  [ ] **zmessage: https://github.com/Open-GTO/zmessage
    -  [ ] Ranking system: Code:

```ruby
    if(GetPlayerScore(playerid) >= 0 && GetPlayerScore(playerid) < 100) format(player, sizeof(player), "Newbie");
    else if(GetPlayerScore(playerid) >= 100 && GetPlayerScore(playerid) < 500) format(player, sizeof(player), "Junior Player");
    else if(GetPlayerScore(playerid) >= 500 && GetPlayerScore(playerid) < 5000) format(player, sizeof(player), "Regular Player");
    else if(GetPlayerScore(playerid) >= 5000 && GetPlayerScore(playerid) < 10000) format(player, sizeof(player), "Senior Player");
    else if(GetPlayerScore(playerid) >= 10000 && GetPlayerScore(playerid) < 50000) format(player, sizeof(player), "Loyal Player");
    else if(GetPlayerScore(playerid) >= 50000 && GetPlayerScore(playerid) < 100000) format(player, sizeof(player), "Hero");
    else if(GetPlayerScore(playerid) >= 100000) format(player, sizeof(player), "Godlike");
```
<br/>

- [ ] more:
    -  [ ] ai cop cpus: (fcnpc not supported by open.mp) https://sampforum.blast.hk/showthread.php?tid=663155
    -  [ ] 3D Speedometer: https://github.com/markski1/SAMP-3dspeed
    -  [ ] radar blip: https://sampforum.blast.hk/showthread.php?tid=550990
    -  [ ] Player Location Display: https://github.com/alextwothousand/pld
    -  [ ] Gps bullet: https://sampforum.blast.hk/showthread.php?tid=665533
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]
    -  [ ]


See the [open issues](https://github.com/Kingvornex/ACNR-OPENMP/issues) for a full list of proposed features (and known issues).


<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Voting and results:
* Clear player wanted level after death: https://github.com/Kingvornex/ACNR-OPENMP/issues/1
    -  [ ] yes
    -  [ ] no

* Respawn shop vehicles with respawn cars command: https://github.com/Kingvornex/ACNR-OPENMP/issues/2
    -  [ ] yes
    -  [ ] no

* Server Tax System Options: https://github.com/Kingvornex/ACNR-OPENMP/issues/3
    -  [ ] Get taxes from players
    -  [ ] Give players bank interest daily
    -  [ ] None of them

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# CURRENT STATE
## known issues:
* there is a bug with open.mp that in old version (2.1.5 compile with sa-mp) player cant hold gun in interiors.
* because of ignoring warning 219 in 2.2.0 a lot of bugs happening in game.

## Compiler errors:
`#define NO_TAGS` 
`//#pragma warning disable 213 //tag mismatch`
`#define MIXED_SPELLINGS //warning 234: function is deprecated (symbol "TextDrawBackgroundColor") Use TextDrawBackgroundColour`

`#pragma warning disable 213 //tag mismatch`
`#pragma warning disable 214 //const`
`#pragma warning disable 219 //shadows`
`#pragma warning disable 239 //const`

## Server Log:
**https://github.com/Kingvornex/ACNR-OPENMP/blob/main/log.txt**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# LIST

* Easy game mode for SA-MP (0.3.7) https://github.com/lexjusto/SA-MP-0.3.7-Simple-Gamemode/blob/master/include/gl_common.inc
* https://github.com/ZiggyMaes/Everystuff-SAMP/blob/master/Development/2.0/include/gl_common.inc
* A set of useful utility functions for SA-MP https://github.com/WoutProvost/samp-util/tree/master 
* https://github.com/srafay/SAMP-Server/tree/master
* San Andreas Heaven Role Play Server Gamemode https://github.com/Cocanuta/SAHeaven/tree/master 
* San Fierro Cops And Robbers Gamemode for SA-MP (includes Call Of Duty For SA-MP as a bonus gamemode) https://github.com/PatrickGTR/sf-cnr
* MapAndreas Plugin to check the min height for x,y coordinates https://github.com/philip1337/samp-plugin-mapandreas/tree/master
* MapAndreas Plugin to check the min height for x,y coordinates https://github.com/Southclaws/samp-plugin-mapandreas
* A gamemode made for open.mp https://github.com/PatrickGTR/gta-open 
* pawno: https://github.com/brazucas/samp-pawno
* ProgressBar: https://github.com/Southclaws/progress2
* RNPC: https://sampforum.blast.hk/showthread.php?tid=355849
* ARNPC: https://github.com/BrianFurious/ARNPC-Include/tree/master
* FCNPC: https://github.com/ziggi/FCNPC
* GtaV menu:  https://sampforum.blast.hk/showthread.php?tid=574271
* https://github.com/Agneese-Saini/SA-MP/tree/master
* GtaV TP camera effect: https://sampforum.blast.hk/showthread.php?tid=535209
* GtaV death sequence: https://sampforum.blast.hk/showthread.php?tid=653168
* GtaV textdraw menu:  https://sampforum.blast.hk/showthread.php?tid=471939
* Custom city map:  https://sampforum.blast.hk/showthread.php?tid=644493
* Dynamic mission system: https://forum.open.mp/showthread.php?tid=2528&highlight=Npv
* dynamic robberies: https://sampforum.blast.hk/showthread.php?tid=607450
* Dynamic Actor: https://sampforum.blast.hk/showthread.php?tid=611484
* samp-map-zones: https://github.com/kristoisberg/samp-map-zones
* **actor_plus: https://github.com/Dayrion/actor_plus/tree/master**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Changelog:
## Old version changelogs:
* **NVCNR changelog: https://sampforum.blast.hk/showthread.php?tid=463657**
* **ZCNR changelog: https://sampforum.blast.hk/showthread.php?tid=566923**
* **Old ACNR changelog: https://github.com/Kingvornex/ACNR-OPENMP/blob/main/OLD%20VERSION%20UPDATES.MD**
## New version changelogs:
* **OPEN.mp ACNR changelog: https://github.com/Kingvornex/ACNR-OPENMP/blob/main/CHANGELOG.md**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
# Getting Started

To get a local copy up and running follow these simple example steps.

## Prerequisites

* 
  ```sh
  https://github.com/Southclaws/sampctl/?tab=readme-ov-file#installation
  ```

## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Kingvornex/ACNR-OPENMP.git
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- youtube video -->
# youtube video


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
# Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Top contributors:

<a href="https://github.com/Kingvornex/ACNR-OPENMP/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Kingvornex/ACNR-OPENMP" alt="contrib.rocks image" />
</a>



<!-- LICENSE -->
# License

Distributed under the project_license. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
# Contact

Project Link: [https://github.com/Kingvornex/ACNR-OPENMP](https://github.com/Kingvornex/ACNR-OPENMP)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->

# Credits:

1. Weponz - Founder
2. SA:MP - Callbacks and Functions and GetXYPosInFrontOfPlayer
3. ****** - Whirlpool, sscanf2, y_ini and y_timers
4. ZeeX - ZCMD
5. Incognito - Streamer Plugin
6. Joao Pedro Lopes - Checkpoint Manager
7. RyDeR` - GetVehicleColor
8. [HiC]TheKiller - Group chat system
9. Garsino - Parts of GarHouse v1.0 for NVCNR_house
10. Donya - Vehicle mod prices array and IsPlayerInInvalidNosVehicle
11. Mauzen - Anti D-AMX script, IsPlayerSkydiving and IsPlayerUsingParachute stocks
12. DracoBlue - IsNumeric, PropertySet stock and dprop_PRIVATE_hash
13. MP2 - Cuff fall over script
14. DopeX / [ND]xXZeusXx / Ritzy - Updated Gamemode.
15. JStylezzz - for blood screen include
16. Threshold - Helping me along the way.
17. Admigo - A_vshot.inc

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Kingvornex/ACNR-OPENMP.svg?style=for-the-badge
[contributors-url]: https://github.com/Kingvornex/ACNR-OPENMP/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Kingvornex/ACNR-OPENMP.svg?style=for-the-badge
[forks-url]: https://github.com/Kingvornex/ACNR-OPENMP/network/members
[stars-shield]: https://img.shields.io/github/stars/Kingvornex/ACNR-OPENMP.svg?style=for-the-badge
[stars-url]: https://github.com/Kingvornex/ACNR-OPENMP/stargazers
[issues-shield]: https://img.shields.io/github/issues/Kingvornex/ACNR-OPENMP.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/Kingvornex/ACNR-OPENMP
[license-shield]: https://img.shields.io/github/license/Kingvornex/ACNR-OPENMP.svg?style=for-the-badge
[license-url]: https://github.com/Kingvornex/ACNR-OPENMP/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://www.compuphase.com/images/pawnlogo128.png
[React-url]: https://www.compuphase.com/pawn/pawn.htm
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
[watchers-shield]: https://img.shields.io/github/watchers/Kingvornex/ACNR-OPENMP?style=for-the-badge
[watchers-url]: https://github.com/Kingvornex/ACNR-OPENMP/watchers


