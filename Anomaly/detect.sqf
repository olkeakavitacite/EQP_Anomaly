// vitacite aka olke detector anomaly and send money prize
private ["_title","_htext"];

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> You found an anomaly called Gravi : </t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
_itemToLookFor = "MineDetector";

if (_itemToLookFor in (uniformItems player)) then {
				playSound "anm";  
				uisleep 5;
				player removeItem "MineDetector";
				_htext   = "You learned Gravi anomaly and received an award";
				hint parseText ( _title + _htext);
				ExileClientPlayerMoney = ExileClientPlayerMoney + 500 ;
                                ExileClientPlayerScore = ExileClientPlayerScore + 50;
			} else {
				playSound "anm";  
				uisleep 5;
				_htext   = "You do not have jobs for the study of anomalies";
				hint parseText ( _title + _htext);
		};
