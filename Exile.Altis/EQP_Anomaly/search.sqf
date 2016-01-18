// Use marker on map
USE_MARKER = true; 
// _questcoord =  questnpc location for Altis [[_center],_radius,_name,_string,_lSign],[[_center],_radius,_name,_string,_lSign]];
_questcoord =
[
	[[14642.1,16888.2,0],15,'Basil_Obukhov',true],// Start EQP_Anomaly Quest in South Aero
	[[23332.1,24165.4,0],15,'Ivan_Demidov',true],// Unit 2 EQP_Anomaly Quest in East Tradezone
	[[3031.86,18148.8,0],15,'Boris_Britva',true]// Unit 3 EQP_Anomaly Quest in West Tradezone
];
if (isServer) exitWith 
{
		{
			_center = _x select 0;
			_radius = _x select 1;
			_name = _x select 2;	
			_lsign = _x select 3;

			if (_lSign) then
				{
				if (USE_MARKER) then { // проверка, что наносим метки с SAFEZONE на карту
					_marker = createMarker [format["QuestNPC:%1", _name], _center];
					_marker setMarkerType "selector_selectedMission";
					_marker setMarkerText "EQP_Anomaly Quest";
					_marker setMarkerColor "ColorRed";
				};
			};
	 } forEach _questcoord ; 
};                                                                                       
