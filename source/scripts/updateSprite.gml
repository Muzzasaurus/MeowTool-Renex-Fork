///updateSprite(spriteIndex,imageName,xorig,yorig,[altName])
spr = argument0
img = argument1
xorig = argument2
yorig = argument3
directory = checkSkinsFolder(img)
directory2 = ""
if (argument_count > 4) {
    altName = argument[4]
    directory2 = checkSkinsFolder(altName)
}

//find original sprite num
tempSpr = sprite_add(defaultDir+img+".png",1,0,0,0,0)
if (tempSpr != -1) {
    imgNum = round(sprite_get_width(tempSpr)/sprite_get_width(spr))
    sprite_delete(tempSpr)
} else {
    imgNum = 1
}

if (directory2 != "") directory = directory2
if (directory != "") {
    //find number of images in new sprite
    tempSpr = sprite_add(directory,1,0,0,0,0)
    //jtool jump refresher sprite fix
    if (spr == sprJumpRefresher) and (sprite_get_width(tempSpr) == 32) and (sprite_get_height(tempSpr) == 32) {
        xorig=15
        yorig=15
    } else {
        imgNum = round(sprite_get_width(tempSpr)/sprite_get_width(spr))
    }
    sprite_delete(tempSpr)
    //replace sprite
    sprite_replace(spr,directory,imgNum,0,0,xorig,yorig)
    sprite_collision_mask(spr,1,0,0,0,0,0,0,0)
} else {
    sprite_replace(spr,defaultDir+img+".png",imgNum,0,0,xorig,yorig)
    sprite_collision_mask(spr,1,0,0,0,0,0,0,0)
}
