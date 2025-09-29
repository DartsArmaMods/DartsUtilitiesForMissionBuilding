#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"

if (is3DEN) then {
    private _modules = all3DENEntities select 3;
    if (_modules isEqualTo []) exitWith {};
    systemChat "1";
    systemChat str (_modules apply { typeOf _x });
    systemChat QMODULE(SpaceDebris);
    systemChat str (_modules apply { typeOf _x == QMODULE(SpaceDebris) });
    {
        _x call FUNC(moduleSpaceDebris_createFromSavedData);
    } forEach (_modules select { typeOf _x isEqualTo "dumb_moduleSpaceDebris" }); // Do not use QMODULE here, it breaks shit idk why - Dart @ 11:35 pm
};
