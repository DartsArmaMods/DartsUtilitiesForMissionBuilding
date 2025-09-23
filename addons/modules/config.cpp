#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "dumb_main",
            "ace_modules",
            "ace_zeus"
        };
        units[] = {
            QGVAR(moduleCinemaBorder),
            QGVAR(moduleCinemaBorder_zeus)
        };
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgEventHandlers.hpp"
#include "ui\controls.hpp"
#include "ui\RscAttributes.hpp"
