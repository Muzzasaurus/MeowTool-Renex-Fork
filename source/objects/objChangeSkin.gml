#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
height=80
bg=noone
defaultDir="data\skins\default\"
str=""
changeSkin(0)
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) {
    if (mouse_xfixed < x+image_xscale/2-1) {
        changeSkin(-1)
    } else {
        changeSkin(1)
    }
}
event_inherited()
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
if (mouse_xfixed < x+image_xscale/2-1) {
    draw_rectangle(x,y,x+width/2-1,y+height-1,0)
    draw_set_color($DDDDDD)
    draw_rectangle(x+width/2-1,y,x+width-1,y+height-1,0)
} else {
    draw_rectangle(x+width/2-1,y,x+width-1,y+height-1,0)
    draw_set_color($DDDDDD)
    draw_rectangle(x,y,x+width/2-1,y+height-1,0)
}
draw_set_color($000000)
draw_rectangle(x,y,x+width-1,y+height-1,1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if (!global.pause) {
    str=string_lettersdigits(string_replace(objSkinManager.folders[savedatap("textureSkin")],"data\skins\",""))
}
draw_text(x+width/2,y+height/2,"Current Skin:#" + str)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
