#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0; i<6; i+=1) {
    for (j=0; j<7; j+=1) {
        o=instance_create(805+42*i,50+42*j,objSelectable)
        o.objIndex=SpikeU
    }
}
with (objSelectable) {
    event_user(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($000000)
draw_line(800,0,800,room_height)
