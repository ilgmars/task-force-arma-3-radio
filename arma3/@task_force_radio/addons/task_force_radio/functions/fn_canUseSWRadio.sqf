private ["_player","_result","_depth"];

_result = false;
_depth = _this select 3;

if (_depth > 0) then {
	_result = true;
} else {
	_player = _this select 0;
	if ((_this select 2) and {_depth > -1} and {vehicle _player != _player}) then {
		if ((_this select 1) or {isAbleToBreathe _player}) then {
			_result = true;
		};
	};
};
_result