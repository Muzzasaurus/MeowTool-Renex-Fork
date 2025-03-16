#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($DDDDDD)
draw_rectangle(x,y,x+121,y+37,0)
draw_set_color($000000)
draw_set_valign(fa_middle)
draw_text(x+9,y+19,"FPS: " + string(fps_fast))
draw_set_valign(fa_top)
draw_rectangle(x,y,x+121,y+37,1)
