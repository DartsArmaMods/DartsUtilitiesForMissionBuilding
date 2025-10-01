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

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
