/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

private["_EQPAnomaly_Gazmask"];

_EQPAnomaly_Gazmask = ["H_PilotHelmetFighter_O"];

if (!hasInterface) exitwith{};

EQP_fnc_gasmaskeffects = { 
	100 cutRsc ["gazmask","PLAIN", 2, false];
	playsound ["gazmask",true]; 
	sleep 1.6;
};

while {alive player} do {
	if ((headgear player) in _EQPAnomaly_Gazmask) then {		
		EQP_AnomalyEffectsScript = 0 spawn EQP_fnc_gasmaskeffects;
	} else {
		if (!isNil "EQP_AnomalyEffectsScript") then {
			terminate EQP_AnomalyEffectsScript;
			100 cutText ["","PLAIN"];
		};
	};
	sleep 4.6;
};