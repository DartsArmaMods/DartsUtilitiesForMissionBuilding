#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Initializes the "Cinema Border" Zeus module display.
 *
 * Arguments:
 * 0: Dummy control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _control call dumb_zeus_fnc_ui_cinemaBorder
 *
 * Public: No
 */

params ["_control"];
private _display = ctrlParent _control;
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];

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
    private _duration = _display getVariable [QGVAR(duration), 8];

    [_title, _duration] call EFUNC(common,cinemaBorderGlobal);
    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_control ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
