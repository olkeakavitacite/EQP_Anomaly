/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

params["_target", "_caller", "_ID", "_arguments"];
private ["_debug", "_title", "_questItem", "_htext", "_inventoryItems", "_questman", "_notification", "_detector", "_quests"];

_debug = true;

_questman = _target getVariable ["questman", ""];
if (_questman == "") exitWith {
	diag_log "PTM: ERROR: script EQP_quest.sqf: _questman empty variable";
	if (_debug) then {hintSilent "PTM: ERROR: script EQP_quest.sqf: _questman empty variable";};
};

_quests = player getVariable ["quests", []];
if (
	("Basil_Obukhov" in _quests)&&
	{"Ivan_Demidov" in _quests}&&
	{"Boris_Britva" in _quests}
) exitWith {
	/* Quests complited */
	['Success',["Заданий нет."]] call ExileClient_gui_notification_event_addNotification;
};

// Блок конфигурации
_detector		= 'MineDetector';
_questItem		= 'Exile_Item_TreasureMap';
_title			= "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
_htext			= "";
_notification		= "";


_inventoryItems = (uniformItems player) + (vestItems player) + (backpackItems player);

_fnc_taskComplited = {
	player removeItem _questItem;
	_quests pushBack (player getVariable ["questCurrent", ""]);
	player setVariable ["quests", _quests];
	player setVariable ["questCurrent", ""];
};

switch (_questman) do {
	case ('Basil_Obukhov'): {
		if (player getVariable ["questCurrent", ""] == "" && {!("Basil_Obukhov" in _quests)}) then {
			player setVariable ["questCurrent", "Basil_Obukhov"];
			_htext	= "Hi man. My name is Vasily Obukhov . It is a strange place dude. But here, too, we need the money. Do you want to earn a few coins , and my location, make me one processing . Here nearby there is a strange place . Where land and grass flying up . I'll give you anomaly detector , go back and apply your location (the award in 2550 and 500 PopTabs REP.."; 
			_notification = "Find Gravi";
			player addItem _detector;
			player setVariable ["questAnomalyType", "gravi", true];
		} else {
			if (player getVariable ["questCurrent", ""] == "Basil_Obukhov") then {
				switch (true) do {
					case (_questItem in _inventoryItems): {
						call _fnc_taskComplited;
						_htext	= "Wow . You found an anomaly , now we have to carry this map to Ivan Demidov . You will find it in the eastern trade area.";
						_notification = "Find Ivan Demidov";
						player addItem 'H_PilotHelmetFighter_O';
					};
					case (_detector in _inventoryItems): {
						_notification = "You are already in a quest";
					};
					default {
						_htext	= "You are already in a quest";
						player setVariable ["questCurrent", ""];
					};
				};
			};
		};
	};
	
	case ('Ivan_Demidov'): {
		if (player getVariable ["questCurrent", ""] == "" && {"Basil_Obukhov" in _quests} && {!("Ivan_Demidov" in _quests)}) then {
			player setVariable ["questCurrent", "Ivan_Demidov"];
			_htext	= "Well, the day today. Where are you bro ? South Aero? .. Basil 's not calm down . Map brought ? Excellent. Here beside another . Learn it and mark on the map . Be careful. Do not come too close to it!"; 
			_notification = "Find anomaly meatgrinder";
			player addItem _detector;
			player setVariable ["questAnomalyType", "meat", true];
		} else {
			if (player getVariable ["questCurrent", ""] == "Ivan_Demidov") then {
				switch (true) do {
					case (_questItem in _inventoryItems): {
						call _fnc_taskComplited;
						_htext	= "Damn. Detector is fail. Well, what are you bro ? Ditching the Japanese unit . Okay. Lucky you today . I have a couple of girls Boris ... heh heh ... I exhaust device . take it  him.";
						_notification = "Find Boris Britva";
					};
					case (_detector in _inventoryItems): {
						_notification = "Please activate quest in Aero.";
					};
					default {
						_htext	= "You are already in a quest";
						player setVariable ["questCurrent", ""];
					};
				};
			} else {
				if ("Basil_Obukhov" in _quests) then {
					_notification = "Find Boris Britva";
				} else {
					_notification = "Find Basil Obuhov";
				};
			};
		};		
	};
	
	case ('Boris_Britva'): {
		if (player getVariable ["questCurrent", ""] == "" && {"Ivan_Demidov" in _quests} && {!("Boris_Britva" in _quests)}) then {
			player setVariable ["questCurrent", "Boris_Britva"];
			_htext	= "Good job dude. You have fulfilled the task ! So much of my respect and so money"; 
			_notification = "Find fire fluff";
			player addItem _detector;
			player setVariable ["questAnomalyType", "fluff", true];
		} else {
			if (player getVariable ["questCurrent", ""] == "Boris_Britva") then {
				switch (true) do {
					case (_questItem in _inventoryItems): {
						call _fnc_taskComplited;
						_htext	= "Good job... Good quest... Take prize!!";
						_notification = "Quest complite";
						player addItem 'U_O_CombatUniform_ocamo';
					};
					case (_detector in _inventoryItems): {
						_notification = "You are already in a quest";
					};
					default {
						_htext	= "You are already in a quest";
						player setVariable ["questCurrent", ""];
					};
				};
			} else {
				// квест завершён
			};
		};		
	};
};

if (_htext != "") then {
	hint parseText ( _title + _htext);
};

if (_notification != "") then {
	['Success',[_notification]] call ExileClient_gui_notification_event_addNotification;
};