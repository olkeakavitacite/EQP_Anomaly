/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

private["_detector", "_questItem"];

_detector = 'MineDetector';
_questItem = 'Exile_Item_TreasureMap';

{
	if (_x isKindOf "Man") then {		
		_inventoryItems = (uniformItems _x) + (vestItems _x) + (backpackItems _x);

		if (_detector in _inventoryItems && {(_anomaly getVariable "anomalyType") == (_x getVariable ["questAnomalyType", ""])}) exitWith {
			[(_anomaly getVariable "anomalyType"), "EQP_Anomaly\EQP_QuestDetect.sqf"] remoteExec ["execVM", (owner _x)]; 
			playSound "anm";
			_x addItem _questItem;
			_x removeItem _detector;
			remoteExec ["", (_anomaly getVariable "anomalyTriggerClient_remoteExecID")];

			if (!isNil {_anomaly getVariable ["anomaly2", nil]}) then {
				deleteVehicle (_anomaly getVariable "anomaly2");
			};
			deleteVehicle _anomaly;
			
			_x setVariable ["questAnomalyType", "", true];
		};
		_x setDammage 1;
		if (_questItem in _inventoryItems) then {
			_x removeItem _questItem;
		} else {
			_x setDammage 1;
		};
	};
} forEach _units;
