#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (!objOpenMenu.openMenu) and (primed) {
    grid=get_integer("Set grid snap",32)
    if (grid > 800) grid = 32
    if (grid <= 0) grid = 32
    objObjSelect.grid=round(grid)
}
event_inherited()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_set_color($000000)
draw_set_valign(fa_middle)
draw_text(x+9,y+height/2,"Snap: " + string(objObjSelect.grid))
draw_set_valign(fa_top)
