class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content;
        class ButtonOK;
        class ButtonCancel;
    };
};

// Generic edit box, not intended to be used directly and will need per-ui changes
class GVAR(AttributeEdit): RscControlsGroupNoScrollbars {
    idc = -1;
    onSetFocus = "";
    x = 0;
    y = 0;
    w = QUOTE(W_PART(26));
    h = QUOTE(H_PART(1.1));
    class controls {
        class Label: RscText {
            idc = -1;
            text = "";
            tooltip = "";
            x = 0;
            y = QUOTE(H_PART(0.1));
            w = QUOTE(W_PART(10));
            h = QUOTE(H_PART(1));
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Edit: RscEdit {
            idc = -1;
            x = QUOTE(W_PART(10.1));
            y = QUOTE(H_PART(0.1));
            w = QUOTE(W_PART(15.9));
            h = QUOTE(H_PART(1));
            autocomplete = "";
        };
    };
};

class GVAR(AttributeTitle): GVAR(AttributeEdit) {
    idc = IDC_TITLE;
    onSetFocus = QUOTE(call FUNC(ui_attributeTitle));

    class controls: controls {
        class Label: Label {
            idc = -1;
            text = CSTRING(AttributeTitle_name);
            onSetFocus = QUOTE(call FUNC(ui_attributeTitle));
        };
        class Edit: Edit {
            idc = IDC_TITLE_TITLE;
        };
    };
};

class GVAR(AttributeDuration): RscControlsGroupNoScrollbars {
    idc = IDC_DURATION;
    onSetFocus = QUOTE(call FUNC(ui_attributeDuration));
    x = 0;
    y = 0;
    w = QUOTE(W_PART(26));
    h = QUOTE(H_PART(1.1));
    class controls {
        class Label: RscText {
            idc = -1;
            text = CSTRING(AttributeDuration_name);
            tooltip = CSTRING(AttributeDuration_tooltip);
            x = 0;
            y = QUOTE(H_PART(0.1));
            w = QUOTE(W_PART(10));
            h = QUOTE(H_PART(1));
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Duration: RscEdit {
            idc = IDC_DURATION_DURATION;
            x = QUOTE(W_PART(10.1));
            y = QUOTE(H_PART(0.1));
            w = QUOTE(W_PART(15.9));
            h = QUOTE(H_PART(1));
            autocomplete = "";
        };
    };
};

class GVAR(RscCinemaBorder): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RscCinemaBorder))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RscCinemaBorder))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class title: GVAR(AttributeTitle) {
                    tooltip = CSTRING(cinemaBorder_AttributeTitle_tooltip);
                };
                class duration: GVAR(AttributeDuration) {};
            };
        };
        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(call FUNC(ui_cinemaBorder));
        };
        class ButtonCancel: ButtonCancel {};
    };
};
