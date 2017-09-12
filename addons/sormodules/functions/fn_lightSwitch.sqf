disableSerialization;

private ["_logic","_onoff","_range","_pos","_lightHit","_posLast","_rangeLast","_checkLast"];

_mode = param [0,"",[""]];
_input = param [1,[],[[]]];

_logic = _input param [0,objNull,[objNull]];
_onoff = _logic getVariable ["Lights",1];
_range = _logic getVariable ["Range", 0];
_pos = getPos _logic;

//get saved variables
_posLast = _logic getVariable["positionLast",objNull];
_rangeLast = _logic getVariable["rangeLast",0];

switch _mode do {
	// Default object init
	case "init": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it's deactivated
		_isCuratorPlaced = _input param [2,false,[true]]; // True if the module was placed by Zeus
		_onoff = _logic getVariable ["Lights",1];
		_range = _logic getVariable ["Range", 0];
		_pos = getPos _logic;
		//_logic setVariable ["",];
	};
	// When some attributes were changed (including position and rotation)
	case "attributesChanged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_onoff = _logic getVariable ["Lights",1];
		_range = _logic getVariable ["Range", 0];
		_pos = getPos _logic;
		_checklast = true;
	};
	// When added to the world (e.g., after undoing and redoing creation)
	case "registeredToWorld3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		// ... code here...
	};
	// When removed from the world (i.e., by deletion or undoing creation)
	case "unregisteredFromWorld3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_onoff = true;
	};
	// When connection to object changes (i.e., new one is added or existing one removed)
	case "connectionChanged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_isActivated = _input param [1,true,[true]];
		switch (_isActivated) do { 
			case true : { _onoff = false }; 
			case false : { _onoff = true }; 
			default { _onoff = true }; 
		};
		_checklast = true;
	};
	// When object is being dragged
	case "dragged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_onoff = _logic getVariable ["Lights",1];
		_range = _logic getVariable ["Range", 0];

		_checklast = true;
	};
};

//turn last lights back on
if (_checkLast) then {
	{for "_i" from 0 to count getAllHitPointsDamage _x do { _x setHitIndex [_i, 0];};} forEach nearestObjects [	_posLast, [ "Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], _rangeLast];
};

switch (_onoff) do { 
	case false : {
		_lightHit = 0.97;
	}; 
	case true : 
	{
		_lightHit = 0;
	}; 
};


{for "_i" from 0 to count getAllHitPointsDamage _x do { _x setHitIndex [_i, _lightHit];};} forEach nearestObjects [	_pos, [ "Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], _range];


//save previous positions
_logic setVariable["positionLast", _pos];
_logic setVariable["rangeLast", _range];

true 

