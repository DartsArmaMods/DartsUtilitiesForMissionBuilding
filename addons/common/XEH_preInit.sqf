#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Todo: Root class and isClass check?
GVAR(spaceDebrisPresets) = createHashMapFromArray [
    [
        "shipDebris", [
            LSTRING(spaceDebrisPreset_shipDebris), [
                "Land_DomeDebris_01_struts_large_green_F", 1,
                "Land_DomeDebris_01_struts_small_green_F", 1
            ]
        ]
    ], [
        "asteroids", [
            LSTRING(spaceDebrisPreset_asteroids), [
                "Land_Lavaboulder_02_F", 1,
                "Land_Lavaboulder_03_F", 1,
                "Land_SharpRock_monolith", 1,
                "Land_SharpRock_spike", 1,
                "Land_SharpRock_wallV", 0.05,
                "Land_W_sharpRock_monolith", 1,
                "Land_W_sharpRock_spike", 1,
                "Land_W_sharpRock_wallH", 0.05,
                "Land_W_sharpRock_wallV", 0.05
            ]
        ]
    ], [
        "asteroidsSmall", [
            LSTRING(spaceDebrisPreset_asteroidsSmall), [
                "Land_Bare_boulder_01_F", 1,
                "Land_Bare_boulder_02_F", 1,
                "Land_Bare_boulder_03_F", 1,
                "Land_Bare_boulder_04_F", 1,
                "Land_Bare_boulder_05_F", 1,
                "Land_LavaStone_big_F", 1,
                "Land_LavaStone_small_F", 1,
                "Land_SharpStone_01", 1,
                "Land_SharpStone_02", 1,
                "Land_SharpStone_03", 1,
                "Land_SharpStones_erosion", 1,
                "Land_Small_Stone_02_F", 1,
                "Land_W_sharpStone_01", 1,
                "Land_W_sharpStone_02", 1,
                "Land_W_sharpStone_03", 1,
                "Land_W_sharpStones_erosion", 1
            ]
        ]
    ]
];

if ("3AS_Prop_Debris" call ace_common_fnc_isModLoaded) then {
    ((GVAR(spaceDebrisPresets) get "shipDebris") select 1) append [
        "3AS_Debris1_Prop", 1,
        "3AS_Debris2_Prop", 1,
        "3AS_Debris3_Prop", 1,
        "3AS_Debris4_Prop", 1,
        "3AS_Debris5_Prop", 1,
        "3AS_Debris6_Prop", 1,
        "3AS_Debris7_Prop", 1,
        "3AS_Debris8_Prop", 1,
        "3AS_Debris9_Prop", 1
    ];
};

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
