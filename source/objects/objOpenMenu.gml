#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
openMenu=false
width=101
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (openMenu) and (instance_exists(objMenu)) {
    objMenu.y=lerp(objMenu.y,0,0.2)
    if (objMenu.y >= -0.8) objMenu.y=0
} else {
    objMenu.y=lerp(objMenu.y,-objMenu.height-1,0.2)
    if (objMenu.y <= -objMenu.height-0.2) objMenu.y=-objMenu.height-1
}
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (!openMenu) and (primed) openMenu=!openMenu
event_inherited()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_set_color($000000)
draw_set_halign(fa_center)
draw_text(x+width/2,y+11,"Open Menu")
draw_set_halign(fa_left)
