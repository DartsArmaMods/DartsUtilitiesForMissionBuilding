class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls;
        };
        class Combo: Title {
            class Controls: Controls {
                class Title;
                class Value;
            };
        };
        class GVAR(spaceDebrisPreset): Combo {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    onLoad = QUOTE(call (uiNamespace getVariable QQFUNC(3DEN_spaceDebrisPresetOnLoad)));
                };
            };
        };
    };
};
