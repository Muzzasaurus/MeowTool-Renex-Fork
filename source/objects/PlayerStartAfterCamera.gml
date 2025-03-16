#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(World)) {
    if (!instance_exists(savedata("obj"))) {
        (instance_create(x+17*image_xscale,y+23,savedata("obj"))).facing=image_xscale
    }
} else alarm[0]=1
warpid=""
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (World.camera_initialised) {
    alarm[1]=200
} else alarm[0]=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(savedata("obj"))) {
    (instance_create(x+17*image_xscale,y+23,savedata("obj"))).facing=image_xscale
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field warpid: string
