// Jarka.sqf for EQP create vitacite aka olke
 
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
