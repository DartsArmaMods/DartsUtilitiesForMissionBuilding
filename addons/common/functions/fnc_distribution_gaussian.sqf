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
 * 5: Is rectangle (unused) <BOOL>
 *
 * Return Value:
 * Array format PositionASL <ARRAY>
 *
 * Example:
 * [[10, 10, 10], 5, 5, 5, random 360] call dumb_common_fnc_distribution_gaussian
 *
 * Public: No
 */

params ["_centerASL", "_a", "_b", "_c", "_direction"];
TRACE_5("fnc_distribution_gaussian",_centerASL,_a,_b,_c,_direction);

private _return = [_a, _b, _c] apply { random [-_x, 0, _x] };
_return = [_return, _direction, 2] call BIS_fnc_rotateVector3D;
_centerASL vectorAdd _return;
