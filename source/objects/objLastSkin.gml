#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
bg=noone
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (objOpenMenu.openMenu) and (primed) changeSkin(-1)
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
draw_text(x+50,y+11,"Last Skin")
draw_set_halign(fa_left)
