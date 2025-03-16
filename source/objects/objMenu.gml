#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
height=256
y=-height
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_set_color($BBBBBB)
//draw_rectangle(x,y,x+room_width-1,y+height,0)
draw_sprite_stretched(sprMenu,0,x,y,room_width,256)
draw_set_color($000000)
draw_rectangle(x,y,x+room_width-1,y+height,1)
