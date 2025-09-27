#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Todo: Root class and isClass check?
GVAR(spaceDebrisPresets) = createHashMapFromArray [
    [
        "shipDebris", [
            LLSTRING(spaceDebris_preset_shipDebris), [
                "Land_DomeDebris_01_struts_large_green_F",
                "Land_DomeDebris_01_struts_small_green_F"
            ]
        ]
    ], [
        "asteroids", [LSTRING(spaceDebris_preset_asteroids), [
                "Land_Lavaboulder_02_F",
                "Land_Lavaboulder_03_F",
                "Land_SharpRock_monolith",
                "Land_SharpRock_spike",
                "Land_SharpRock_wallV",
                "Land_W_sharpRock_monolith",
                "Land_W_sharpRock_spike",
                "Land_W_sharpRock_wallH",
                "Land_W_sharpRock_wallV"
            ]
        ]
    ], [
        "asteroidsSmall", [LSTRING(spaceDebris_preset_asteroidsSmall), [
                "Land_Bare_boulder_01_F",
                "Land_Bare_boulder_02_F",
                "Land_Bare_boulder_03_F",
                "Land_Bare_boulder_04_F",
                "Land_Bare_boulder_05_F",
                "Land_LavaStone_big_F",
                "Land_LavaStone_small_F",
                "Land_SharpStone_01",
                "Land_SharpStone_02",
                "Land_SharpStone_03",
                "Land_SharpStones_erosion",
                "Land_Small_Stone_02_F",
                "Land_W_sharpStone_01",
                "Land_W_sharpStone_02",
                "Land_W_sharpStone_03",
                "Land_W_sharpStones_erosion"
            ]
        ]
    ]
];

if ("3AS_Prop_Debris" call ace_common_fnc_isModLoaded) then {
    (GVAR(spaceDebrisPresets) get "shipDebris") append [
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
