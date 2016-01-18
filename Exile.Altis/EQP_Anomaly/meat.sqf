// Meat anomaly for EQP create -- vitacite aka olke
 
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
