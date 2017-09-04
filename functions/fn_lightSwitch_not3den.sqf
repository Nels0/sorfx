
//params ["_onoff","_pos","_range",];
private ["_logic","_onoff","_range","_pos","_lightHit"];

_logic = _this param [0,objnull,[objnull]];
_activated = _this param [2,true,[true]];

if (_activated) then{
	_onoff = _logic getVariable ["Lights",1];
	_range = _logic getVariable ["Range", 0];
	_pos = getPos _logic;
	switch (_onoff) do { 
		case false : {
			systemChat "0.97";
			_lightHit = 0.97;
		}; 
		case true : 
		{
			systemChat "0";
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
	];

};