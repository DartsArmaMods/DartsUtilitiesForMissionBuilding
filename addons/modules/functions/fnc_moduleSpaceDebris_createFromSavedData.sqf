#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Creates space debris from a module's saved data.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _logic call dumb_modules_fnc_moduleSpaceDebris_createFromSavedData
 *
 * Public: No
 */

params ["_logic"];

deleteVehicle (_logic getVariable [QGVAR(debrisObjects), []]);
private _objects = [];
private _debrisData = if (is3DEN) then {
    _logic get3DENAttribute QGVAR(debrisData) select 0;
} else {
    _logic getVariable [QGVAR(debrisData), "[]"];
};

{
    _x params ["_class", "_positionASL", "_vectorDirAndUp"];
    private _object = createSimpleObject [_class, [0, 0, 0], true]; // ! should be global event if !is3DEN
    _object setPosASL _positionASL;
    _object setVectorDirAndUp _vectorDirAndUp;
    _objects pushBack _object;
} forEach (parseSimpleArray _debrisData);
_logic setVariable [QGVAR(debrisObjects), _objects];
