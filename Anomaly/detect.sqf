// vitacite aka olke detector anomaly and send money prize
private ["_user","_title","_htext"];
_user = (_this select 1);

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> ANOMALY DETECTED: </t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
  
_itemToLookFor = "MineDetector"; // quest item.

if (_itemToLookFor in (uniformItems player)) then {
				playSound "anm";  
				uisleep 5;
				player removeItem "MineDetector"; // delete quest item..
				_htext   = " You research anomaly take money....";. // write you text in
        ExileClientPlayerMoney = ExileClientPlayerMoney + 500 ; //set 500 Emoney
				hint parseText ( _title + _htext); // output hint on screen 
			} else {              // if you not have minedetector 
				_htext   = " not task for Anomaly quest."; //  write you text in
				hint parseText ( _title + _htext); // output hint on screen
		};
