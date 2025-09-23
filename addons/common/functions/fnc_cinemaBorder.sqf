#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Creates a Halo style letterbox and title.
 *
 * Arguments:
 * 0: Text (optional, default: "") <STRING>
 * 1: Duration in seconds (optional, default: 5) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["They call it... Halo", 8] call dumb_common_fnc_cinemaBorder
 *
 * Public: Yes
 */

if (!hasInterface) exitWith {};

// Time in seconds that the bars fade in / out for
#define BORDER_FADE_DURATION 1.5
#define TITLE_DURATION 1.2

params [
    ["_title", "", [""]],
    ["_duration", CINEMA_BORDER_DEFAULT_DURATION, [0]]
];
TRACE_2("fnc_cinemaBorder",_title,_duration);

// Mission makers may just want the bars, only exit if duration is invalid or display is already open
if (_duration <= 0 || !isNull (uiNamespace getVariable [QGVAR(RscCinemaBorder), displayNull])) exitWith {};

openMap false;

[{
    // Hide everything but radar and side panels
    // See https://github.com/acemod/ACE3/blob/master/addons/common/functions/fnc_showHud.sqf for details
    [QGVAR(cinemaBorder), [false, false, true, false, false, false, false, false, true, false]] call ace_common_fnc_showHud;
}, nil, BORDER_FADE_DURATION] call CBA_fnc_waitAndExecute;

private _layer = QGVAR(RscCinemaBorder) call BIS_fnc_RscLayer;
_layer cutRsc [QGVAR(RscCinemaBorder), "PLAIN", -1, false];

private _borderDisplay = uiNamespace getVariable [QGVAR(RscCinemaBorder), displayNull];
if (isNull _borderDisplay) exitWith {
    _layer cutFadeOut 0;
    ERROR("Failed to create chapter title border");
};

private _ctrlBorderTop = _borderDisplay displayCtrl IDC_CINEMA_BORDER_LETTERBOX_TOP;
private _ctrlBorderBottom = _borderDisplay displayCtrl IDC_CINEMA_BORDER_LETTERBOX_BOTTOM;

private _originalPositions = [ctrlPosition _ctrlBorderTop, ctrlPosition _ctrlBorderBottom];

// Animate bars in from the top / bottom
private _posX = safeZoneX - CINEMA_BORDER_LETTERBOX_OFFSET;
private _width = safeZoneW + 2 * CINEMA_BORDER_LETTERBOX_OFFSET;
private _height = CINEMA_BORDER_LETTERBOX_HEIGHT + CINEMA_BORDER_LETTERBOX_OFFSET;

// If player is flying a vehicle, don't draw the bars
private _vehicle = objectParent ace_player;
if (isNull _vehicle || !(ace_player == currentPilot _vehicle && { _vehicle isKindOf "Air" })) then {
    _ctrlBorderTop ctrlSetPosition [_posX, safeZoneY - CINEMA_BORDER_LETTERBOX_OFFSET, _width, _height];
    _ctrlBorderTop ctrlCommit BORDER_FADE_DURATION;

    _ctrlBorderBottom ctrlSetPosition [_posX, safeZoneY + safeZoneH - CINEMA_BORDER_LETTERBOX_HEIGHT, _width, _height];
    _ctrlBorderBottom ctrlCommit BORDER_FADE_DURATION;
};

private _ctrlTitle = _borderDisplay displayCtrl IDC_CINEMA_BORDER_TITLE;
if (_title != "") then {
    _title = parseText (format ["<t align='right' size='1.125' shadow='0'>%1</t>", _title]);
    _ctrlTitle ctrlSetStructuredText _title;

    // ctrlSetFade has some issues with fade = 1 in config, so we hide it and then unhide it to make sure
    // https://community.bistudio.com/wiki/ctrlSetFade
    _ctrlTitle ctrlSetFade 1;
    _ctrlTitle ctrlCommit 0;

    [{
        params ["_ctrlTitle", "_duration"];
        _ctrlTitle ctrlSetFade 0;
        _ctrlTitle ctrlCommit 2;

        [{ _this ctrlSetFade 1; _this ctrlCommit TITLE_DURATION }, _ctrlTitle, _duration - (TITLE_DURATION * 2)] call CBA_fnc_waitAndExecute;
    }, [_ctrlTitle, _duration], BORDER_FADE_DURATION] call CBA_fnc_waitAndExecute;
};

// Slide bars back out of frame before the display is closed
[{
    // Clear our reason for hiding hud
    ["dumb_common_cinemaBorder", []] call ace_common_fnc_showHud;

    params ["_ctrlBorderTop", "_ctrlBorderBottom", "_originalPositions"];
    _ctrlBorderTop ctrlSetPosition (_originalPositions select 0);
    _ctrlBorderTop ctrlCommit BORDER_FADE_DURATION;
    _ctrlBorderBottom ctrlSetPosition (_originalPositions select 1);
    _ctrlBorderBottom ctrlCommit BORDER_FADE_DURATION;
}, [_ctrlBorderTop, _ctrlBorderBottom, _originalPositions], _duration] call CBA_fnc_waitAndExecute;
[{ _this cutFadeOut 0 }, _layer, _duration + BORDER_FADE_DURATION] call CBA_fnc_waitAndExecute;
