// Electra for EQP vitacite aka olke
_object = _this select 0;
_electra = "#particlesource" createVehicleLocal getPos _object;
 
_electra setParticleCircle [0, [0, 0, 0]];
_electra setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_electra setParticleParams [["\A3\data_f\blesk2", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0], 0, 0, 0, 0, [0.1, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_electra setDropInterval 0.05;
// Fire  vitacite aka olke
