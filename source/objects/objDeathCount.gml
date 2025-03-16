#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
deaths=0
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (!objOpenMenu.openMenu) and (primed) {
    input=get_integer("Set death count",0)
    if (input >= 0) {
        deaths=input
    } else {
        deaths=0
    }
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
draw_set_valign(fa_middle)
draw_text(x+9,y+height/2,"Deaths: " + string(deaths))
draw_set_valign(fa_top)
