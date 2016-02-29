/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

#define WHITELIST_UNIFORM ['U_O_CombatUniform_ocamo']
#define WHITELIST_VEST []			
#define WHITELIST_BACKPACK []			
#define WHITELIST_GAZMASK ['H_PilotHelmetFighter_O']

private ["_nObject", "_RadObject", "_radius", "_Rad_VE"];
player setVariable ["sndGeigerPlayable", false];
_radius = 10;

_RadObject =
	['Land_Wreck_UAZ_F',
	'Land_Wreck_Ural_F',
	'Land_Wreck_Truck_dropside_F',
	'Land_Wreck_Car2_F',
	'Land_Wreck_Offroad2_F',
	'Land_Wreck_Offroad_F',
	'Land_Wreck_Slammer_hull_F',
	'Land_cmp_Shed_dam_F',
	'Land_Factory_Conv1_Main_ruins_F',
	'Land_Research_house_V1_ruins_F',
	'Land_Wreck_BRDM2_F',
	'Land_IndPipe2_big_support_F',
	'Land_Tank_rust_F',
	'Land_Wreck_Skodovka_F',
	'Land_GarbageBarrel_01_F',
	'Land_GarbagePallet_F',
	'Land_GarbageWashingMachine_F',
	'Land_JunkPile_F',
	'Land_Cargo40_china_color_V1_ruins_F',
	'Land_Cargo40_color_V2_ruins_F',
	'Land_Cargo20_china_color_V1_ruins_F',
	'Land_Cargo20_color_V2_ruins_F',
	'Land_Cargo20_china_color_V2_ruins_F',
	'Land_cmp_Shed_ruins_F',
	'Land_cmp_Tower_ruins_F',
	'Land_Factory_Conv2_ruins_F',
	'Land_Factory_Hopper_ruins_F',
	'Land_TTowerBig_2_ruins_F',
	'Land_TentHangar_V1_ruins_F'];


EQP_fnc_GeigerEffects = {	
	waitUntil {
		playsound ["geiger",true];
		sleep 0.1 + (2 * (random 1));
		!(alive player) || {!(player getVariable ["sndGeigerPlayable", false])}
	};
};

while {alive player} do {
	private["_inventory", "_isUniform", "_isHeadgear", "_setDammage"];


	_inventoryItems = (uniformItems player) + (vestItems player) + (backpackItems player);	
	_isUniform = false;
	_isHeadgear = false;
	_setDammage = 0;

	if (count (nearestObjects [(getPos player) , _RadObject, _radius]) > 0) then {

		"filmGrain" ppEffectEnable true; 
		"filmGrain" ppEffectAdjust [1,14.58,8,2,2,false];
		"filmGrain" ppEffectCommit 5;
		if !(player getVariable ["sndGeigerPlayable", false]) then {
			player setVariable ["sndGeigerPlayable", true];
			EQP_GeigerEffectsScript = 0 spawn EQP_fnc_GeigerEffects;
		} else  {
		player setVariable ["sndGeigerPlayable", false];
        };

		if (uniform player in WHITELIST_UNIFORM) then {
			_isUniform = true;
			if (headgear player in WHITELIST_GAZMASK) then {
			_isHeadgear = true;
				};
		};
			
		if !(_isUniform) then {_setDammage = _setDammage + 0.01
		};
		if !(_isHeadgear) then {_setDammage = _setDammage + 0.01
		};			
		if (_setDammage > 0) then {

			player setDammage ((getDammage player) + _setDammage);
			enableCamShake true;
			addCamShake [1, 7, 90];};
	} else {

		resetCamShake; 
		"filmGrain" ppEffectEnable true;
		"filmGrain" ppEffectAdjust [0];
		"filmGrain" ppEffectCommit 5;
		player setVariable ["sndGeigerPlayable", false];
	};
		sleep 1;

};