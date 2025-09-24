#include "script_component.hpp"

if (isServer) then {
    [QGVAR(spawnSpaceDebris), LINKFUNC(spawnSpaceDebris)] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    [QGVAR(cinemaBorder), LINKFUNC(cinemaBorder)] call CBA_fnc_addEventHandler;
};
