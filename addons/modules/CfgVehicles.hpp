class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Edit;
            class Checkbox;
            class ModuleDescription;
        };
        class ModuleDescription;
    };
    class GVAR(moduleBase): Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QGVAR(modules);
        isGlobal = 1;
        curatorCost = 1;
    };

    // Separate modules to avoid issues with Zeuses editing Eden-placed modules
    class GVAR(moduleCinemaBorder): GVAR(moduleBase) {
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

    class GVAR(moduleCinemaBorder_zeus): GVAR(moduleBase) {
        scope = 1;
        author = AUTHOR;
        displayName = CSTRING(cinemaBorder_name);
        curatorInfoType = QGVAR(RscCinemaBorder);
    };
};
