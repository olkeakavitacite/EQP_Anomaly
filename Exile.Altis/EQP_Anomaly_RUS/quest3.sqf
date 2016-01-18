private ["_title", "_htext"];

_itemToLookFor =  "Exile_Item_Magazine01";
_itemToLookFor2 = "MineDetector";
_itemToLookFor3 = "Exile_Item_TreasureMap";

	if (_itemToLookFor in (uniformItems player)) then 
	{

		_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ЗАДАНИЕ ПОИСК АНОМАЛИЙ:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
		_htext   = "Привет мужик. Я смотрю Иван вернул свой должок. Меня зовут Борис Бритва. Это хорошо когда друзья помнят о своих долгах - правда? Тут рядом есть странная хрень. Белый пух который жалит, как пчелы. Возьми детектор и нанеси его на карту.  "; 
		hint parseText ( _title + _htext);

			player removeItem "Exile_Item_Magazine01";
			player addItem "MineDetector"; 
			["Success",["Find Fire the fluff anomaly for Boris Britva"]] call ExileClient_gui_notification_event_addNotification; 
                    	SET_QUEST3 = TRUE;
				
		} else 	{


			if  SET_QUEST3 then {

	                   		["Whoops",["ВЫ УЖЕ ПРОХОДИТЕ ЭТОТ КВЕСТ"]] call ExileClient_gui_notification_event_addNotification;

				} else {

					if (_itemToLookFor3 in (uniformItems player)) then {
					_title  = "<t color='#7FFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>ЗАДАНИЕ ПОИСК АНОМАЛИЙ:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
					_htext   = "Хорошая работа чувак. Ты выполнил задание! Вот тебе от меня респект и уважуха."; 
					hint parseText ( _title + _htext);
					["Success",["ВСЕ ЗАДАЧИ УПЕШНО ВЫПОЛНЕНЫ!"]] call ExileClient_gui_notification_event_addNotification; 

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
					_htext   = "СНАЧАЛА АКТИВИРУЙТЕ КВЕСТ В АЭРО.";
					hint parseText ( _title + _htext);
		            		["Whoops",[_htext]] call ExileClient_gui_notification_event_addNotification;
				};
			};
		};
