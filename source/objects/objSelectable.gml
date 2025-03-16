#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
objIndex=SpikeU
drawSprite=0
type="common"
event_inherited()
width=sprite_get_width(mask_index)
height=sprite_get_height(mask_index)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=ystart+objObjSelect.drawYOffset
drawY=y+19-sprite_get_height(sprIndex)/2+sprite_get_yoffset(sprIndex)
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(objPopup)) and ((!objOpenMenu.openMenu) and (primed) and (visible) and (objObjSelect.insidePalette)) {
    objObjSelect.selectedObj=objIndex
    with (objObjSelect) {
        if (mode == "edit") {
            buildMode()
        }
    }
}
event_inherited()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
break //Prevent parent event running
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
if (y < paletteBottomBorder) and (y+height-1 > paletteTopBorder) {
    if (y + height-1 < paletteBottomBorder) and (y > paletteTopBorder) {
        draw_rectangle(x,y,x+width-1,y+height-1,0)
    } else if (y + height-1 >= paletteBottomBorder) {
        draw_rectangle(x,y,x+width-1,paletteBottomBorder,0)
    } else if (y <= paletteTopBorder) {
        draw_rectangle(x,paletteTopBorder,x+width-1,y+height-1,0)
    }
}

sprHeight=sprite_get_height(sprIndex)
sprYOffset=sprite_get_yoffset(sprIndex)
sprWidth=sprite_get_width(sprIndex)
sprXOffset=sprite_get_xoffset(sprIndex)

if (drawY + sprHeight-sprYOffset < paletteBottomBorder) and (drawY-sprYOffset > paletteTopBorder) {
    draw_sprite(sprIndex,drawSprite,drawX+0.5,drawY+0.25)
} else if (drawY + sprHeight-sprYOffset >= paletteBottomBorder) {
    if (drawY-sprYOffset < paletteBottomBorder) {
        draw_sprite_part(sprIndex,drawSprite,0,0,sprWidth,paletteBottomBorder-drawY+sprYOffset,drawX-sprXOffset+0.25,drawY-sprYOffset)
    }
} else if (drawY-sprYOffset <= paletteTopBorder) {
    if (drawY + sprHeight-sprYOffset > paletteTopBorder) {
        draw_sprite_part(sprIndex,drawSprite,0,paletteTopBorder-drawY+sprYOffset,sprWidth,sprHeight-paletteTopBorder+drawY-sprYOffset,drawX-sprXOffset+0.25,paletteTopBorder)
    }
}


draw_set_color($000000)
if (y < paletteBottomBorder) and (y+height-1 > paletteTopBorder) {
    if (y + height-1 < paletteBottomBorder) and (y > paletteTopBorder) {
        draw_rectangle(x,y,x+width-1,y+height-1,1)
    } else if (y + height-1 >= paletteBottomBorder) {
        draw_rectangle(x,y,x+width-1,paletteBottomBorder,1)
    } else if (y <= paletteTopBorder) {
        draw_rectangle(x,paletteTopBorder,x+width-1,y+height-1,1)
    }
}
