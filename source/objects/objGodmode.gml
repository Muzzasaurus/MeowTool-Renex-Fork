#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) {
    Player.godMode=!Player.godMode
    savedatap("godMode",Player.godMode)
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
if (Player.godMode) {
    draw_text(x+width/2,y+height/2,"Godmode: ON")
} else {
    draw_text(x+width/2,y+height/2,"Godmode: OFF")
}
draw_set_valign(fa_top)
draw_set_halign(fa_left)
