class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Edit;
            class Checkbox;
            class Combo;
            class ModuleDescription;
        };
        class ModuleDescription;
    };
    class MODULE(Base): Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QUOTE(ADDON);
        isGlobal = 1;
        curatorCost = 1;
    };

    // Separate modules to avoid issues with Zeuses editing Eden-placed modules
    class MODULE(CinemaBorder): MODULE(Base) {
        scope = 2;
        scopeCurator = 0;
        author = AUTHOR;
        displayName = CSTRING(cinemaBorder_name);

        function = QFUNC(moduleCinemaBorder);
        isTriggerActivated = 1;

        class Attributes: AttributesBase {
            // The Attribute class name is what's used as the variable name, not the property
            class GVAR(title): Edit {
                displayName = CSTRING(AttributeTitle_name);
                tooltip = CSTRING(cinemaBorder_AttributeTitle_tooltip);
                property = QGVAR(title);
                defaultValue = "''";
            };

            class GVAR(duration): Edit {
                displayName = CSTRING(AttributeDuration_name);
                tooltip = CSTRING(AttributeDuration_tooltip);
                property = QGVAR(duration);
                defaultValue = QUOTE(CINEMA_BORDER_DEFAULT_DURATION);
                validate = "NUMBER";
            };

            class GVAR(global): Checkbox {
                displayName = CSTRING(AttributeGlobal_name);
                tooltip = CSTRING(cinemaBorder_AttributeGlobal_tooltip);
                property = QGVAR(global);
                defaultValue = "true";
            };

            class ModuleDescription: ModuleDescription {}; // Module description should be shown last
        };

        canSetArea = 1;
        canSetAreaShape = 1;
        canSetAreaHeight = 1;
        class AttributeValues {
            size3[] = {30, 30, -1};
            isRectangle = 0;
        };

        class ModuleDescription: ModuleDescription {
            description = CSTRING(cinemaBorder_description);
        };
    };

    class MODULE(CinemaBorder_zeus): MODULE(Base) {
        scope = 1;
        author = AUTHOR;
        displayName = CSTRING(cinemaBorder_name);
        curatorInfoType = QGVAR(RscCinemaBorder);
    };

    class MODULE(SpaceDebris): MODULE(Base) {
        scope = 2;
        scopeCurator = 0;
        author = AUTHOR;
        displayName = ECSTRING(common,spaceDebris);

        icon = "dumb_iconModuleSpaceDebris";

        // JIP is handled in fnc_spawnSpaceDebris
        is3DEN = 1;
        function = QFUNC(moduleSpaceDebris);

        class Attributes: AttributesBase {
            class GVAR(count): Edit {
                displayName = CSTRING(AttributeCount_name);
                tooltip = CSTRING(spaceDebris_AttributeCount_tooltip);
                property = QGVAR(count);
                defaultValue = QUOTE(DEFAULT_OBJECT_COUNT);
                validate = "NUMBER";
            };

            class GVAR(preset): Combo {
                displayName = ECSTRING(common,spaceDebrisPreset_name);
                tooltip = ECSTRING(common,spaceDebrisPreset_tooltip);
                property = QGVAR(preset);
                control = QGVAR(spaceDebrisPreset);
                defaultValue = "''";
            };

            class GVAR(drifting): Checkbox {
                displayName = CSTRING(spaceDebris_AttributeDrifting_name);
                tooltip = CSTRING(spaceDebris_AttributeDrifting_tooltip);
                property = QGVAR(drifting);
                defaultValue = "false";
            };

            class GVAR(driftDirection): Edit {
                displayName = CSTRING(spaceDebris_AttributeDriftDirection_name);
                tooltip = CSTRING(spaceDebris_AttributeDriftDirection_tooltip);
                property = QGVAR(driftDirection);
                defaultValue = "0";
                validate = "NUMBER";
                control = "EditZ";
            };

            class GVAR(debrisData): Edit {
                displayName = CSTRING(spaceDebris_AttributeDebrisData_name);
                tooltip = CSTRING(spaceDebris_AttributeDebrisData_tooltip);
                property = QGVAR(debrisData);
                defaultValue = "''";
            };

            class GVAR(paramsOld): Edit {
                displayName = CSTRING(spaceDebris_AttributeParamsOld_name);
                tooltip = CSTRING(spaceDebris_AttributeDebrisData_tooltip);
                property = QGVAR(paramsOld);
                defaultValue = "'[]'";
            };

            class ModuleDescription: ModuleDescription {};
        };

        canSetArea = 1;
        canSetAreaShape = 1;
        canSetAreaHeight = 1;
        class AttributeValues {
            size3[] = {500, 500, 250};
            isRectangle = 1;
        };

        class ModuleDescription: ModuleDescription {
            direction = 1;
            description = CSTRING(spaceDebris_description);
        };
    };
};
