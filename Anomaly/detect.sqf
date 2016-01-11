// vitacite aka olke anomaly detector
private ["_user",  "_title", "_htext"];
    
_user = (_this select 1);
_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>NEW TASK:</t><br/><t color='#ffffff'>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯<br/>";
playSound "anm";  

_htext   = "I give you anomaly detector. Reseach anomaly and take you prize.";
	hint parseText ( _title + _htext);
        uisleep 5;
 
waitUntil {!isNull player};
player removeItem "MineDetector";
player addItem "MineDetector"; 
if(true) exitWith{};
