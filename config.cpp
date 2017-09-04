class CfgPatches
{
	class 160_Lights
	{
		author = "Nels0";
		units[] = {"SORFX_lightSwitch"};
		requiredVersion= 1.60
		requiredAddons[] = {"A3_Modules_F","A3_Modules_F_Curator"};
	};
};

class CfgFunctions
{
	class SORFX
	{
		tag = "SORFX";
		class main
		{
			file = "SORFX\functions";
			class lightSwitch;
		};

	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class SORFX_lightSwitch: NO_CATEGORY
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
		};
	};
	class SORFX_modulelights: Module_F
	{
		scope = 2;
		displayName = "Light Switch";
		category = "SOR Effects";
		vehicleClass = "Modules";
		function = "SORFX_fnc_lightSwitch";
		is3DEN = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		functionPriority = 1;
		isGlobal = 2; //Not sure what 1 vs 2 is

		class Atrributes: AttributesBase
		{

		};
		class ModuleDescription: ModuleDescription
		{
			description = "Turns lights on or off."
		};
	};
};

