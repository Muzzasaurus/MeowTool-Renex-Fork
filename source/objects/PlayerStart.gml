#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (PlayerStart) {
    if (id != other.id) instance_destroy()
}
if (!instance_exists(savedata("obj"))) {
    (instance_create(x+17*image_xscale,y+23,savedata("obj"))).facing=image_xscale
} else {
    move_player(x+17,y+23,0)
    Player.facing=1
}
savedatap("x",x+17)
savedatap("y",y+23)
savedatap("facing",1)
warpid=""
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field warpid: string
