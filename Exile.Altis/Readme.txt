/* missionfolder
WARNING!!!!!!
1. This project tested on vanila Exilemode without Battleye filters and in Kally infistarmod... all worked good!!!
if you using Battleye and ifistar you need setup it and make filter for you.

2. This code using class CfgSounds and RscTitles in EQP_anmMedia.hpp change it if you using this config another mods..!!!!

3. Particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!  Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

INSTALL:

1. Download and copy EQP_Anomaly unpack in for you mission folder...
2. change... you mission folder init 

bottom description.ext      -> #include "EQP_Anomaly\EQP_anmmedia.hpp"
top init.sqf                -> [] execVM 'EQP_Anomaly\EQP_zonespawn.sqf';
bottom initPlayerLocal.sqf  ->
                              [] execVM 'EQP_Anomaly\EQP_Hazard.sqf';
                              [] execVM 'EQP_Anomaly\EQP_gazMask.sqf';

3. Know problems ... if you restart you server or players exit step quest dropped... :( need save in base..

