#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
txt="Are you sure you want#to clear the room?"
btn1="Yes"
btn2="No"
hover1=false
hover2=false
primed1=false
primed2=false
bg1=$DDDDDD
bg2=$DDDDDD

width=400
scr=resetRoom
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (curInside(300,334,372,370)) {
    hover1=true
    bg1=$BBBBBB
    if (mouse_check_button(mb_left)) {
        primed1=true
        bg1=$FFFFFF
    }
    if (mouse_check_button_released(mb_left)) and (primed1) {
        primed1=false
        script_execute(scr)
        instance_destroy()
    }
} else {
    hover1=false
    bg1=$DDDDDD
}

if (curInside(428,334,500,370)) {
    hover2=true
    bg2=$BBBBBB
    if (mouse_check_button(mb_left)) {
        primed2=true
        bg2=$FFFFFF
    }
    if (mouse_check_button_released(mb_left)) and (primed2) {
        primed2=false
        instance_destroy()
    }
} else {
    hover2=false
    bg2=$DDDDDD
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
draw_rectangle(400-width/2,208,400+width/2,400,0)
draw_set_color($000000)
draw_rectangle(400-width/2,208,400+width/2,400,1)

//button1
draw_set_color(bg1)
draw_rectangle(300,334,372,370,0)
draw_set_color($000000)
draw_rectangle(300,334,372,370,1)

//button2
draw_set_color(bg2)
draw_rectangle(428,334,500,370,0)
draw_set_color($000000)
draw_rectangle(428,334,500,370,1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(400,256,txt)
draw_text(336,352,btn1)
draw_text(464,352,btn2)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
