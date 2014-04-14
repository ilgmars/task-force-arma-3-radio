private ["_result","_request","_hintText", "_freq"];	
if ((TF_tangent_lr_pressed) and {alive player}) then {
	private "_radio";
	_radio = call TFAR_fnc_activeLrRadio;
	if ((_radio call TFAR_fnc_getAdditionalLrChannel) > -1) then {
	
		_freq = [_radio, (_radio call TFAR_fnc_getAdditionalLrChannel) + 1] call TFAR_fnc_GetChannelFrequency;;
	
		_hintText = format[localize "STR_additional_transmit_end",format ["%1<img size='1.5' image='%2'/>",[_radio select 0, "displayName"] call TFAR_fnc_getLrRadioProperty, getText(configFile >> "CfgVehicles"  >> typeof (_radio select 0) >> "picture")], (_radio call TFAR_fnc_getAdditionalLrChannel) + 1, _freq];	
		[parseText (_hintText), 2.5] call TFAR_fnc_showHint;
			
		_request = format["TANGENT_LR	RELEASED	%1%2	%3	%4", _freq, (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrRadioCode, ([_radio select 0, "tf_range"] call TFAR_fnc_getLrRadioProperty) * (call TFAR_fnc_getTransmittingDistanceMultiplicator), [_radio select 0, "tf_subtype"] call TFAR_fnc_getLrRadioProperty];
		if (isMultiplayer) then {
			_result = "task_force_radio_pipe" callExtension _request;
		};
		TF_tangent_lr_pressed = false;
	};
};
true