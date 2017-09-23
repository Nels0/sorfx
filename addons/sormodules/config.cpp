class CfgPatches
{
	class sorfx_sormodules
	{
		author = "Nels0";
		units[] = {"sorfx_modulelights"};
		requiredVersion= 1.60;
		requiredAddons[] = {"A3_Modules_F","A3_Modules_F_Curator"};
	};
};


class CfgFunctions
{
	class sorfx
	{	
		tag = "sorfx";
		class main
		{
			file = "sormodules\functions";
			class lightSwitch {
   				 file = "\s\SORFX\addons\sormodules\functions\fn_lightSwitch.sqf";
			};
			//class lightSwitch_not3den;
		};
	};
};



class CfgFactionClasses
{
	class NO_CATEGORY;
	class SORFX_MODULES: NO_CATEGORY
	{
		displayName = "SOR Effects";
	};
};


class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit; // Default edit box (i.e., text input field)
			class Combo; // Default combo box (i.e., drop-down menu)
			class Checkbox; // Default checkbox (returned value is Bool)
			class CheckboxNumber; // Default checkbox (returned value is Number)
			class ModuleDescription; // Module description
			class Units; // Selection of units on which the module is applied
		};
		class ModuleDescription
		{
			class EmptyDetector;
			class AnyAI;
		};
	};
	class sorfx_modulelights: Module_F
	{
		scope = 2;
		displayName = "Light Switch";
		category = "SORFX_MODULES";
		vehicleClass = "Modules";
		function = "sorfx_fnc_lightSwitch";
		is3DEN = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		functionPriority = 1;
		isGlobal = 1; //Not sure what 1 vs 2 is

		class Arguments
		{
			class Lights
			{
				displayName = "Lights";
				description = "Set lights on or off or on again";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class Range
			{
				displayName = "Range";
				description = "Radius of lights to turn off";
				typeName = "NUMBER";
				defaultValue = 0;
			};

		};
		class ModuleDescription: ModuleDescription
		{
			description = "Turns lights on or off.";
		};
	};
	class sorfx_modulelights3DEN: sorfx_modulelights //Ol reliable function.
	{
		displayName = "Light Switch (not 3DEN)";
		function = "sorfx_fnc_lightSwitch_not3den";
		is3DEN = 0;
		scope = 2;
	};
};

