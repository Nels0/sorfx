//off = []

params ["_onoff","_pos","_range",];

_types = ["Lamps_Base_F", "PowerLines_base_F","Land_PowerPoleWooden_L_F"];


for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
	{
		_lamps = _pos nearObjects [_types select _i, _range];
		sleep 1;
	{_x setDamage _onoff} forEach _lamps;
};
