// vitacite aka olke anomaly set quest
private ["_title", "_htext"];
_itemToLookFor = "Exile_Item_TreasureMap";

	if (_itemToLookFor in (uniformItems player)) then {

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anomaly search quest.</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Hi, convicted. O.. anomaly research document... you need take this Ivan Demidov on ... Trade zone .	"; 
		 hint parseText ( _title + _htext);

		["Success",["find Ivan Demidov"]] call ExileClient_gui_notification_event_addNotification; 

	} else {

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anomaly search quest.</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Hi, convicted. My name is Basil Obuhov. there is a strange place ...Hmm.. If you want to earn some money , I'll give you mine detectors . Learn a strange place , and I will reward you (prize 500 Exmoney and 50 Exp)"; 
		 hint parseText ( _title + _htext);

		["Success",["You have anomaly quest"]] call ExileClient_gui_notification_event_addNotification; 

		waitUntil {!isNull player};
		player removeItem "MineDetector";
		player addItem "MineDetector"; 
		if(true) exitWith{};
};
