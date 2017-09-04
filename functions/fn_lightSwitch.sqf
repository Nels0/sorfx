private ["_logic","_onoff","_range","_pos","_lightHit"];

_mode = param [0,"",[""]];
_input = param [1,[],[[]]];


_onoff = _logic getVariable ["Lights",1];
_range = _logic getVariable ["Range", 0];
_pos = getPos _logic;


switch _mode do {
	// Default object init
	case "init": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it's deactivated
		_isCuratorPlaced = _input param [2,false,[true]]; // True if the module was placed by Zeus
		_onoff = _logic getVariable ["Lights",1];
		_range = _logic getVariable ["Range", 0];
		_pos = getPos _logic;
	};
	// When some attributes were changed (including position and rotation)
	case "attributesChanged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_onoff = _logic getVariable ["Lights",1];
		_range = _logic getVariable ["Range", 0];
		_pos = getPos _logic;
	};
	// When added to the world (e.g., after undoing and redoing creation)
	case "registeredToWorld3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		// ... code here...
	};
	// When removed from the world (i.e., by deletion or undoing creation)
	case "unregisteredFromWorld3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_lightHit = 0;
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
	};
	// When object is being dragged
	case "dragged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		_onoff = _logic getVariable ["Lights",1];
		_range = _logic getVariable ["Range", 0];
		_pos = getPos _logic;
	};
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

{
	for "_i" from 0 to count getAllHitPointsDamage _x do
	{
		_x setHitIndex [_i, _lightHit];
	};
} 

forEach nearestObjects 
[
	_pos, 
	[
		"Lamps_base_F",
		"PowerLines_base_F",
		"PowerLines_Small_base_F"
	], 
	_range
]