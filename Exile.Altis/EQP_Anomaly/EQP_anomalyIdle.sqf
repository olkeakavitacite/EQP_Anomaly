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

// визуальный эффект
_idleeffect1 = "#particlesource" createVehicleLocal getPos _object;
_idleeffect2 = "#particlesource" createVehicleLocal getPos _object;


_idleeffect1 setParticleCircle [0, [0, 0, 0.3]];
_idleeffect1 setParticleRandom [0.5, [0.25, 0.25, 0.2], [0.175, 0.175, 0], 0.1, 0.25, [0.1, 0.1, 0.1, 0.1], 0.1, 0.1];
_idleeffect1 setParticleParams  [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1],"","Billboard",1,5,[0,0,1],[0,0,0],12,0.5,0.395,0,[0.3,4,3,4],[[1,1,1,1],[1,1,1,0.7],[1,1,1,0]],[0.1,0.8],0,0,"","", _object];
_idleeffect1 setDropInterval 4;

_idleeffect2 setParticleCircle [0, [0, 0, 0]];
_idleeffect2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_idleeffect2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\SparksBall", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 0, 5, 1, 0.075, [0.1, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_idleeffect2 setDropInterval 0.05;

waitUntil {
 sleep 0.2;
 (isNull _object) || !(_object getVariable ["effectActivated", false]) 
};

deleteVehicle _idleeffect2;
deleteVehicle _idleeffect1;

if (_useDebug) then {
	diag_log format["PTM: Anomaly effect deactivated: %1", _dedugAnomaly];
};