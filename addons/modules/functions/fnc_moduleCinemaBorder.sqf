#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the chapter title module in Eden.
 *
 * Arguments:
 * 0: Module <OBJECT>
 * 1: Affected units (unused) <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * function = "dumb_modules_fnc_moduleChapterTitle";
 *
 * Public: No
 */

params ["_logic", "", "_activated"];
TRACE_2("fnc_moduleChapterTitle",_logic,_activated);

if !(isServer && _activated) exitWith {};

if (_logic getVariable [QGVAR(global), false]) exitWith {
    [_logic getVariable [QGVAR(title), ""], _logic getVariable [QGVAR(duration), CINEMA_BORDER_DEFAULT_DURATION]] call EFUNC(common,chapterTitleGlobal);
};

// X, Y, Angle, isRectangle, Z
(_logic getVariable ["objectArea", [30, 30, 0, false, -1]]) params ["_a", "_b", "", "_isRectangle", "_c"];
private _players = ([] call CBA_fnc_players) inAreaArray [_logic, _a, _b, 0, _isRectangle, _c];

if (_players isNotEqualTo []) then {
    [EGVAR(common,chapterTitle), [_logic getVariable [QGVAR(title), ""], _logic getVariable [QGVAR(duration), CINEMA_BORDER_DEFAULT_DURATION]], _players] call CBA_fnc_targetEvent;
};
