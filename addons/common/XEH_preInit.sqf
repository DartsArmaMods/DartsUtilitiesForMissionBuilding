#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if !("lsb_main" call ace_common_fnc_isModLoaded) then {
    // Create a copy from UI namespace, allows mod / mission makers to just add to the hashmap
    lsb_common_spaceDebrisPresets = +(uiNamespace getVariable "lsb_common_spaceDebrisPresets");

    if ("3AS_Prop_Debris" call ace_common_fnc_isModLoaded) then {
        ((lsb_common_spaceDebrisPresets get "shipDebris") select 1) append [
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
};

// https://community.bistudio.com/wiki/Example_Code:_Random_Area_Distribution
lsb_common_distributions = createHashMapFromArray [
    [
        "randomArea", [
            LSTRING(distribution_randomArea), {
                params ["_centerASL", "_a", "_b", "_c", "_direction", "_isRectangle"];
                private _area = [_centerASL, [_a, _b, _direction, _isRectangle]];
                private _positionASL = _area call BIS_fnc_randomPosTrigger; // Seemingly returns as PositionAGL, but we modify the height

                // Does not randomize height, so we do it manually
                private _height = _centerASL select 2;
                private _halfHeight = _height / 2;
                private _randomHeight = (_halfHeight + random (-_halfHeight - _halfHeight));
                _positionASL set [2, _height + _randomHeight];
                _positionASL;
            }
        ]
    ], [
        "gaussian", [
            LSTRING(distribution_gaussian), {
                params ["_centerASL", "_a", "_b", "_c", "_direction"];
                private _return = [];

                {
                    _return pushBack (random [-_x, 0, _x]);
                } forEach [_a, _b, _c];

                // private _newA = _return select 0;
                // private _newB = _return select 1;
                _return set [0, (_return select 0) * cos -_direction - (_return select 1) * sin -_direction];
                _return set [1, (_return select 0) * sin -_direction + (_return select 1) * cos -_direction];

                _centerASL vectorAdd _return;
            }
        ]
    ]
];

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
