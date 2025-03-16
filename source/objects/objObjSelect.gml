#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Initialise variables
selectedObj=Block
grid=32
insideScreen=false
drawGrid=savedatap("grid")
gridAlpha=0
saving=false
saved=0
name=room_get_name(room)+"@"+string(round(x))+"x"+string(round(y))
mode="build"

columns=6
rows=14

placeOffsetX=0
placeOffsetY=0
targetX=0
targetY=0

drawYOffset=0
palettePosition=0
targetPosition=0
scrollLength=42
paletteTopBorder=51
paletteBottomBorder=340
movingObj=false
moveObj=noone
z=0
zz=0

selectBoxX=0
selectBoxY=0
selectBoxDraw=false
selectedObjects=ds_list_create()
drawTop=infinity
drawLeft=infinity
drawBottom=0
drawRight=0
scaling=false
scaleXFactor=1
scaleYFactor=1

changesMade=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Set up palette
k=0
for (i=0; i<rows; i+=1) {
    for (j=0; j<columns; j+=1) {
        k+=1
        o=instance_create(805+42*j,51+42*i,objSelectable)
        o.tag=k
        o.paletteTopBorder=paletteTopBorder
        o.paletteBottomBorder=paletteBottomBorder
    }
}
initialiseSelectables()
with (objSelectable) {
    event_user(0)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Set up arrays
createArray[0]=0
deleteArray[0]=0

spikeArray[0]=SpikeU
spikeArray[1]=SpikeR
spikeArray[2]=SpikeD
spikeArray[3]=SpikeL

miniSpikeArray[0]=MiniSpikeUp
miniSpikeArray[1]=MiniSpikeRight
miniSpikeArray[2]=MiniSpikeDown
miniSpikeArray[3]=MiniSpikeLeft

slopeArray[0]=SlopeBR
slopeArray[1]=SlopeBL
slopeArray[2]=SlopeTL
slopeArray[3]=SlopeTR
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ds_list_destroy(selectedObjects)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Hotkeys
//0-9
if (keyboard_check_pressed(ord("1"))) {
    if (selectedObj == Block) selectedObj=MiniBlock
    else selectedObj=Block
}
if (keyboard_check_pressed(ord("2"))) {
    i=-1
    switch (selectedObj) {
        case SpikeU: i=1 break
        case SpikeR: i=2 break
        case SpikeD: i=3 break
        case SpikeL: i=0 break
    }
    if (i != -1) selectedObj=spikeArray[i]
    else selectedObj=SpikeU
}
if (keyboard_check_pressed(ord("3"))) {
    i=-1
    switch (selectedObj) {
        case MiniSpikeUp: i=1 break
        case MiniSpikeRight: i=2 break
        case MiniSpikeDown: i=3 break
        case MiniSpikeLeft: i=0 break
    }
    if (i != -1) selectedObj=miniSpikeArray[i]
    else selectedObj=MiniSpikeUp
}
//Tab and W
if (keyboard_check_pressed(ord("W"))) or (keyboard_check_pressed(vk_tab)) {
    savedata_load()
    dead=0
    instance_destroy_id(BloodEmitter)
    instance_destroy_id(Blood)
    instance_destroy_id(GibParticle)
    sound_stop("sndDeath")
    move_player(mouse_xfixed,mouse_y,0)
}
//S
if (keyboard_check_pressed(ord("S"))) {
    saving=true
}
//G
if (keyboard_check_pressed(ord("G"))) {
    if (grid > 8) {
        grid = round(grid/2)
    } else {
        grid = 32
    }
    if (!drawGrid) {
        gridAlpha=1
    }
}
//Esc
if (keyboard_check_pressed(vk_escape)) {
    if (instance_exists(objPopup)) {
        with (objPopup) instance_destroy()
    } else {
        objOpenMenu.openMenu=!objOpenMenu.openMenu
    }
}
//F2
if (keyboard_check_pressed(vk_f2)) {
    if (!objObjSelect.changesMade) {
        resetRoom()
    } else if (!instance_exists(objPopup)) {
        instance_create(0,0,objPopup)
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Turn bullet blockers visible when selected
if (selectedObj == BulletBlock) {
    with (BulletBlock) {
        visible=true
    }
} else {
    with (BulletBlock) {
        visible=false
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Update palette position
palettePosition = lerp(palettePosition, targetPosition, 0.2)
if (abs(palettePosition - targetPosition) < 0.1) palettePosition = targetPosition
drawYOffset = instance_number(objTabButton)*16+palettePosition
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Move obj
if (movingObj) {
    with (moveObj) {
        x=other.targetX
        y=other.targetY
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Switch to edit mode
//if (key_edit(vi_pressed)) {
if (keyboard_check_pressed(ord("E"))) {
    if (mode == "build") {
        editMode()
    } else {
        buildMode()
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Scale objects
if (scaling) and (!ds_list_empty(selectedObjects)) {
    /*for (i=0; i<ds_list_size(selectedObjects); i+=1) {
        instance=ds_list_find_value(selectedObjects,i)
        instance.image_xscale=instance.startXScale+(round(mouse_xfixed/grid-scaleXStart/grid)*grid)/grid
        instance.image_yscale=instance.startYScale+(round(mouse_y/grid-scaleYStart/grid)*grid)/grid

        drawTop=min(instance.bbox_top,drawTop)
        drawLeft=min(instance.bbox_left,drawLeft)
        drawBottom=max(instance.bbox_bottom,drawBottom)
        drawRight=max(instance.bbox_right,drawRight)
    }*/
    //Find scale factor
    currentWidth=drawRight-drawLeft+1
    currentHeight=drawBottom-drawTop+1
    targetWidth=(round(mouse_xfixed/grid)*grid)-drawLeft
    targetHeight=(round(mouse_y/grid)*grid)-drawTop
    scaleXFactor=max(0.03125,targetWidth/startWidth)
    scaleYFactor=max(0.03125,targetHeight/startHeight)
    posXFactor=max(0.03125,targetWidth/currentWidth)
    posYFactor=max(0.03125,targetHeight/currentHeight)

    xOrigin=drawLeft
    yOrigin=drawTop
    drawTop=infinity
    drawLeft=infinity
    drawBottom=0
    drawRight=0
    for (i=0; i<ds_list_size(selectedObjects); i+=1) {
        instance=ds_list_find_value(selectedObjects,i)
        if (instance_exists(instance)) {
            instance.image_xscale=instance.startXScale*scaleXFactor
            instance.image_yscale=instance.startYScale*scaleYFactor
            instance.x=(instance.x-xOrigin)*posXFactor+xOrigin
            instance.y=(instance.y-yOrigin)*posYFactor+yOrigin

            drawTop=min(instance.bbox_top,drawTop)
            drawLeft=min(instance.bbox_left,drawLeft)
            drawBottom=max(instance.bbox_bottom,drawBottom)
            drawRight=max(instance.bbox_right,drawRight)
        }
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Call this function only once as it's pretty laggy
insideScreen=curInside(0,0,800,608)
insidePalette=curInside(801,51,1052,340)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Save
if (saving) {
    saving=false

    if (global.press_shoot_saves) {
        //disallow saving outside of contact saves
        if (!instance_place(x,y,Player)) exit
    }

    image_index=1
    image_speed=1/room_speed
    sound_play("sndShoot")

    savedata_save(false,name)

    if (global.centered_saving) {
        savedatap("x",x+17)
        if (global.save_valign && settings("valign")) savedatap("y",y+16+7*Player.vflip)
        else savedatap("y",floor(y+16+7*Player.vflip))
    }
    saved=1
    saveX=Player.x-16
    saveY=Player.y-16
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Find where the selected object should be placed
if (selectedObj != noone) {
    sprIndex=object_get_sprite(selectedObj)
    mask_index=sprIndex
    placeOffsetX=sprite_get_width(sprIndex)/2-sprite_get_xoffset(sprIndex)
    placeOffsetY=sprite_get_height(sprIndex)/2-sprite_get_yoffset(sprIndex)
    targetX=round(mouse_xfixed/grid-placeOffsetX/grid)*grid
    targetY=round(mouse_y/grid-placeOffsetY/grid)*grid
}
#define Mouse_50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Place object
if (mode == "build") {
    if (mouse_check_button_pressed(mb_left)) {
        z=0
    }

    if (instance_exists(objOpenMenu)) {
        if ((insideScreen) and (selectedObj != noone)) and (!objOpenMenu.openMenu) and (!instance_exists(objPopup) and (!mouse_check_button(mb_right)) and (!mouse_check_button(mb_middle))) {
            if ((!instance_place(targetX,targetY,selectedObj)) or (mouse_check_button_pressed(mb_left))) {
                //Create object
                o=instance_create(targetX,targetY,selectedObj)
                //Add object creation info to array
                createArray[z+2] = string(o.x) + "x" + string(o.y) + "y" + /*string(o.image_xscale) + "xs" + string(o.image_yscale) + "ys" +*/ string(o.object_index) + ","
                z+=1
                //Check for Ladder edge case
                if (selectedObj == Ladder) {
                    if (o.plat != noone) {
                        createArray[z+2] = string(o.x) + "x" + string(o.y) + "y" + /*string(o.image_xscale) + "xs" + string(o.image_yscale) + "ys" +*/ string(CustomSnap) + ","
                        z+=1
                    }
                }
                changesMade=true
            }
        }
    }
} else if (mode == "edit") {
    if (mouse_check_button_pressed(mb_left)) {
        if (!ds_list_empty(selectedObjects)) {
            if (curInside(drawRight-10,drawBottom-10,drawRight+10,drawBottom+10)) {
                scaling=true
            }
        }
        if (!scaling) {
            selectBoxX=mouse_xfixed
            selectBoxY=mouse_y
            selectBoxDraw=true
        }
    }
}
#define Mouse_51
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Delete objects
if (mode == "build") {
    if (mouse_check_button_pressed(mb_right)) {
        zz=0
    }

    if (instance_exists(objOpenMenu)) {
        if (insideScreen) and (!objOpenMenu.openMenu) and (!instance_exists(objPopup) and (!mouse_check_button(mb_left)) and (!mouse_check_button(mb_middle))) {
            obj=instance_position(mouse_xfixed,mouse_y,all)
            while (obj != noone) {
                deleteObj=false
                if (objInPalette(obj.object_index)) and (obj.object_index != PlayerStart) {
                    deleteObj=true
                }
                if (deleteObj) {
                    deleteArray[zz+2] = string(obj.x) + "x" + string(obj.y) + "y" + /*string(obj.image_xscale) + "xs" + string(obj.image_yscale) + "ys" +*/ string(obj.object_index) + ","
                    zz+=1
                    changesMade=true
                    instance_destroy_id(obj)
                    obj=instance_position(mouse_xfixed,mouse_y,all)
                } else {
                    obj=noone
                }
            }
        }
    }
} else if (mode == "edit") {
    if (mouse_check_button_pressed(mb_right)) {
        for (i=0; i<ds_list_size(selectedObjects); i+=1) {
            instance=ds_list_find_value(selectedObjects,i)
            instance.image_blend=c_white
        }
        ds_list_clear(selectedObjects)
        drawTop=infinity
        drawLeft=infinity
        drawBottom=0
        drawRight=0
    }
}
#define Mouse_55
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Move objects
if (instance_exists(objOpenMenu)) {
    if (insideScreen) and (!objOpenMenu.openMenu) and (!instance_exists(objPopup) and (!mouse_check_button(mb_left)) and (!mouse_check_button(mb_right)) ) {
        if (mode == "build") {
            obj=instance_position(mouse_xfixed,mouse_y,all)
            if (obj != noone) {
                if (objInPalette(obj.object_index)) {
                    movingObj=true
                    moveObj=obj
                    moveObjStartX=obj.x
                    moveObjStartY=obj.y
                }
            }
        } else if (mode == "edit") {
            //MOVE EM ALL
        }
    }
}
#define Mouse_56
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mode == "build") {
    if (z != 0) {
        createArray[0]=z+2
        createArray[1]="create"
        for (j=0; j<z+2; j+=1) {
            objUndoRedo.undoArray[objUndoRedo.arrayPos,j] = createArray[j]
        }
        if (objUndoRedo.arrayPos == objUndoRedo.undoArrayLength) {
            objUndoRedo.undoArrayLength+=1
        }
        objUndoRedo.arrayPos+=1
    }
} else if (mode == "edit") {
    selectBoxDraw=false
    if (scaling) {
        scaling=false
        for (i=0; i<ds_list_size(selectedObjects); i+=1) {
            instance=ds_list_find_value(selectedObjects,i)
            if (instance_exists(instance)) {
                instance.startXScale=instance.image_xscale
                instance.startYScale=instance.image_yscale
            }
        }
    } else {
        with (all) {
            if (objInPalette(object_index)) {
                __centerX=(bbox_left+bbox_right)/2
                __centerY=(bbox_top+bbox_bottom)/2
                if (__centerX >= (min(other.selectBoxX,mouse_xfixed)))
                and (__centerX <= (max(other.selectBoxX,mouse_xfixed)))
                and (__centerY >= (min(other.selectBoxY,mouse_y)))
                and (__centerY <= (max(other.selectBoxY,mouse_y))) {
                    ds_list_add(other.selectedObjects,id)
                    image_blend=$ff8957
                }
            }
        }
        for (i=0; i<ds_list_size(selectedObjects); i+=1) {
            instance=ds_list_find_value(selectedObjects,i)
            if (instance_exists(instance)) {
                drawTop=min(instance.bbox_top,drawTop)
                drawLeft=min(instance.bbox_left,drawLeft)
                drawBottom=max(instance.bbox_bottom,drawBottom)
                drawRight=max(instance.bbox_right,drawRight)
                instance.startXScale=instance.image_xscale
                instance.startYScale=instance.image_yscale
            }
        }
        startWidth=drawRight-drawLeft+1
        startHeight=drawBottom-drawTop+1
    }
}
#define Mouse_57
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (zz != 0) {
    deleteArray[0]=zz+2
    deleteArray[1]="delete"
    for (k=0; k<zz+2; k+=1) {
        objUndoRedo.undoArray[objUndoRedo.arrayPos,k] = deleteArray[k]
    }
    if (objUndoRedo.arrayPos == objUndoRedo.undoArrayLength) {
        objUndoRedo.undoArrayLength+=1
    }
    objUndoRedo.arrayPos+=1
}
#define Mouse_58
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
movingObj=false
if (moveObj != noone) {
    moveObjIndex=moveObj.object_index
    objUndoRedo.undoArray[objUndoRedo.arrayPos,0] = 3
    objUndoRedo.undoArray[objUndoRedo.arrayPos,1] = "move"
    moveStr=string(moveObjStartX) + "x" + string(moveObjStartY) + "y" + string(moveObj.x) + "x" + string(moveObj.y) + "y" + string(moveObj.object_index) + ","
    objUndoRedo.undoArray[objUndoRedo.arrayPos,2] = moveStr
    if (objUndoRedo.arrayPos == objUndoRedo.undoArrayLength) {
        objUndoRedo.undoArrayLength+=1
    }
    objUndoRedo.arrayPos+=1
    changesMade=true
}
moveObj=noone
#define Mouse_60
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cycle through relevant objects
if (insideScreen) {
    //rotate spikes
    i=-1
    switch (selectedObj) {
        case SpikeU: i=3 break
        case SpikeR: i=0 break
        case SpikeD: i=1 break
        case SpikeL: i=2 break
    }
    if (i != -1) selectedObj=spikeArray[i]

    //rotate mini spikes
    i=-1
    switch (selectedObj) {
        case MiniSpikeUp: i=3 break
        case MiniSpikeRight: i=0 break
        case MiniSpikeDown: i=1 break
        case MiniSpikeLeft: i=2 break
    }
    if (i != -1) selectedObj=miniSpikeArray[i]

    //Block
    if (selectedObj == Block) {selectedObj=MiniBlock; exit}
    if (selectedObj == MiniBlock) {selectedObj=Block; exit}

    //Platform
    if (selectedObj == Platform) {selectedObj=SidewaysPlatform; exit}
    if (selectedObj == SidewaysPlatform) {selectedObj=Platform; exit}

    //Slopes
    i=-1
    switch (selectedObj) {
        case SlopeBR: i=3 break
        case SlopeBL: i=0 break
        case SlopeTL: i=1 break
        case SlopeTR: i=2 break
    }
    if (i != -1) selectedObj = slopeArray[i]
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Scroll menu
if (!insideScreen) {
    targetPosition+=scrollLength
    if (targetPosition > 0) targetPosition = 0
    with (objSelectable) {
        hover=false
        primed=false
    }
}
#define Mouse_61
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cycle through relevant objects
if (insideScreen) {
    //rotate spikes
    i=-1
    switch (selectedObj) {
        case SpikeU: i=1 break
        case SpikeR: i=2 break
        case SpikeD: i=3 break
        case SpikeL: i=0 break
    }
    if (i != -1) selectedObj=spikeArray[i]

    //rotate mini spikes
    i=-1
    switch (selectedObj) {
        case MiniSpikeUp: i=1 break
        case MiniSpikeRight: i=2 break
        case MiniSpikeDown: i=3 break
        case MiniSpikeLeft: i=0 break
    }
    if (i != -1) selectedObj=miniSpikeArray[i]

    //Block
    if (selectedObj == Block) {selectedObj=MiniBlock; exit}
    if (selectedObj == MiniBlock) {selectedObj=Block; exit}

    //Platform
    if (selectedObj == Platform) {selectedObj=SidewaysPlatform; exit}
    if (selectedObj == SidewaysPlatform) {selectedObj=Platform; exit}

    //Slopes
    i=-1
    switch (selectedObj) {
        case SlopeBR: i=1 break
        case SlopeBL: i=2 break
        case SlopeTL: i=3 break
        case SlopeTR: i=0 break
    }
    if (i != -1) selectedObj = slopeArray[i]
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Scroll menu
if (!insideScreen) {
    targetPosition-=scrollLength
    if (targetPosition < -(rows-7)*42) targetPosition = -(rows-7)*42
    with (objSelectable) {
        hover=false
        primed=false
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($000000)
draw_set_alpha(0.3)
//draw grid
/*if (drawGrid) {
    for (i=0; i<800/grid; i+=1) {
        draw_line(i*grid,0,i*grid,608)
    }
    for (i=0; i<608/grid; i+=1) {
        draw_line(0,i*grid,800,i*grid)
    }
}
if (gridAlpha > 0) {
    draw_set_alpha(gridAlpha/2)
    for (i=0; i<800/grid; i+=1) {
        draw_line(i*grid,0,i*grid,608)
    }
    for (i=0; i<608/grid; i+=1) {
        draw_line(0,i*grid,800,i*grid)
    }
    gridAlpha-=0.05
}*/
draw_set_alpha(1)
draw_set_font(fntFileSmall)
//draw sidebar
draw_sprite(sprSidebar,0,800,0)
draw_set_color($000000)
draw_line(800,0,800,room_height)
draw_set_color($FFFFFF)
//draw selected obj sprite
if (mode == "build") {
    if (selectedObj == SavePointFlip) {
        draw_sprite_ext(sprSaveHard,0,targetX+31,targetY+31,1,1,180,c_white,0.5)
    } else if (selectedObj != noone) and (insideScreen) {
        draw_sprite_ext(object_get_sprite(selectedObj),0,targetX,targetY,1,1,0,$FFFFFF,0.5)
    }
}
if (mode == "edit") {
    if (selectBoxDraw) {
        draw_set_color($CC7A00)
        draw_rectangle(selectBoxX,selectBoxY,mouse_xfixed,mouse_y,true)
        draw_set_alpha(0.3)
        draw_rectangle(selectBoxX,selectBoxY,mouse_xfixed,mouse_y,false)
    }
    if (!ds_list_empty(selectedObjects)) {
        draw_set_alpha(0.7)
        draw_set_color(c_black)
        draw_rectangle(drawLeft,drawTop,drawRight,drawBottom,true)
        draw_sprite(sprScaleButton,0,drawRight,drawBottom)
    }
    draw_set_alpha(1)
    if (scaling) {
        draw_text(drawRight-40,drawBottom-48,"X: " + string(scaleXFactor))
        draw_text(drawRight-40,drawBottom-32,"Y: " + string(scaleYFactor))
    }
}

/*debugObj = instance_position(mouse_xfixed,mouse_y,all)
if (debugObj) {
    draw_text(64,64,object_get_name(debugObj.object_index))
}*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw save sprite when saving
if (saved > 0) {
    draw_sprite_ext(sprSaveHard,1,saveX,saveY,1,1,0,$FFFFFF,saved)
    saved-=0.05
}
