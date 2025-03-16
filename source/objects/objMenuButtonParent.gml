#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=false
primed=false
width=126
height=38
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(objMenu)) y=ystart+objMenu.y
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (instance_exists(objOpenMenu)) {if (objOpenMenu.openMenu) primed=true; hover=false}
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
primed=false
hover=false
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (instance_exists(objOpenMenu)) {if (objOpenMenu.openMenu) hover=true}
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=false
primed=false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=width
image_yscale=height
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
draw_rectangle(x,y,x+width-1,y+height-1,0)
draw_set_color($000000)
draw_rectangle(x,y,x+width-1,y+height-1,1)
