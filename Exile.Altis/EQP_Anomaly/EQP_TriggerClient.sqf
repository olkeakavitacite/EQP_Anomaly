/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

params["_anomaly", "_anomaly2"];
private["_debug"];

_debug = false;

if (_debug) then {
 diag_log format["PTM: Anomaly logic in client init start: %1", _anomaly];
};

waitUntil {sleep 0.2; isNil (_anomaly getVariable ['anomalyType', nil])};

_anomaly setTriggerArea [20, 20, 0, false]; // устанавливаем размеры на которых триггер срабатывает
_anomaly setTriggerActivation ['ANY', 'PRESENT', true]; // устанавливаем на кого он срабатывает

_anomaly setTriggerStatements [
	'this',
	format[
		"[thisTrigger] execVM 'EQP_Anomaly\%1.sqf';",  // Визуализация аномалии
		(_anomaly getVariable "anomalyType")
	],
	'thisTrigger setVariable ["effectActivated", false];'
];

//	idle effect
_anomaly2 setTriggerArea [200, 200, 0, false];
_anomaly2 setTriggerActivation ['ANY', 'PRESENT', true];

_anomaly2 setTriggerStatements [
	'alive player',
	'[thisTrigger] execVM "EQP_Anomaly\EQP_anomalyIdle.sqf";',
	'thisTrigger setVariable ["effectActivated", false];'
];

if (_debug) then {
	diag_log format["PTM: Anomaly logic in client activated: %1", _anomaly];
};