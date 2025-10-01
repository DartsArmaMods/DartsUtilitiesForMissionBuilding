#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"

if (is3DEN) then {
    private _modules = all3DENEntities select 3;
    {
        _x call FUNC(moduleSpaceDebris_createFromSavedData);
    } forEach (_modules select { typeOf _x == QMODULE(SpaceDebris) });
};
