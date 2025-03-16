#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) and (!objObjSelect.changesMade) {
    event_game_end()
} else if (!instance_exists(objPopup)) {
    o=instance_create(0,0,objPopup)
    o.txt="Are you sure you want#to quit?"
    o.scr=event_game_end
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
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x+width/2,y+height/2,"Quit")
draw_set_valign(fa_top)
draw_set_halign(fa_left)
