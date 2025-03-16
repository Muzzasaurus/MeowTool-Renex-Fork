#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
txt="Info##Scroll in the palette to access more objects#Press E to enter/exit edit mode#Press space to freeze the kid and show trail#Press G to quickly change grid snap#Press S to save in place#Press W or tab to teleport the kid to cursor"
btn1="Back"
hover1=false
primed1=false
bg1=$DDDDDD

width=400
height=256
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (curInside(364,304+height/2-44,436,304+height/2-8)) {
    hover1=true
    bg1=$BBBBBB
    if (mouse_check_button(mb_left)) {
        primed1=true
        bg1=$FFFFFF
    }
    if (mouse_check_button_released(mb_left)) and (primed1) {
        primed1=false
        instance_destroy()
    }
} else {
    hover1=false
    bg1=$DDDDDD
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//darken the background
draw_set_color($000000)
draw_set_alpha(0.3)
draw_rectangle(0,0,room_width,room_height,0)
draw_set_alpha(1)

//main popup bg
draw_set_color($BBBBBB)
draw_rectangle(400-width/2,304-height/2,400+width/2,304+height/2,0)
draw_set_color($000000)
draw_rectangle(400-width/2,304-height/2,400+width/2,304+height/2,1)

//button1
draw_set_color(bg1)
draw_rectangle(364,304+height/2-44,436,304+height/2-8,0)
draw_set_color($000000)
draw_rectangle(364,304+height/2-44,436,304+height/2-8,1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(400,270,txt)
draw_text(400,304+height/2-26,btn1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
