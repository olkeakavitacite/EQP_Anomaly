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

_gravi1 = "#particlesource" createVehicleLocal getPos _object;
_gravi2 = "#particlesource" createVehicleLocal getPos _object;
_gravi3 = "#particlesource" createVehicleLocal getPos _object;
_gravi1 setParticleCircle [3, [0, 0, 0]];
_gravi1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_gravi1 setParticleParams [["\A3\data_f\cl_rock1", 1, 0, 1], "", "SpaceObject", 1, 7, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [10, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_gravi1 setDropInterval 0.05;
_gravi2 setParticleCircle [0, [0, 0, 0]];
_gravi2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_gravi2 setParticleParams [["\A3\data_f\cl_grass2", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [5, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_gravi2 setDropInterval 0.05;
_gravi3 setParticleCircle [1, [0, 0, 0]];
_gravi3 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0];
_gravi3 setParticleParams [["\A3\data_f\ParticleEffects\Pstone\PStone.p3d", 8, 3, 1], "", "SpaceObject", 2, 7, [0, 0, 0], [0, 0, 3], 0.5, 4, 1, 0, [1, 1, 1], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_gravi3 setDropInterval 0.1;


waitUntil {
 sleep 0.2;
 (isNull _object) || !(_object getVariable ["effectActivated", false])
};

deleteVehicle _gravi1;
deleteVehicle _gravi2;
deleteVehicle _gravi3;

if (_useDebug) then {
	diag_log format["PTM: Anomaly effect deactivated: %1", _dedugAnomaly];
};