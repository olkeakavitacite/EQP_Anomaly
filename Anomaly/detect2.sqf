private ["_title","_htext","_addpoptabs","_newPopTabs","_addrespect","_newScore"];

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> YOU FOUND AN ANOMALY MEATGRINDER: </t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
_itemToLookFor = "MineDetector";
if (_itemToLookFor in (uniformItems player)) then {
		playSound "meat";  
		playSound "meat";
		playSound "meat"; 
		uisleep 1;
			_htext   = "You found an anomaly MEATGRINDER . But the detector seems broken. You need to find Ivan Demidov and tell him about the problems. ATTENTION AVAILABLE second branch : Stalkers . The task. Find stalkers and repair the detector . (in developing) ";
			hint parseText ( _title + _htext);
			_addrespect = -5;
		    	_newScore = ExileClientPlayerScore - _addrespect;
	        		ENIGMA_UpdateStats = [player,0,_newScore];
			        publicVariableServer "ENIGMA_UpdateStats";

			uisleep 1;			
				["Whoops",["-5 Exp"]] call ExileClient_gui_notification_event_addNotification;		
			SET_QUEST2 = FALSE;
	} else {
		playSound "meat";  
		uisleep 5;
		_htext   = "No jobs to the study of anomalies";
		hint parseText ( _title + _htext);
                ["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
	};
