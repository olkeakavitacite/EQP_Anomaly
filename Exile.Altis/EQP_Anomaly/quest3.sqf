private ["_title", "_htext"];

_itemToLookFor =  "Exile_Item_Magazine01";
_itemToLookFor2 = "MineDetector";
_itemToLookFor3 = "Exile_Item_TreasureMap";

	if (_itemToLookFor in (uniformItems player)) then 
	{

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";

		_htext   = "Hello man. I watch Ivan returned the favor . My name is Boris Britva . It's good when friends remember their debt - is not it? Here there are a number of strange crap . White fluff that stings like a bee . Take the detector and apply it on the map "; 
		hint parseText ( _title + _htext);

			player removeItem "Exile_Item_Magazine01";
			player addItem "MineDetector"; 
			["Success",["Find Fire the fluff anomaly for Boris Britva"]] call ExileClient_gui_notification_event_addNotification; 
                    	SET_QUEST3 = TRUE;
				
		} else 	{


			if  SET_QUEST3 then {

	                   		["Whoops",["You are already being this quest"]] call ExileClient_gui_notification_event_addNotification;

				} else {

					if (_itemToLookFor3 in (uniformItems player)) then {
					_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ANOMALY ACTIVITY TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
					_htext   = "Good job dude. You have fulfilled the task ! So much of my respect and so money "; 
					hint parseText ( _title + _htext);
					["Success",["ALL TASK COMPLETE!"]] call ExileClient_gui_notification_event_addNotification; 

					_addrespect = 500;
			    		_newScore = ExileClientPlayerScore + _addrespect;
	        				ENIGMA_UpdateStats = [player,0,_newScore];
					        publicVariableServer "ENIGMA_UpdateStats";
							["Success",["+ 500 REP"]] call ExileClient_gui_notification_event_addNotification;
					uisleep 1;			

					_addpoptabs = 500;
					_newPoptabs = ExileClientPlayerMoney + _addpoptabs;
						ENIGMA_UpdateStats = [player,_newPoptabs];
						publicVariableServer "ENIGMA_UpdateStats";
							["Success",["+ 500 Pop Tabs"]] call ExileClient_gui_notification_event_addNotification;

						player removeItem "Exile_Item_TreasureMap";
	                        		SET_QUEST1 = FALSE;
						SET_QUEST2 = FALSE;
						SET_QUEST3 = FALSE;
			
			} else {
					playSound "anm";  
					uisleep 5;
					_htext   = ""Please activate quest in Aero.";
					hint parseText ( _title + _htext);
		            		["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
				};
			};
		};
