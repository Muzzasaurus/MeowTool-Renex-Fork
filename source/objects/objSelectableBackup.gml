#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
objIndex=SpikeU
hover=false
primed=false
drawSprite=0
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
primed=true
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
objObjSelect.selectedObj=objIndex
primed=false
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=true
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=false
primed=false
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprIndex=object_get_sprite(objIndex)
drawX=x+19-sprite_get_width(sprIndex)/2+sprite_get_xoffset(sprIndex)
drawY=y+19-sprite_get_height(sprIndex)/2+sprite_get_yoffset(sprIndex)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hover) {
    draw_set_color($BBBBBB)
} else if (primed) {
    draw_set_color($FFFFFF)
} else {
    draw_set_color($DDDDDD)
}
draw_rectangle(x,y,x+37,y+37,0)
draw_set_color($000000)
draw_rectangle(x,y,x+37,y+37,1)
draw_sprite(sprIndex,drawSprite,drawX+0.5,drawY)
