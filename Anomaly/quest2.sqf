private ["_title", "_htext"];
_itemToLookFor = "Exile_Item_TreasureMap";
_itemToLookFor2 = "MineDetector";

	if (_itemToLookFor in (uniformItems player)) then {

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Well, the day today. Where are you bro ? South Aero? .. Basil 's not calm down . Map brought ? Excellent. Here beside another . Learn it and mark on the map . Be careful. Do not come too close to it! "; 
		hint parseText ( _title + _htext);

		player removeItem "Exile_Item_TreasureMap";
		player addItem "MineDetector"; 
		["Success",["Find Meat Grinder for Ivan Demidov"]] call ExileClient_gui_notification_event_addNotification; 
		SET_QUEST2 = TRUE;

		} else 	{

			if  SET_QUEST2 then {

                   		["Whoops",["You are already being this quest"]] call ExileClient_gui_notification_event_addNotification;

				} else {

					if (_itemToLookFor2 in (uniformItems player)) then {
					_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
					_htext   = "Damn. Detector is fail. Well, what are you bro ? Ditching the Japanese unit . Okay. Lucky you today . I have a couple of girls Boris ... heh heh ... I exhaust device . take it  him ."; 
					hint parseText ( _title + _htext);
					["Success",["Find Boris Britva"]] call ExileClient_gui_notification_event_addNotification; 
					player addItem "Exile_Item_Magazine01"; 
					player removeItem "MineDetector";
			
					} else {
						playSound "anm";  
						uisleep 5;
						_htext   = "Please activate quest in Aero.";
						hint parseText ( _title + _htext);
		        	    		["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
					};
				};
                        };
