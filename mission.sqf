	
// GOTO class Item99 in vanila Exile.mod mission and change ->>>> 				
				class Item99
				{
					position[]={14642.1,0,16888.2}; // Altis Airport safe zone trader
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
			position[]={14514.4,0,17005.1}; // point 10m around Altis Airport safe zone
			a=10;
			b=10;
			angle=14.143009;
			activationBy="ANY";
			interruptable=1;
			age="UNKNOWN";
			expCond="true";
			expActiv="XC=[thistrigger,10]execvm ""anomaly\a3gravi.sqf""";
			class Effects
			{
			};
		};
		class Item1
		{
			position[]={14514.4,0,17005.1};
			a=30;
			b=30;
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
// GOTO class Item99 in vanila Exile.mod mission and change ->>>> 				
