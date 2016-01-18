# EQP_Anomaly ver 1.8.0 [TEST.RELEASE] 18.01.2016 23:46 GMT+6
About: Exile RPG Stalker style project Credits Free for all use in Exilemod.com. Spawn 3 quest npc in Aero safezone (Basil Obuhov) step 1 quest, and East safezone (Ivan Demidov) step 2 quest, and West Safezone (Boris Britva) step 3 quest;
And 3 stalker style anomlay Gravi, Meat Grinder and Fire the fluff..
Quest Item: 
"MineDetector"; // For detect anomaly
"Exile_Item_TreasureMap"; // For fix anomaly
"Exile_Item_Magazine01"; // For Boris Britva :)
and sound pack file https://yadi.sk/d/f7NcLeHznHLcx

CHANGE LOG 1.8 (18.01.2016)
	1)  Added check to the fact of taking the quest ( to avoid dupe by car );
	2)  Adding anomaly sound pack (not inside need download https://yadi.sk/d/f7NcLeHznHLcx;
	3)  Fixing small bug and folder arh;
	4)  Starting second quest brucnh;
	5)  Fixing quest balance;

Installation:

	1) Soft Need: pbomanager, notepad++ or farmanager
	2) You need: 
		a) Unpack you mission file Exile.Altis.pbo use pbomanager
		b) Create Folder Anomaly like /Exile.Altis/EQP_Anomaly
	3) Download MasterFolder.zip
	4) Unpack in Arma3Server/Mpmission/Exile.Altis/EQP_Anomaly/
	5) Download and unpack and sound pack file https://yadi.sk/d/f7NcLeHznHLcx to  	
	   Arma3Server/Mpmission/Exile.Altis/EQP_Anomaly/snd/..
	6) Change you description.ini file to ->

	// ....GO TO LINE -> allowFunctionsRecompile = 0;
	////////////////////////////////////////  AND INSERT IF ANYWERE IN YOU NOT HAVE CfgSounds in DESCRIPTION
	class CfgSounds
	{
	/////// IF YOU HAVE CfgSound block INSERT this
	class anm
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "anm";
		// filename, volume, pitch
		sound[] = {"EQP_Anomaly\snd\anm.ogg", 1, 1};
		titles[] = {};
	};
	class meat
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "meat";
		// filename, volume, pitch
		sound[] = {"EQP_Anomaly\snd\meat.ogg", 1, 1};
		// subtitle delay in seconds, subtitle text 
		titles[] = {};
	};
	class ffluff
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "ffluff";
		// filename, volume, pitch
		sound[] = {"EQP_Anomaly\snd\ffluff.ogg", 1, 1};
		// subtitle delay in seconds, subtitle text 
		titles[] = {};
	};
	class gravi
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "gravi";
		// filename, volume, pitch
		sound[] = {"EQP_Anomaly\snd\gravi.ogg", 1, 1};
		// subtitle delay in seconds, subtitle text 
		titles[] = {};
	};

	/////// IF YOU HAVE CfgSound block INSERT this
	};
	////////////////////////////////////////  INSERT IF ANYWERE IN YOU NOT HAVE CfgSounds in DESCRIPTION
	// TO  #include "config.cpp"

	7) Change you init.sqf file to ->
	open (or create if need) you init.sqf and add to the top.

	// Set Anomaly Activity check 
	SET_QUEST1 = FALSE;
	SET_QUEST2 = FALSE;
	SET_QUEST3 = FALSE;

	8) Chage you mission.sqm  GOTO LINE 1034 
				class Item99
				{
					position[]={13239.08,16.010651,11685.795};
					special="NONE";
					id=99;
					side="GUER";
					vehicle="Exile_Unit_GhostPlayer";
					player="PLAY CDG";
					skill=0.60000002;
				};
			};
		};
	};
	// AND ADD AFTER LAST ;)
	//--------------------------------------- START INSERT THIS CODE------------------------------------------------------------
	//TODO NPC BLOCK FOR ANOMALY ACTIVITY QUEST
		class Vehicles
		{
			items=3;
			class Item0
			{
				position[]={14642.1,0,16888.2}; // Altis Airport safe zone trader Basil Obuhoiv
				azimut=135;
				id=1;
				side="CIV";
				vehicle="C_Nikos";
				leader=1;
				skill=0.60000002;
				init= "this addAction[""<t color='#068600'>ANOMALY ACTIVITY QUEST</t>"",""EQP_Anomaly\quest.sqf""];";
		};
		class Item1
		{
			position[]={23332.1,0,24165.4}; // East zone Ivan Demivod
			azimut=135;
			id=1;
			side="CIV";
			vehicle="C_man_p_beggar_F_euro";
			leader=1;
			skill=0.60000002;
			init= "this addAction[""<t color='#068600'>ANOMALY ACTIVITY QUEST</t>"",""EQP_Anomaly\quest2.sqf""];";
		};
		class Item2
		{
			position[]={3031.86,0,18148.8}; // West zone Boris Britva
			azimut=310;
			id=1;
			side="CIV";
			vehicle="B_Soldier_F";
			leader=1;
			skill=0.60000002;
			init="comment ""Remove existing items"";  removeAllWeapons this;  removeAllItems this;  removeAllAssignedItems this;  removeVest this;  removeBackpack this;  removeHeadgear this;  removeGoggles this; comment ""Add containers"";  this 	addHeadgear ""H_HelmetCrew_I"";  comment ""Add weapons"";  this addWeapon ""srifle_DMR_04_Tan_F"";  this addPrimaryWeaponItem ""acc_flashlight"";  this addPrimaryWeaponItem ""optic_KHS_tan"";  this addPrimaryWeaponItem ""bipod_02_F_tan"";  this addWeapon ""hgun_Pistol_heavy_01_F"";  this addHandgunItem ""muzzle_snds_acp"";  this addHandgunItem ""optic_MRD"";  this addWeapon ""Laserdesignator_02"";    comment ""Add items"";  this linkItem ""ItemMap"";  this linkItem ""ItemCompass"";  this linkItem ""ItemWatch"";  this linkItem ""ItemGPS"";  this linkItem ""NVGoggles_INDEP""; this addAction [""<t color='#068600'>ANOMALY ACTIVITY QUEST</t>"",""EQP_Anomaly\quest3.sqf""];";
		};
	};
	class Sensors
	{
		items=6;
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
			expActiv="XC=[thistrigger,10]execvm ""EQP_Anomaly\gravi.sqf""";
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
			expActiv="init = execVM ""EQP_Anomaly\detect.sqf"";";
			class Effects
			{
			};
		};
		class Item2
		{
			position[]={23393.9,0,24411.1}; // point 10m around Altis Airport safe zone
			a=10;
			b=10;
			angle=14.143009;
			activationBy="ANY";
			interruptable=1;
			age="UNKNOWN";
			expCond="true";
			expActiv="XC=[thistrigger,10]execvm ""EQP_Anomaly\meat.sqf""";
			class Effects
			{
			};
		};
		class Item3
		{
			position[]={23393.9,0,24411.1};
			a=30;
			b=30;
			activationBy="ANY";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="rad1_2";
			expCond="(vehicle player) in thislist;";
			expActiv="init = execVM ""EQP_Anomaly\detect2.sqf"";";
			class Effects
			{
			};
		};
		class Item4
		{
			position[]={2909.41,0,18351.6}; // point 10m around Altis Airport safe zone
			a=10;
			b=10;
			angle=14.143009;
			activationBy="ANY";
			interruptable=1;
			age="UNKNOWN";
			expCond="true";
			expActiv="XC=[thistrigger,10]execvm ""EQP_Anomaly\fluff.sqf""";
			class Effects
			{
			};
		};
		class Item5
		{
			position[]={2909.41,0,18351.6};
			a=30;
			b=30;
			activationBy="ANY";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="rad1_2";
			expCond="(vehicle player) in thislist;";
			expActiv="init = execVM ""EQP_Anomaly\detect3.sqf"";";
			class Effects
			{
			};
		};
	};
	// ---------------------------------------- END INSERT THIS ------------------------------------------------------------------
	// BEFORE class Markers
	9) This ALL
