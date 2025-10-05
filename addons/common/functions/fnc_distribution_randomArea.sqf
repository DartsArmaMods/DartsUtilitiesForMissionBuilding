#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Uses a guassian distribution to return a random PositionASL.
 *
 * Arguments:
 * 0: Center in format PositionASL <ARRAY>
 * 1: Length <NUMBER>
 * 2: Width <NUMBER>
 * 3: Height <NUMBER>
 * 4: Direction <NUMBER>
 *
 * Return Value:
 * Array format PositioNASL <ARRAY>
 *
 * Example:
 * [[10, 10, 10], 5, 5, 5, random 360, true] call dumb_common_fnc_distribution_randomArea
 *
 * Public: No
 */

params ["_centerASL", "_a", "_b", "_c", "_direction", "_isRectangle"];
TRACE_6("fnc_distribution_randomArea",_centerASL,_a,_b,_c,_direction,_isRectangle);

private _area = [_centerASL, [_a, _b, _direction, _isRectangle]];
private _positionASL = _area call BIS_fnc_randomPosTrigger; // Seemingly returns as PositionAGL, but we modify the height

// Does not randomize height, so we do it manually
private _height = _centerASL select 2;
private _halfHeight = _height / 2;
private _randomHeight = (_halfHeight + random (-_halfHeight - _halfHeight));
_positionASL set [2, _height + _randomHeight];
_positionASL;
