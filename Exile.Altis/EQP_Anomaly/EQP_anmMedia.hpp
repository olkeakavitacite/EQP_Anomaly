/* Attention particle animation and this code is copyrighted , it can be used freely only with the mod Exile. Do not modify! No modifications in their use!
Author animation olke 2014-2015 , script code the SteelRat & olke 2016 */

class CfgSounds
{
	sounds[]={};
	class gazmask
	{
		name = "gazmask";
		sound[] = {"EQP_Anomaly\ogg\gazmask.ogg", 2, 1};
		titles[]={};
	};
	class anm
	{
		name = "anm";
		sound[] = {"EQP_Anomaly\ogg\anm.ogg", 1, 1};
		titles[] = {};
	};
	class geiger
	{
		name = "geiger";
		sound[] = {"EQP_Anomaly\ogg\geiger.ogg", db-10, 1.0};
		titles[] = {};
	};
	class electro
	{
		name = "electro";
		sound[] = {"EQP_Anomaly\ogg\electro.ogg", db-10, 1.0};
		titles[] = {};
	};
};
class RscTitles
{	
	class gazmask {
	idd = -1;
	movingEnable = 0;
	duration = 10000;
	fadein = 0;
	fadeout = 0;
	name="gazmask";
	controls[]={"gazmask"};

	class gazmask {
		x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
		text="EQP_Anomaly\paa\gazmask2.paa";
		sizeEx = 1;
		type=0;
		idc=-1;
		style=48;
		colorBackground[]={0,0,0,0};
		colorText[]={1,1,1,1};
		font="PuristaLight";
		};
	};
};