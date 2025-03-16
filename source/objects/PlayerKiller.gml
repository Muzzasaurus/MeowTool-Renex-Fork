#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_blend != c_white) and (image_blend != $ff8957) {
    col = make_color_hsv(color_get_hue(image_blend),lerp(color_get_saturation(image_blend),0,0.25),lerp(color_get_value(image_blend),255,0.25))
    image_blend = col
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_blend != $ff8957) {
    image_blend=$7070FF
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field depth: number
