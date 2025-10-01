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
            QMODULE(ChapterTitle),
            QMODULE(ChapterTitle_zeus),
            QMODULE(SpaceDebris)
        };
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "Cfg3DEN.hpp"
#include "CfgVehicles.hpp"
#include "CfgVehicleIcons.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgEventHandlers.hpp"
#include "ui\controls.hpp"
#include "ui\RscAttributes.hpp"
