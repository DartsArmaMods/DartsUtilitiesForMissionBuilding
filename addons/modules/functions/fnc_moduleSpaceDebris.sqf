#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the space debris module in Eden.
 *
 * Arguments:
 * 0: Mode <STRING>
 * 1: Args <ARRAY?
 *    - 0: Module <OBJECT>
 *    - 1: Affected units (unused) <ARRAY>
 *    - 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * function = "dumb_modules_fnc_moduleSpaceDebris";
 *
 * Public: No
 */

params ["_mode", "_input"];
TRACE_2("fnc_moduleSpaceDebris",_logic,_input);

if (!isServer) exitWith {};

_input params ["_logic"];

(if (is3DEN) then {
    private _return = (_logic get3DENAttribute "Size3") select 0;
    _return insert [2, [getDir _logic]]; // Add value for angle, though it's unused
    _return insert [3, _logic get3DENAttribute "IsRectangle"];
    _return;
} else {
    _logic getVariable ["objectArea", [500, 500, getDir _logic, true, 250]];
}) params ["_a", "_b", "_direction", "_isRectangle", "_c"];

private _objectCount = _logic getVariable [QGVAR(count), 300];

switch (_mode) do {
    // Called on initial place and when any attribute changes (including position)
    case "attributesChanged3DEN": {
        deleteVehicle (_logic getVariable [QGVAR(edenPreviews), []]);
        private _ret = [_logic, _a, _b, _c, _direction, _isRectangle, _objectCount] call EFUNC(common,spawnSpaceDebris);
        _logic setVariable [QGVAR(edenPreviews), _ret];
    };

    // NOT called when placed, but is called when module is deleted and then undo'd
    case "registeredToWorld3DEN": {
        private _ret = [_logic, _a, _b, _c, _direction, _isRectangle, _objectCount] call EFUNC(common,spawnSpaceDebris);
        _logic setVariable [QGVAR(edenPreviews), _ret];
    };

    // Called when deleted
    case "unregisteredFromWorld3DEN": {
        deleteVehicle (_logic getVariable [QGVAR(edenPreviews), []]);
    };

    // Mission start
    case "init": {
        _input params ["", "_activated"];
        if (!_activated) exitWith {};

        // Just in case, but all of the previews should be cleared when mission is actually started
        deleteVehicle (_logic getVariable [QGVAR(edenPreviews), []]);
        private _ret = [_logic, _a, _b, _c, _direction, _isRectangle, _objectCount] call EFUNC(common,spawnSpaceDebris);
    };
};
