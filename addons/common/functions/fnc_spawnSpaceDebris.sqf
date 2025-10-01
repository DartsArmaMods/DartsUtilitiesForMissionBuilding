#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Creates space debris within a given area.
 *
 * Arguments:
 * 0: Area center <OBJECT|ARRAY>
 *    - Array must be format PositionASL
 * 1: Preset name <STRING>
 *    - Preset listed in lsb_common_spaceDebrisPresets
 * 2: Area Array <ARRAY>
 *    - 0: Length (A) <NUMBER>
 *    - 1: Width (B) <NUMBER>
 *    - 2: Height (C) <NUMBER>
 *    - 3: Is rectangle <BOOL>
 *         - True to use a rectangle shape, false to use ellipsis
 * 3: Objects to spawn <NUMBER>
 *
 * Return Value:
 * Created objects <ARRAY>
 *   - Only returned when executed on the server
 *
 * Example:
 * [player, "shipDebris" [100, 100, 50, true], 10] call dumb_common_fnc_spawnSpaceDebris
 *
 * Public: Yes
 */

params [
    ["_center", objNull, [objNull, []], 3],
    ["_preset", "", [""]],
    ["_area", [], [[]], 5],
    ["_objectCount", 0, [0]]
];
TRACE_4("fnc_spawnSpaceDebris",_center,_preset,_area,_objectCount);

_area params [
    ["_a", 0, [0]],
    ["_b", 0, [0]],
    ["_c", 0, [0]],
    ["_direction", 0, [0]],
    ["_isRectangle", false, [false]]
];

if (_objectCount <= 0 || { ([_a, _b, _c] find 0) != -1 }) exitWith { [] };

if (!isServer) exitWith {
    [QGVAR(spawnSpaceDebris), _this] call CBA_fnc_serverEvent;
    [];
};

private _area = [_center, [_a, _b, _direction, _isRectangle]];
private _objects = [];
private _halfHeight = _c / 2;
private _baseHeight = if (_center isEqualType objNull) then {
    getPosASL _center select 2;
} else { _center select 2 };

private _debrisClasses = (lsb_common_spaceDebrisPresets getOrDefault [_preset, []]) select 1;
if (_debrisClasses isEqualTo []) exitWith {
    WARNING_1("Preset '%1' has no defined debris classes",_preset);
};

private ["_positionASL", "_object"]; // Only create var once
for "_" from 1 to _objectCount do {
    _positionASL = _area call BIS_fnc_randomPosTrigger; // Seemingly returns as PositionAGL, but we modify the height
    _positionASL = [_positionASL, 0, 5, 5, 1, 0] call BIS_fnc_findSafePos;

    // Does not randomize height, so we do it manually
    private _randomHeight = (_halfHeight + random (-_halfHeight - _halfHeight));
    _positionASL set [2, _baseHeight + _randomHeight];

    _object = createSimpleObject [selectRandomWeighted _debrisClasses, [0, 0, 0]];
    _object setPosASL _positionASL;
    _object setVectorDirAndUp [[] call CBA_fnc_randomVector3D, [] call CBA_fnc_randomVector3D];

    _objects pushBack _object;
};

_objects;
