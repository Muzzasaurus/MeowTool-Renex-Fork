#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
width=101
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (!objOpenMenu.openMenu) and (primed) {
    instance_create(0,0,objInfoPopup)
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
draw_set_halign(fa_center)
draw_text(x+width/2,y+height/2,"Info")
draw_set_halign(fa_left)
draw_set_valign(fa_top)
