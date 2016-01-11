// vitacite aka olke anomaly set quest
private ["_title", "_htext"];
_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'> New task: Anomaly search quest: (+ 500 Exmoney and 50 Exp)</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
playSound "anm";  

_htext   = "Hi, convicted. I'll give you anomaly detector. Find anomaly called Gravi study it and get reward."; 
	hint parseText ( _title + _htext);
        uisleep 5;
 
waitUntil {!isNull player};
player removeItem "MineDetector";
player addItem "MineDetector"; 
if(true) exitWith{};
