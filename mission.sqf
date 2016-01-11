/////////////////////////////////// find Item99 and change you spawn man to questman like 

class Item99
		{
			side="CIV";
			class Vehicles
			{
				items=1;
				class Item0
				{
					position[]={x.z.y}; //!!!!! CHANGE THIS TO YOU ALTIS COORD
					azimut=135;
					id=1;
					side="CIV";
					vehicle="C_Nikos";
					leader=1;
					skill=0.60000002;
					init= "this addAction[""<t color='#068600'>Anomaly quest</t>"",""anomaly\quest.sqf""];";
				};
			};
		};
	/////////////////////////////////// Go to Item99 and change you spawn man to questman like 
   //NEXT!!!!
	
	////class markers after---------------->
	
  ///////////////////////////////////	find sensor block and add (or create)
  class Sensors
	{
		items=2;
		class Item0
		{
			position[]={x,z,y}; //change for you coords .
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
			position[]={x.z.y}; // copy coords in first sensor
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
	  ///////////////////////////////////	find sensor block and add (or create)
