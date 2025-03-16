#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
length=savedatap("trailLength")-1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) {
    input=get_integer("Set trail length",0)
    if (input >= 0) {
        length=input
    } else if (input > 1000) {
        length=1000
    } else {
        length=0
    }
    if (length > savedatap("trailLength")) {
        with (Player) {
            for (i=0; i<other.length+1; i+=1) {
                xarray[i]=x
                yarray[i]=y
                spriteindexarray[i]=sprite_index
                imageindexarray[i]=image_index
                facingarray[i]=facing
                vfliparray[i]=vflip
            }
        }
    }
    with (Player) {
        trailLength=other.length+1
    }
    savedatap("trailLength",length+1)
}
event_inherited()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_set_color($000000)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x+width/2,y+height/2,"Trail Length: " + string(length))
draw_set_valign(fa_top)
draw_set_halign(fa_left)
