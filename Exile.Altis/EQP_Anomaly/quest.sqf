// vitacite aka olke anomaly set quest
private ["_title", "_htext"];
_itemToLookFor = "Exile_Item_TreasureMap";

	if (_itemToLookFor in (uniformItems player)) then {
						
				_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
				_htext   = "Wow . You found an anomaly , now we have to carry this map to Ivan Demidov . You will find it in the eastern trade area.	"; 
				 hint parseText ( _title + _htext);
				["Success",["find Ivan Demidov"]] call ExileClient_gui_notification_event_addNotification; 

				} else {
						
	
		if  SET_QUEST1 then {

                   		["Whoops",["You are already in a quest"]] call ExileClient_gui_notification_event_addNotification;

					} else {
		        	        		
					_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
					_htext   = "Hi man. My name is Vasily Obukhov . It is a strange place dude. But here, too, we need the money. Do you want to earn a few coins , and my location, make me one processing . Here nearby there is a strange place . Where land and grass flying up . I'll give you anomaly detector , go back and apply your location (the award in 2550 and 500 PopTabs REP."; 
					hint parseText ( _title + _htext);
					["Success",["ANOMALY ACTIVITY TASK:"]] call ExileClient_gui_notification_event_addNotification; 
					SET_QUEST1 = TRUE;                
					waitUntil {!isNull player};
					player removeItem "MineDetector";
					player addItem "MineDetector"; 
					if(true) exitWith{};
				};

			};
