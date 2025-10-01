#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Handles the onLoad for the spacesDebrisPreset attribute
 *
 * Arguments:
 * 0: Control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _ctrlGroup call dumb_modules_fnc_3DEN_spacesDebrisPresetOnLoad;
 *
 * Public: No
 */

params ["_ctrl"];
TRACE_1("fnc_3DEN_spacesDebrisPresetOnLoad",_ctrl);

lbClear _ctrl;
private _order = [];

{
    _y params ["_displayName"];

    if (isLocalized _displayName) then {
        _displayName = localize _displayName;
    };

    _order pushBack _x;
    private _lbAdd = _ctrl lbAdd _displayName;
    _ctrl lbSetData [_lbAdd, _x];
} forEach lsb_common_spaceDebrisPresets;

_ctrl lbSetCurSel (_order find "shipDebris");
