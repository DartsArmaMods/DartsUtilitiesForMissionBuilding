#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(spaceDebrisPresets) = createHashMapFromArray [
    [LSTRING(spaceDebris_preset_shipDebris), [
        "Land_DomeDebris_01_struts_large_green_F",
        "Land_DomeDebris_01_struts_small_green_F"
    ]],
    [LSTRING(spaceDebris_preset_asteroids), []]
];

if ("3AS_Prop_Debris" call ace_common_fnc_isModLoaded) then {
    (GVAR(spaceDebrisPresets) get LSTRING(spaceDebris_preset_shipDebris)) append [
        "3AS_Debris1_Prop",
        "3AS_Debris2_Prop",
        "3AS_Debris3_Prop",
        "3AS_Debris4_Prop",
        "3AS_Debris5_Prop",
        "3AS_Debris6_Prop",
        "3AS_Debris7_Prop",
        "3AS_Debris8_Prop",
        "3AS_Debris9_Prop"
    ];
};

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
