#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($000000)
draw_set_alpha(0.3)
if (objObjSelect.drawGrid) {
    for (i=0; i<800/objObjSelect.grid; i+=1) {
        draw_line(i*objObjSelect.grid,0,i*objObjSelect.grid,608)
    }
    for (i=0; i<608/objObjSelect.grid; i+=1) {
        draw_line(0,i*objObjSelect.grid,800,i*objObjSelect.grid)
    }
}
if (objObjSelect.gridAlpha > 0) {
    draw_set_alpha(objObjSelect.gridAlpha/2)
    for (i=0; i<800/objObjSelect.grid; i+=1) {
        draw_line(i*objObjSelect.grid,0,i*objObjSelect.grid,608)
    }
    for (i=0; i<608/objObjSelect.grid; i+=1) {
        draw_line(0,i*objObjSelect.grid,800,i*objObjSelect.grid)
    }
    objObjSelect.gridAlpha-=0.05
}
draw_set_alpha(1)
