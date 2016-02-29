/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

private["_dedugAnomaly"];
_useDebug = true;
_object = _this select 0;
_object setVariable ["effectActivated", true];

if (_useDebug) then {
	_dedugAnomaly = format["%1", _object];
	diag_log format["PTM: Anomaly effect activated: %1", _dedugAnomaly];
};

_object = _this select 0;
_jarka1 = "#particlesource" createVehicleLocal getPos _object;
_jarka2 = "#particlesource" createVehicleLocal getPos _object;
_jarka1 setParticleCircle [3, [0, 0, 0]];
_jarka1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_jarka1 setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_jarka1 setDropInterval 0.05;
_jarka2 setParticleCircle [0, [0, 0, 0]];
_jarka2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_jarka2 setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1.2, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_jarka2 setDropInterval 0.05;


waitUntil {
 sleep 0.2;
 (isNull _object) || !(_object getVariable ["effectActivated", false])
};

deleteVehicle _jarka1;
deleteVehicle _jarka2;

if (_useDebug) then {
	diag_log format["PTM: Anomaly effect deactivated: %1", _dedugAnomaly];
};