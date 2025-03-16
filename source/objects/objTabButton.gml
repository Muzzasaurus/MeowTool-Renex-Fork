#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
width=255
height=16
type="common"
open = true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=ystart+objObjSelect.palettePosition
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (!objOpenMenu.openMenu) and (primed) {
    open=!open
    with (objSelectable) {
        if (type == other.type) {
            visible = other.open
        }
    }
}
event_inherited()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
