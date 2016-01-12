# EQP_Anomaly ver 1.102. update 11.02.2016 22:06
Exile RPG Stalker style project Credits Free for all use in Exilemod.com

Installation:

1) Soft Need: pbomanager, notepad++ or farmanager

2) You need: 

а) Unpack you mission file Exile.Altis.pbo use pbomanager

б) Create Folder Anomaly like /Exile.Altis/Anomaly

в) Copy file  gravi.sqf , quest.sqf ,detect.sqf, and any anomaly sound like this https://yadi.sk/d/zWnh3GrLmnvb3 with name: anm.ogg in /Exile.Altis/Anomaly folder

г) Insert in you Desctription.ini link to ogg sound:

	class CfgSounds
	{
		class anm
		{
			// how the sound is referred to in the editor (e.g. trigger effects)
			name = "anm";
			// filename, volume, pitch
			sound[] = {"anomaly\anm.ogg", 1, 1};
			titles[] = {};
		};
	};

Step 5: Goto  class Item 99 in vanila Exilemod Altis map and change class Item99 like this:

	class Item99
		{
		position[]={14642.1,0,16888.2};
		azimut=135;
		id=1;
		side="CIV";
		vehicle="C_Nikos";
		leader=1;
		skill=0.60000002;
		init= "this addAction[""<t color='#068600'>Anomaly research quest</t>"",""anomaly\quest.sqf""];";
		};
	};
	};
	};
	class Sensors
	{
		items=2;
		class Item0
		{
			position[]={14514.4,0,17005.1};
			a=10;
			b=10;
			angle=14.143009;
			activationBy="ANY";
			interruptable=1;
			age="UNKNOWN";
			expCond="true";
			expActiv="XC=[thistrigger,10]execvm ""anomaly\gravi.sqf""";
			class Effects
			{
			};
		};
		class Item1
		{
			position[]={14514.4,0,17005.1};
			a=15;
			b=15;
			activationBy="ANY";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="rad1_2";
			expCond="(vehicle player) in thislist;";
			expActiv="init = execVM ""anomaly\detect.sqf"";";
			class Effects
			{
			};
		};
	};	



