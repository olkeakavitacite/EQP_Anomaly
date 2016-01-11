// fire fluff vitacite aka olke
 
_object = _this select 0;
_puch = "#particlesource" createVehicleLocal getPos _object;
 
_puch setParticleCircle [2, [0, 0, 0]];
_puch setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_puch setParticleParams [["\A3\data_f\cl_feathers2", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [8, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _object];
_puch setDropInterval 0.1;
