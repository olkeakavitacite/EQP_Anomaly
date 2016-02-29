// vitacite aka olke detector anomaly and send money prize (tnx to Bombajack for betatesting and Steel_Rat and Dizzturbed for his knowledge about Arma3 scripting)
// for saving prize to database need use https://github.com/happydayz-enigma/Enigma_Exile_Custom  Enigma addon for Exile.
// just copy Enigma_Exile_Custom.pbo in you @ExileServer/addons/ 
/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

//TODO:START CONFIGURATION****************************************************************************************
//TODO:PRIVAT
_useAnmzone	= true; //**** Use anomalyzone
_useGarbage	= true; //**** Create garbaje area in center anomaly zone
_useMarker	= true;  //**** Create quest marker for stuppid playes :)
_useDebug	= true;  //**** Use debugmod
_anmnumbers = 15;
_spawnCenter = [23538.9,18636.4,0];
_min = 10;
_max = 250;
_rad = (_max*2);
_mindist = 1;
_water = 0;
_shoremode = 0;
_questmancoord =
[
	['C_Nikos',[14642.1,16888.2,0],135,'Basil_Obukhov'], // Format ['Modelname',[x,z,y],setdir,'Questman name'] Start EQP_Anomaly Quest in South Aero
	['C_man_p_beggar_F_euro',[23332.1,24165.4,0],135,'Ivan_Demidov'], // Format ['Modelname',[x,z,y],setdir,'Questman name'] Unit 2 EQP_Anomaly Quest in East Tradezone
	['B_Soldier_F',[3031.86,18148.8,0],310,'Boris_Britva'] // Format ['Modelname',[x,z,y],setdir,'Questman name'] Unit 3 EQP_Anomaly Quest in West Tradezone
];
_mapcolor = 'ColorRed';


//TODO:END CONFIGURATION*****************************************************************************************

//TODO:GAZ_MASK SETTINGS*****************************************************************************************

//TODO: SPAWN NPC ON SERVER SIDE ***********************************************************************************
if (isServer) then {
	//TODO:CREATE ANOMALY ZONE CIRLCE WARNING SIGN..>>>>>>>
	//_texPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	
	for '_i' from 0 to 360 step (720 / _rad)*2 do {
		_location = [(_spawnCenter select 0) + ((cos _i) * _rad), (_spawnCenter select 1) + ((sin _i) * _rad),0];
		_dir = ((_spawnCenter select 0) - (_location select 0)) atan2 ((_spawnCenter select 1) - (_location select 1));
		_object = createVehicle ['SignAd_SponsorS_F', _location, [], 0, 'CAN_COLLIDE'];
		[_object, [0, "EQP_Anomaly\paa\sign_warning.paa"]] remoteExec ["setObjectTexture", 0, true];
		_object setDir _dir;
	};
	
	{
		_questman = createAgent [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
		_questman setPosWorld (_x select 1);
		_questman setDir (_x select 2);
		_questman disableAI 'MOVE';
		_questman setUnitPos "UP";
		_questman allowDammage false;
		_questman setVariable ["questman", (_x select 3), true];
		[_questman, ["<t color='#068600'>ANOMALY ACTIVITY QUEST</t>", "EQP_Anomaly\EQP_quest.sqf"]] remoteExec ["addAction", 0, true];
//		[_questman, ["<t color='#068600'>ANOMALY ACTIVITY QUEST</t>", (_x select 4)]] remoteExec ["addAction", 0, true];
		_helper = createVehicle ["Sign_Arrow_Large_Cyan_F", position _questman, [], 0, "NONE"];
		_helper attachTo [_questman, [0,0,6]];
		_questman setVariable ["helper", _helper];
		
	} forEach _questmancoord;
	//TODO:IF USE MARKER = TRUE THEN -> PAINT QUESTMAN MARKER ON MAP AND ANOMALY ZONE MARKER*****************************
	
	// USE_MARKER on globalmap = TRUE/FALSE ON/OFF
	if (_useMarker) then {
		{
			_marker1 = createMarker [format["AnmZone_%1", _foreachindex], _spawnCenter];
			_marker1 setMarkerShape "ELLIPSE";
			_marker1 setMarkerType  "Empty";
			_marker1 setMarkerColor (_x select 1);
			_marker1 setMarkerBrush "Solid";
			_marker1 setMarkerText (_x select 2);
			_marker1 setMarkerSize [_rad/(_x select 0), _rad/(_x select 0)];
		} foreach [
			[1, "ColorGREEN", "Restricted zone"],
			[2, "ColorBLUE", "Restricted zone"],
			[3, "ColorRED", "Restricted zone"]
		];

		{	
			_manpose = _x select 1; // coords x,z,y
			_manname = _x select 3; // name of quest npc 
			_marker4 = createMarker [format["QuestNPC:%1", _manname], _manpose];
			_marker4 setMarkerType 'selector_selectedMission'; // Marker type
			_marker4 setMarkerText _manname; // Text on map
			_marker4 setMarkerColor _mapcolor; // Marker color
		} forEach _questmancoord;
	};
	
	//TODO:RANDOM ANOMALY TYPE SPAWN.............>>>>>>>>>
	if (_useAnmzone) then {		
		for "_i" from 1 to 15 do {
			_pos = [_spawnCenter,_min,_max,_mindist,_water,800,_shoremode] call BIS_fnc_findSafePos;
			_anomalyType = ["electra","gravi","jarka","meat","fluff"] call BIS_fnc_selectRandom;
			_anomaly = createTrigger ["EmptyDetector", _pos];
			_anomaly setTriggerArea [5, 5, 0, false];
			_anomaly setTriggerActivation ["ANY", "PRESENT", true];
			_anomaly setTriggerStatements ["this", "[thisTrigger, thisList] execVM 'EQP_Anomaly\EQP_anmDetector.sqf'", "false"];
			_anomaly setVariable ["anomalyType", _anomalyType, true];
			
			_anomaly2 = createTrigger ["EmptyDetector", _pos];
			_anomaly2 setTriggerArea [0, 0, 0, false];
			_anomaly2 setTriggerActivation ["ANY", "PRESENT", true];
			_anomaly2 setTriggerStatements ["false", "false", "false"];
			
			_anomaly setVariable ["anomaly2", _anomaly2];
			_anomaly setVariable ["anomalyTriggerClient_remoteExecID", [[_anomaly, _anomaly2], "EQP_Anomaly\EQP_TriggerClient.sqf"] remoteExec ["execVM", -2, true]];
			
			if (_useDebug) then {
				diag_log format["PTM: Anomaly in server created: %1", _anomaly];
				_marker = createMarker [format["%1", _anomaly], _pos];
				_marker setMarkerType "selector_selectedMission";
				_marker setMarkerText _anomalyType;
			};
		};
	};
	if (_useGarbage) then 
	{		
		_gmax = (_max / 3);
		for "_i" from 1 to 55 do 
		{
		_garbagepos = [_spawnCenter,_min,_gmax,_mindist,_water,800,_shoremode] call BIS_fnc_findSafePos;
		_garbagearray = 
		[
		'Land_Wreck_UAZ_F',
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
		'Land_TentHangar_V1_ruins_F'
		] call BIS_fnc_selectRandom;
		_gobj=createVehicle [_garbagearray, _garbagepos,[], 0, "CAN_COLLIDE"];
		};
	};
};