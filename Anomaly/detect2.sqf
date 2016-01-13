// vitacite aka olke detector anomaly and send money prize
private ["_title","_htext","_addpoptabs","_newPopTabs","_addrespect","_newScore"];

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> You found an anomaly called Meat grinder : </t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";

_itemToLookFor = "MineDetector";
if (_itemToLookFor in (uniformItems player)) then {
		playSound "anm";  
		uisleep 1;
			_htext   = "You search Meat grinder anomaly, but not research. Mission failed!. Return to Ivan Demidov and talk to him";
			hint parseText ( _title + _htext);
			_addrespect = -5;
		    	_newScore = ExileClientPlayerScore - _addrespect;
	        		ENIGMA_UpdateStats = [player,0,_newScore];
			        publicVariableServer "ENIGMA_UpdateStats";

			uisleep 1;			
				["Whoops",["-5 Exp"]] call ExileClient_gui_notification_event_addNotification;		
	} else {
		playSound "anm";  
		uisleep 5;
		_htext   = "You do not have jobs for the study of anomalies";
		hint parseText ( _title + _htext);
                ["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
	};
