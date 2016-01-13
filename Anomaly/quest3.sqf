private ["_title", "_htext"];

_itemToLookFor =  "Exile_Item_Magazine01";
_itemToLookFor2 = "MineDetector";
_itemToLookFor3 = "Exile_Item_TreasureMap";

	if (_itemToLookFor in (uniformItems player)) then 
	{

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anomaly search quest.</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Hi, convicted. I see my friend remembers his promises. good heifers. My name Boris Bitva, you can earn a few coins , if you study the anomaly to me . Find Fire the fluff anomaly and take you prize. Take this MineDetector his help you! "; 
		hint parseText ( _title + _htext);

			player removeItem "Exile_Item_Magazine01";
			player addItem "MineDetector"; 
			["Success",["Find Fire the fluff anomaly for Boris Britva"]] call ExileClient_gui_notification_event_addNotification; 
	
		} else 	{
				if (_itemToLookFor3 in (uniformItems player)) then {
				_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Anomaly search quest.</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";

				_htext   = "Goof job my friend you quest complite!!!!"; 
				hint parseText ( _title + _htext);
				["Success",["All quest complite"]] call ExileClient_gui_notification_event_addNotification; 

				_addrespect = 500;
			    	_newScore = ExileClientPlayerScore + _addrespect;
	        			ENIGMA_UpdateStats = [player,0,_newScore];
				        publicVariableServer "ENIGMA_UpdateStats";
						["Success",["+ 500 Exp"]] call ExileClient_gui_notification_event_addNotification;
				uisleep 1;			

				_addpoptabs = 500;
				_newPoptabs = ExileClientPlayerMoney + _addpoptabs;
					ENIGMA_UpdateStats = [player,_newPoptabs];
					publicVariableServer "ENIGMA_UpdateStats";
						["Success",["+ 500 ExMoney"]] call ExileClient_gui_notification_event_addNotification;

				player removeItem "Exile_Item_TreasureMap";

				} else {
					playSound "anm";  
					uisleep 5;
					_htext   = "You need Anomaly search quest.. Find Basil Obuhov for start it.";
					hint parseText ( _title + _htext);
		            		["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
				};
			};
