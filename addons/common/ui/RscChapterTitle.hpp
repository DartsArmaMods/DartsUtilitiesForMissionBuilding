class GVAR(RscChapterTitle) {
    idd = -1;
    duration = 9.9999998e+010;
    movingEnable = 0;

    fadeIn = 0;
    fadeOut = 0;

    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(RscChapterTitle),_this select 0)]);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(RscChapterTitle),nil)]);

    class controls {
        class LetterBoxTop: RscText {
            idc = IDC_CINEMA_BORDER_LETTERBOX_TOP;
            colorBackground[] = {0, 0, 0, 1};
            w = QUOTE(safeZoneW + 2 * CINEMA_BORDER_LETTERBOX_OFFSET);
            h = QUOTE(CINEMA_BORDER_LETTERBOX_HEIGHT + CINEMA_BORDER_LETTERBOX_OFFSET);
            x = QUOTE(safeZoneX - CINEMA_BORDER_LETTERBOX_OFFSET);
            y = QUOTE(safeZoneY - CINEMA_BORDER_LETTERBOX_HEIGHT - CINEMA_BORDER_LETTERBOX_OFFSET);
        };
        class LetterBoxBottom: LetterBoxTop {
            idc = IDC_CINEMA_BORDER_LETTERBOX_BOTTOM;

            y = QUOTE(safeZoneY + safeZoneH);
        };

        class Title: RscText {
            idc = IDC_CINEMA_BORDER_TITLE;
            shadow = 1;
            size = "(0.05 / 1.17647) * safeZoneH";
            sizeEx = 0.4;
            style = 17;
            type = 13;

            w = "safeZoneW";
            h = "safeZoneH";
            x = "-0.025 * safeZoneW + safeZoneX";
            y = "0.9125 * safeZoneH + safeZoneY";
        };
    };
};
