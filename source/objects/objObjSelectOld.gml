#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0; i<6; i+=1) {
    for (j=0; j<7; j+=1) {
        objList[i,j]=SpikeU
        objListSprite[i,j]=object_get_sprite(objList[i,j])
        objListHover[i,j]=false
        objListActive[i,j]=false
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (curInside(804,3,1052,604)) {
    for (i=0; i<6; i+=1) {
        for (j=0; j<7; j+=1) {
            if (curInside(805+42*i,50+42*j,842+42*i,87+42*j)) {
                objListHover[i,j]=true
            } else {
                objListHover[i,j]=false
            }
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($000000)
draw_text(32,32,mouse_x)
draw_text(32,64,mouse_y)

draw_line(800,0,800,room_height)

for (i=0; i<6; i+=1) {
    for (j=0; j<7; j+=1) {
        draw_set_color($FFFFFF)
        if (objListHover[i,j]) draw_set_color($BBBBBB)
        draw_rectangle(805+42*i,50+42*j,842+42*i,87+42*j,0)
        draw_set_color($000000)
        draw_rectangle(805+42*i,50+42*j,842+42*i,87+42*j,1)
        draw_sprite(object_get_sprite(objList[i,j]),0,808+42*i,53+42*j)
    }
}
draw_set_color($FFFFFF)
