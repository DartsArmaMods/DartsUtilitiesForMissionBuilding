class CfgVehicles {
    class Module_F;
    class GVAR(moduleBase): Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QGVAR(modules);
        isGlobal = 1;
        curatorCost = 1;
    };

    class GVAR(moduleCinemaBorder): GVAR(moduleBase) {
        scope = 1;
        author = AUTHOR;
        displayName = CSTRING(cinemaBorder_name);
        curatorInfoType = QGVAR(RscCinemaBorder);
    };
};
