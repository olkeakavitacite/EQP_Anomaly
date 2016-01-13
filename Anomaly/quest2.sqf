private ["_title", "_htext"];
_itemToLookFor = "Exile_Item_TreasureMap";
_itemToLookFor2 = "MineDetector";

	if (_itemToLookFor in (uniformItems player)) then 
	{

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anomaly search quest.</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Hi, convicted. My name Ivan, you can earn a few coins , if you study the anomaly to me . Find Jarka and take you prize. Take this MineDetector his help you! "; 
		hint parseText ( _title + _htext);

			player removeItem "Exile_Item_TreasureMap";
			player addItem "MineDetector"; 
			["Success",["Find Meat Grinder for Ivan Demidov"]] call ExileClient_gui_notification_event_addNotification; 

		} else 	{
				if (_itemToLookFor2 in (uniformItems player)) then {
				_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anomaly search quest.</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
				_htext   = "Oh... a see you failure mission... But you need money.. hm Take the magazine and give it to my friend Boris Britva."; 
				hint parseText ( _title + _htext);
				["Success",["Find Boris Britva"]] call ExileClient_gui_notification_event_addNotification; 
				player addItem "Exile_Item_Magazine01"; 
				player removeItem "MineDetector";
			
		} else {
					playSound "anm";  
					uisleep 5;
					_htext   = "Find Basil Obuhoiv for start quest";
					hint parseText ( _title + _htext);
		            		["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
				};
			};
