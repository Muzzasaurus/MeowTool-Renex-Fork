#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) {
    if (!objObjSelect.changesMade) {
        loadMap()
    } else if (!instance_exists(objPopup)) {
        o=instance_create(0,0,objPopup)
        o.txt="Map has been edited, are#do you want to discard these changes?"
        o.scr=loadMap
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
draw_set_color($000000)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x+width/2,y+height/2,"Load Map")
draw_set_valign(fa_top)
draw_set_halign(fa_left)
