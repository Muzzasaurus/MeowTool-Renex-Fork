#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=false
primed=false
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
primed=true
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
loadMap()
primed=false
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=true
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=false
primed=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hover) {
    draw_set_color($BBBBBB)
} else if (primed) {
    draw_set_color($FFFFFF)
} else {
    draw_set_color($DDDDDD)
}
draw_rectangle(x,y,x+100,y+37,0)
draw_set_color($000000)
draw_set_halign(fa_center)
draw_text(x+50,y+11,"Load Map")
draw_set_halign(fa_left)
draw_rectangle(x,y,x+100,y+37,1)
