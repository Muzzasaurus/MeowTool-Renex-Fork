#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
jump=0
pause=0
jump2=0
pause2=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (key_jump(vi_released)) or (Player.onGround) or (jump == 23) {
    alarm[0]=0
    alarm[2]=1
    pause=0
    exit
}
alarm[0]=1
jump+=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (key_jump(vi_released)) or (Player.onGround) or (jump2 == 19) {
    alarm[1]=0
    alarm[3]=1
    pause2=0
    exit
}
alarm[1]=1
jump2+=1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Player.onGround) {
    alarm[2]=0
    exit
}
alarm[2]=1
pause+=1
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Player.onGround) {
    alarm[3]=0
    exit
}
alarm[3]=1
pause2+=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($DDDDDD)
draw_rectangle(x,y,x+121,y+87,0)
draw_set_color($000000)
draw_text(x+9,y+6,"Jump: " + string(jump))
draw_text(x+9,y+26,"Pause: " + string(pause))
draw_text(x+9,y+46,"DJump: " + string(jump2))
draw_text(x+9,y+66,"Pause: " + string(pause2))
draw_rectangle(x,y,x+121,y+87,1)
#define Trigger_On Player Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
jump=1
#define Trigger_On Player Djump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=1
alarm[2]=0
jump2=1
