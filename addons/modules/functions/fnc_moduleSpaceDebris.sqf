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

// Do not question this code, only my sanity.

params ["_mode", "_input"];
TRACE_2("fnc_moduleSpaceDebris",_logic,_input);

if (!isServer) exitWith {};

_input params ["_logic"];

(if (is3DEN) then {
    private _return = (_logic get3DENAttribute "Size3") select 0;
    _return insert [2, [getDir _logic]];
    _return insert [3, _logic get3DENAttribute "IsRectangle"];

    private _preset = (_logic get3DENAttribute QGVAR(preset)) select 0;
    if (_preset == "") then {
        _preset = "shipDebris";
    };

    private _distribution = (_logic get3DENAttribute QGVAR(distribution)) select 0;
    if (_distribution == "") then {
        _distribution = "randomArea";
    };

    _return append [_preset, _distribution];
    _return;
} else {
    private _return = _logic getVariable ["objectArea", [500, 500, getDir _logic, true, 250]];
    _return append [
        _logic getVariable [QGVAR(preset), "shipDebris"],
        _logic getVariable [QGVAR(distribution), "randomArea"]
    ];
    _return;
}) params ["_a", "_b", "_direction", "_isRectangle", "_c", "_preset", "_distribution"];

private _objectCount = _logic getVariable [QGVAR(count), DEFAULT_OBJECT_COUNT];

private _fnc_deleteAndCreateObjects = {
    private _lastParams = (_logic get3DENAttribute QGVAR(paramsOld) select 0);

    // Only delete/create new objects if last params are empty or different from current
    private _currentParams = str [getPosASL _logic, _preset, _distribution, [_a, _b, _c, _direction, _isRectangle], _objectCount];
    if (_lastParams == _currentParams) exitWith {
        _logic call FUNC(moduleSpaceDebris_createFromSavedData); // ? Not sure if required
    };

    _logic set3DENAttribute [QGVAR(paramsOld), _currentParams];

    deleteVehicle (_logic getVariable [QGVAR(debrisObjects), []]);
    private _objects = [_logic, _preset, _distribution, [_a, _b, _c, _direction, _isRectangle], _objectCount] call EFUNC(common,spawnSpaceDebris);
    _logic setVariable [QGVAR(debrisObjects), _objects];
    _logic set3DENAttribute [QGVAR(debrisData), str (_objects apply {
        [typeOf _x, getPosASL _x, [vectorDir _x, vectorUp _x]];
    })];
};

switch (_mode) do {
    // Called on initial place and when any attribute changes (including position), also called when returning to Eden from playtesting
    case "attributesChanged3DEN": _fnc_deleteAndCreateObjects;

    // NOT called when placed, but is called when module is deleted and then undo'd
    case "registeredToWorld3DEN": _fnc_deleteAndCreateObjects;

    // Called when deleted
    case "unregisteredFromWorld3DEN": {
        deleteVehicle (_logic getVariable [QGVAR(debrisObjects), []]);
    };

    // Mission start
    case "init": {
        _input params ["", "_activated"];
        if !(isServer && _activated) exitWith {};
        _logic call FUNC(moduleSpaceDebris_createFromSavedData);
    };
};
