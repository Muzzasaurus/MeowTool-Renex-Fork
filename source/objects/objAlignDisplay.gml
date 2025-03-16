#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($DDDDDD)
draw_rectangle(x,y,x+121,y+67,0)
draw_set_color($000000)
if (instance_exists(Player)) {
    draw_text(x+9,y+6,"Align: " + string(Player.x mod 3))
    draw_text(x+9,y+26,"X: " + string(Player.x))
    draw_text(x+9,y+46,"Y: " + string(Player.y))
} else {
    draw_text(x+9,y+6,"Align: 0")
    draw_text(x+9,y+26,"X: 0")
    draw_text(x+9,y+46,"Y: 0")
}
draw_rectangle(x,y,x+121,y+67,1)
