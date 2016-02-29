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
_meat1 = "#particlesource" createVehicleLocal getPos _object;
_meat2 = "#particlesource" createVehicleLocal getPos _object;
_meat3 = "#particlesource" createVehicleLocal getPos _object;
_meat1 setParticleCircle [2, [0, 0, 0]];
_meat1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_meat1 setParticleParams [["\A3\data_f\Cl_fire", 16, 0, 16], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [10, 2, 4], [[1, 0.3, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_meat1 setDropInterval 0.1;
_meat2 setParticleCircle [2, [0, 0, 0]];
_meat2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_meat2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 5, [0, 0, 0], [0, 0, 3], 2, 12, 7.9, 0.075, [10, 2, 4], [[1, 0.3, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_meat2 setDropInterval 0.1;
_meat3 setParticleCircle [3, [0, 0, 0]];
_meat3	setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_meat3 setParticleParams [["\A3\data_f\cl_grass2", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0], 3, 10, 7.9, 0.075, [12, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_meat3 setDropInterval 0.05;

waitUntil {
 sleep 0.2;
 (isNull _object) || !(_object getVariable ["effectActivated", false])
};

deleteVehicle _meat1;
deleteVehicle _meat2;
deleteVehicle _meat3;

if (_useDebug) then {
	diag_log format["PTM: Anomaly effect deactivated: %1", _dedugAnomaly];
};