#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Initializes the "Duration" Zeus module attribute.
 *
 * Arguments:
 * 0: Duration control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _control call dumb_zeus_fnc_ui_attributeDuration
 *
 * Public: No
 */

params ["_control"];
private _display = ctrlParent _control;

_control ctrlRemoveAllEventHandlers "SetFocus";

private _edit = _control controlsGroupCtrl IDC_DURATION_DURATION;

_edit ctrlSetText QUOTE(CINEMA_BORDER_DEFAULT_DURATION);

private _fnc_onKeyUp = {
    params ["_display"];

    private _edit = _display displayCtrl IDC_DURATION_DURATION;
    private _duration = parseNumber (ctrlText _edit);

    // Handle invalid input
    if (_duration <= 0) then {
        _edit ctrlSetTooltip LLSTRING(invalidValue);
        _edit ctrlSetTextColor [1, 0, 0, 1];
    } else {
        _edit ctrlSetTooltip "";
        _edit ctrlSetTextColor [1, 1, 1, 1];
        _display setVariable [QGVAR(duration), _duration];
    };
};

_display call _fnc_onKeyUp;
_display displayAddEventHandler ["KeyUp", _fnc_onKeyUp];
