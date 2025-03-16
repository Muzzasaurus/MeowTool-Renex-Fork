#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
width=32
height=32
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) {
    with (all) {
        if (objInPalette(object_index)) {
            x+=objObjSelect.grid
            if (((outside_room()) or (x-sprite_get_xoffset(sprite_index) >= 800)) and (object_index != PlayerStart)) instance_destroy()
        }
    }
}
event_inherited()
