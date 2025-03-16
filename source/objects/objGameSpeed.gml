#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
gameSpeed=global.game_speed
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (!objOpenMenu.openMenu) and (primed) {
    gameSpeed=get_integer("Set room speed",50)
    if (gameSpeed > 1000) gameSpeed = 50
    if (gameSpeed <= 0) gameSpeed = 50
    room_speed=gameSpeed
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
draw_text(x+9,y+height/2,"Speed: " + string(gameSpeed))
draw_set_valign(fa_top)
