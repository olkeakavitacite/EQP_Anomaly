// vitacite aka olke detector anomaly and send money prize
private ["_title","_htext","_addpoptabs","_newPopTabs","_addrespect","_newScore"];

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> YOU FOUND AN ANOMALY BURNING FLUFF: </t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";

_itemToLookFor = "MineDetector";
if (_itemToLookFor in (uniformItems player)) then {
		playSound "ffluff";
		playSound "ffluff";
		uisleep 1;
			_htext   = "You have successfully studied the anomaly BURNING FLUFF and struck her on the map . Find Boris razors, and talk to him. ";
			hint parseText ( _title + _htext);

			_addrespect = 10000;
		    	_newScore = ExileClientPlayerScore + _addrespect;
	        		ENIGMA_UpdateStats = [player,0,_newScore];
			        publicVariableServer "ENIGMA_UpdateStats";

			uisleep 1;			

			_addpoptabs = 2500;
			_newPoptabs = ExileClientPlayerMoney + _addpoptabs;
				ENIGMA_UpdateStats = [player,_newPoptabs];
				publicVariableServer "ENIGMA_UpdateStats";
	SET_QUEST3 = FALSE;
// 	ExileClientPlayerMoney = ExileClientPlayerMoney + 500 ;
//	ExileClientPlayerScore = ExileClientPlayerScore + 50;
	
		["Success",["+ 2500 ExMoney"]] call ExileClient_gui_notification_event_addNotification;
		uisleep 1;			
		["Success",["+10000 Exp"]] call ExileClient_gui_notification_event_addNotification;		
				player removeItem "MineDetector";
				uisleep 1;			
	                       	player addItem "Exile_Item_TreasureMap"; 
				uisleep 5;
	} else {

		playSound "ffluff";  
		uisleep 5;
		_htext   = "No jobs to the study of anomalies";
		hint parseText ( _title + _htext);
                ["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
	};
