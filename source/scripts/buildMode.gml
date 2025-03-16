///buildMode
mode = "build"
z=0
zz=0
selectBoxDraw=false
for (i=0; i<ds_list_size(selectedObjects); i+=1) {
    instance=ds_list_find_value(selectedObjects,i)
    instance.image_blend=c_white
}
drawTop=infinity
drawLeft=infinity
drawBottom=0
drawRight=0
ds_list_clear(selectedObjects)
