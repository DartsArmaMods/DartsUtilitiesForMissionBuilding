#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * A small wrapper for chapterTitle that displays the chapter title for all players.
 * Exists so mission makers don't have to deal with internal CBA events.
 *
 * Arguments:
 * 0: Text <STRING>
 * 1: Duration in seconds <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["They call it... Halo", 8] call dumb_common_fnc_chapterTitleGlobal
 *
 * Public: Yes
 */

params ["_title", "_duration"];
TRACE_2("fnc_chapterTitleGlobal",_title,_duration);

[QGVAR(chapterTitle), [_title, _duration]] call CBA_fnc_globalEvent;
