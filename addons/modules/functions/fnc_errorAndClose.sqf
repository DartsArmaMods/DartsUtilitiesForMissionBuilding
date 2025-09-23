#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Shows a message in the Zeus menu, and then deletes the given logic object.
 *
 * Please provide proper credits to those who participate in development.
 * This function was developed for Legion Studios: Core.
 * Do not place in any other mod without permission.
 *
 * Arguments:
 * 0: Logic <OBJET>
 * 1: Message or stringtable key <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "message" call dumb_modules_fnc_errorAndClose
 *
 * Public: No
 */

params ["_message"];
TRACE_1("fnc_errorAndClose",_message);

if (isLocalized _message) then {
    _message = localize _message;
};
[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
