#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
left = 0
up = 0
right = 0
down = 0
ready = true
startLaunch = false
val = 240
image_speed = 1/8
image_index = floor(global.increment/8)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(startLaunch) {
    kill_player()
    visible=false
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready = true
image_alpha = 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend = make_color_hsv(0,0,val)
image_angle += 3

if(startLaunch) {
    if (val > 0)
        val -= 24
    Player.x = x
    Player.y = y + 2
    Player.hspeed = 0
    Player.vspeed = 0
    with(Player) if(key_shoot(vi_pressed)) {
        fricSpeed = true
        decRate = decRateDefault
        if (input_h!=0) {
            if(input_v == 0)
                maxSpeed += 6
            else
                maxSpeed += 4
            }
            //if (Player.maxSpeed > 41) and (lim == true) Player.maxSpeed = 41
        if (input_v!=0)
            vspeed = input_v*9 - 2
        else
            vspeed = 0
        suspended = false
        other.image_alpha = 0.4
        other.alarm[1] = 100
        other.startLaunch  = false
        other.val = 240
        sound_play_slomo("void_booster")
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(ready) and (visible) {
    startLaunch = true
    alarm[0] = 50
    ready = false
    Player.x = x
    Player.y = y
    Player.hspeed = 0
    Player.vspeed = 0
    Player.suspended = true
}
