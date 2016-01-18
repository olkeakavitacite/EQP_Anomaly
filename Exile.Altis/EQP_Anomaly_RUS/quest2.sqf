private ["_title", "_htext"];
_itemToLookFor = "Exile_Item_TreasureMap";
_itemToLookFor2 = "MineDetector";

	if (_itemToLookFor in (uniformItems player)) then {

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ЗАДАНИЕ ПОИСК АНОМАЛИЙ:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Ну и денек сегодня. Откуда ты братан? А аэро.. Васек все не угомониться. Карту принес? Отлично. Тут рядышком еще одна. Изучи ее и нанеси метку на карту. Будь осторожнее. Не подходи к ней слишком близко! "; 
		hint parseText ( _title + _htext);

		player removeItem "Exile_Item_TreasureMap";
		player addItem "MineDetector"; 
		["Success",["Find Meat Grinder for Ivan Demidov"]] call ExileClient_gui_notification_event_addNotification; 
		SET_QUEST2 = TRUE;

		} else 	{

			if  SET_QUEST2 then {

                   		["Whoops",["ВЫ УЖЕ ПРОХОДИТЕ ЭТОТ КВЕСТ"]] call ExileClient_gui_notification_event_addNotification;

				} else {

					if (_itemToLookFor2 in (uniformItems player)) then {
					_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ЗАДАНИЕ ПОИСК АНОМАЛИЙ:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
					_htext   = "Вот блин. Пожег детектор. Ну ты чего братан? Угробил японский прибор. Ладно. Везет тебе сегодня. Я тут отдалживал девченок у Бориса... хе хе ... Отработаешь мне прибор. Отвезешь девченок ему."; 
					hint parseText ( _title + _htext);
					["Success",["Find Boris Britva"]] call ExileClient_gui_notification_event_addNotification; 
					player addItem "Exile_Item_Magazine01"; 
					player removeItem "MineDetector";
			
					} else {
						playSound "anm";  
						uisleep 5;
						_htext   = "СНАЧАЛА АКТИВИРУЙТЕ КВЕСТ В АЭРО.";
						hint parseText ( _title + _htext);
		        	    		["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
					};
				};
                        };
