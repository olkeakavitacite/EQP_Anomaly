// Gravi.sqf: Gravy animation for EQP project create in Particle Editor vitacite aka olke - in DAP s.t.a.l.k.e.r style 
_object = _this select 0;
 
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
