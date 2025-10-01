#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Initializes the "Chapter Title" Zeus module display.
 *
 * Arguments:
 * 0: Dummy control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _control call dumb_modules_fnc_ui_chapterTitle
 *
 * Public: No
 */

params ["_control"];
private _display = ctrlParent _control;

_control ctrlRemoveAllEventHandlers "SetFocus";

private _fnc_onUnload = {
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    if (isNull _logic) exitWith {};

    private _title = _display getVariable [QGVAR(title), ""];
    private _duration = _display getVariable [QGVAR(duration), CINEMA_BORDER_DEFAULT_DURATION];

    [_title, _duration] call EFUNC(common,chapterTitleGlobal);
    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_control ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
