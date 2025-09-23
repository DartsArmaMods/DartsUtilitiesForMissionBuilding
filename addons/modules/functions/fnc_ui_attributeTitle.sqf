#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Initializes the "Title" Zeus module attribute.
 *
 * Arguments:
 * 0: Title control group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _control call dumb_modules_fnc_ui_attributeTitle
 *
 * Public: No
 */

params ["_control"];
private _display = ctrlParent _control;

_control ctrlRemoveAllEventHandlers "SetFocus";

private _edit = _control controlsGroupCtrl IDC_TITLE_TITLE;

_edit ctrlSetText "";

private _fnc_onKeyUp = {
    params ["_display"];

    private _edit = _display displayCtrl IDC_TITLE_TITLE;
    private _title = ctrlText _edit;

    _display setVariable [QGVAR(title), _title];
};

_display call _fnc_onKeyUp;
_display displayAddEventHandler ["KeyUp", _fnc_onKeyUp];
