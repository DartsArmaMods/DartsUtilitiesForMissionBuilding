#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Scans config for space debris presets.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call dumb_common_fnc_parseConfig
 *
 * Public: No
 */

// Battlefields is loaded, nothing needed here
if ("lsb_main" call ace_common_fnc_isModLoaded) exitWith {};

private _presets = createHashMap;
{
    _presets set [configName _x, [getText (_x >> "displayName"), getArray (_x >> "objects")]];
} forEach ("true" configClasses (configFile >> "lsb_spaceDebrisPresets"));

uiNamespace setVariable ["lsb_common_spaceDebrisPresets", compileFinal _presets];

private _distributions = createHashMap;
{
    private _function = getText (_x >> "function");
    if (_function == "") then { ERROR_1("Distribution '%1' has no function defined",configName _x); continue };

    _distributions set [configName _x, [getText (_x >> "displayName"), compile _function]];
} forEach ("true" configClasses (configFile >> "lsb_distributions"));

uiNamespace setVariable ["lsb_common_distributions", compileFinal _distributions];
