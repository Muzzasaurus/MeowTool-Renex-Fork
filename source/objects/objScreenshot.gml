#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and (objOpenMenu.openMenu) and (primed) {
    directory_create(global.shotfolder)
    fn=global.shotfolder+current_date_filename()+".png"
    i=1
    while (file_exists(fn)) {
        i+=1
        fn=global.shotfolder+current_date_filename()+" ("+string(i)+").png"
    }
    sf=surface_create(800,608)
    surface_set_target(sf)
    objMenu.visible=false
    with (objMenuButtonParent) visible=false
    objObjSelect.visible=false
    screen_redraw()
    objObjSelect.visible=true
    with (objMenuButtonParent) visible=true
    objMenu.visible=true
    surface_save(sf,fn)
    surface_reset_target()
    surface_free(sf)
    show_message_left(lang("screenshot"))
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
draw_text(x+width/2,y+height/2,"Screenshot")
draw_set_valign(fa_top)
draw_set_halign(fa_left)
