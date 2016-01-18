// vitacite aka olke anomaly set quest
private ["_title", "_htext"];
_itemToLookFor = "Exile_Item_TreasureMap";

	if (_itemToLookFor in (uniformItems player)) then {
						
				_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ЗАДАНИЕ ПОИСК АНОМАЛИЙ:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
				_htext   = "Вау. ты нашел аномалию, теперь надо отнести эту карту Ивану Демидову. Ты найдешь его в Восточной торговой зоне..	"; 
				 hint parseText ( _title + _htext);
				["Success",["find Ivan Demidov"]] call ExileClient_gui_notification_event_addNotification; 

				} else {
						
	
		if  SET_QUEST1 then {

                   		["Whoops",["You are already in a quest"]] call ExileClient_gui_notification_event_addNotification;

					} else {
		        	        		
					_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ЗАДАНИЕ ПОИСК АНОМАЛИЙ:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
					_htext   = "Привет Осужденный. Меня зовут Василий Обухов. Это странное место чувак. Но тут тоже нужны деньги. Хочешь подзаработать пару монет, и мое расположение, сделай для меня одну работку. Тут неподалеку есть странное место. Где земля и трава летит вверх. Я дам тебе детектор аномалий, сходи туда и нанеси это место на карту (НАГРАДА 500 POPTABS и 2550 REP.)"; 
					hint parseText ( _title + _htext);
					["Success",["ЗАДАНИЕ ПОИСК АНОМАЛИЙ"]] call ExileClient_gui_notification_event_addNotification; 
					SET_QUEST1 = TRUE;                
					waitUntil {!isNull player};
					player removeItem "MineDetector";
					player addItem "MineDetector"; 
					if(true) exitWith{};
				};

			};
