// vitacite aka olke detector anomaly and send money prize
private ["_title","_htext","_addpoptabs","_newPopTabs","_addrespect","_newScore"];

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> ВЫ ОБНАРУЖИЛИ АНОМАЛИЮ - МЯСОРУБКА: </t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";

_itemToLookFor = "MineDetector";
if (_itemToLookFor in (uniformItems player)) then {
		playSound "meat";  
		playSound "meat";
		playSound "meat"; 
		uisleep 1;
			_htext   = "Вы нашли аномалию Мясорубка. Но детектор похоже сломан.  Вам необходимо разыскать Ивана Демидова и рассказать ему о проблем. ВНИМАНИЕ ДОСТУПНА ВТОРАЯ ВЕТКА: Сталкеры. Задание. Найди сталкеров и почини детектор. (в разработке) ";
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
		_htext   = "НЕТ ЗАДАНИЙ НА ИЗУЧЕНИЕ АНОМАЛИЙ";
		hint parseText ( _title + _htext);
                ["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
	};
