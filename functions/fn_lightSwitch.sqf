//off = []

//params ["_onoff","_pos","_range",];

/*
for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
	{
		_lamps = _pos nearObjects [_types select _i, _range];
		sleep 1;
	{_x setDamage _onoff} forEach _lamps;
};
*/

_mode = param [0,"",[""]];
_input = param [1,[],[[]]];
_onoff = param

_types = ["Lamps_Base_F", "PowerLines_base_F","Land_PowerPoleWooden_L_F"];

_pos = 

switch _mode do {
	// Default object init
	case "init": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it's deactivated
		_isCuratorPlaced = _input param [2,false,[true]]; // True if the module was placed by Zeus
		
		for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
		{
			_lamps = _pos nearObjects [_types select _i, _range];
			sleep 1;
		{_x setDamage _onoff} forEach _lamps;

	};
	// When some attributes were changed (including position and rotation)
	case "attributesChanged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		// ... code here...
	};
	// When added to the world (e.g., after undoing and redoing creation)
	case "registeredToWorld3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic

		for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
		{
			_lamps = _pos nearObjects [_types select _i, _range];
			sleep 1;
		{_x setDamage _onoff} forEach _lamps;
	};
	// When removed from the world (i.e., by deletion or undoing creation)
	case "unregisteredFromWorld3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		
		_onoff = 0; //Repair lights when module deleted.

		for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
		{
			_lamps = _pos nearObjects [_types select _i, _range];
			sleep 1;
		{_x setDamage _onoff} forEach _lamps;
};
	};
	// When connection to object changes (i.e., new one is added or existing one removed)
	case "connectionChanged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		// ... code here...
	};
	// When object is being dragged
	case "dragged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		// ... code here...
	};
};