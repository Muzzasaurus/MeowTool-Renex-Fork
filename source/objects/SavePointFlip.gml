#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mydifficulty=1
event_inherited()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///schedule save
if (image_index==0) {
    with (Player) if (instance_place(x,y,AntiSoftlockBlock)) exit
    if ((Player.vflip==-1 && (image_angle<45 || image_angle>315)) || (Player.vflip==1 && abs(image_angle-180)<45) || global.flip_saves) {
        save=1
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprSaveHard,floor(image_index),x+31,y+31,1,1,180,c_white,1)
