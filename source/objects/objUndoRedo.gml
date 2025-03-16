#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
arrayPos=0
undoArray[0]=0
undoArrayLength=0
tempObj[0]=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Ctrl Z
if (keyboard_check_pressed(ord("Z")) and keyboard_check(vk_control) and arrayPos > 0) {
    arrayPos-=1
    switch (undoArray[arrayPos,1]) {
        case "create":
            for (j=2; j<undoArray[arrayPos,0]; j+=1) {
                objTxt=undoArray[arrayPos,j]
                readPos=0
                readStartPos=1
                strLen=string_length(objTxt)
                while (readPos < strLen+1) {
                    char=string_char_at(objTxt,readPos)
                    switch (char) {
                        case "x":
                            xx=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            readStartPos=readPos+1
                            break
                        case "y":
                            yy=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            readStartPos=readPos+1
                            break
                        case ",":
                            k=0
                            objDeleted=false
                            obj=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            readStartPos=readPos+1
                            sprite_index=object_get_sprite(real(obj))
                            inst=instance_place(real(xx),real(yy),real(obj))
                            while (!objDeleted) {
                                if (inst) {
                                    if (inst.x == real(xx) and inst.y == real(yy)) {
                                        instance_destroy_id(inst)
                                        objDeleted=true
                                    } else {
                                        tempObj[k]=string(inst.x) + "x" + string(inst.y) + "y" + string(inst.object_index) + ","
                                        instance_destroy_id(inst)
                                        k+=1
                                        inst=instance_place(real(xx),real(yy),real(obj))
                                    }
                                } else {
                                    objDeleted=true
                                }
                            }
                            if (k != 0) {
                                for (l=0; l<k; l+=1) {
                                    objCreateWithString(tempObj[l])
                                }
                            }
                            break
                    }
                    readPos+=1
                }
            }
        break

        case "delete":
            for (j=2; j<undoArray[arrayPos,0]; j+=1) {
                objCreateWithString(undoArray[arrayPos,j])
            }
        break

        case "move":
            objTxt=undoArray[arrayPos,2]
            firstX=true
            firstY=true
            readPos=0
            readStartPos=1
            strLen=string_length(objTxt)
            while (readPos < strLen+1) {
                char=string_char_at(objTxt,readPos)
                switch (char) {
                    case "x":
                        if (firstX) {
                            xx=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            firstX=false
                        } else {
                            xx2=string_copy(objTxt,readStartPos,readPos-readStartPos)
                        }
                        readStartPos=readPos+1
                        break
                    case "y":
                        if (firstY) {
                            yy=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            firstY=false
                        } else {
                            yy2=string_copy(objTxt,readStartPos,readPos-readStartPos)
                        }
                        readStartPos=readPos+1
                        break
                    case ",":
                        k=0
                        objDeleted=false
                        obj=string_copy(objTxt,readStartPos,readPos-readStartPos)
                        readStartPos=readPos+1
                        sprite_index=object_get_sprite(real(obj))
                        inst=instance_place(real(xx2),real(yy2),real(obj))
                        while (!objDeleted) {
                            if (inst) {
                                if (inst.x == real(xx2) and inst.y == real(yy2)) {
                                    instance_destroy_id(inst)
                                    objDeleted=true
                                } else {
                                    tempObj[k]=string(inst.x) + "x" + string(inst.y) + "y" + string(inst.object_index) + ","
                                    instance_destroy_id(inst)
                                    k+=1
                                    inst=instance_place(real(xx2),real(yy2),real(obj))
                                }
                            } else {
                                objDeleted=true
                            }
                        }
                        if (k != 0) {
                            for (l=0; l<k; l+=1) {
                                objCreateWithString(tempObj[l])
                            }
                        }
                        objCreateWithString(xx + "x" + yy + "y" + obj + ",")
                        break
                }
                readPos+=1
            }
        break
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Ctrl Y
if (keyboard_check_pressed(ord("Y")) and keyboard_check(vk_control) and arrayPos < undoArrayLength) {
    switch (undoArray[arrayPos,1]) {
        case "create":
            for (j=2; j<undoArray[arrayPos,0]; j+=1) {
                objCreateWithString(undoArray[arrayPos,j])
            }
        break

        case "delete":
            for (j=2; j<undoArray[arrayPos,0]; j+=1) {
                objTxt=undoArray[arrayPos,j]
                readPos=0
                readStartPos=1
                strLen=string_length(objTxt)
                while (readPos < strLen+1) {
                    char=string_char_at(objTxt,readPos)
                    switch (char) {
                        case "x":
                            xx=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            readStartPos=readPos+1
                            break
                        case "y":
                            yy=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            readStartPos=readPos+1
                            break
                        case ",":
                            k=0
                            objDeleted=false
                            obj=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            readStartPos=readPos+1
                            sprite_index=object_get_sprite(real(obj))
                            inst=instance_place(real(xx),real(yy),real(obj))
                            while (!objDeleted) {
                                if (inst) {
                                    if (inst.x == real(xx) and inst.y == real(yy)) {
                                        instance_destroy_id(inst)
                                        objDeleted=true
                                    } else {
                                        tempObj[k]=string(inst.x) + "x" + string(inst.y) + "y" + string(inst.object_index) + ","
                                        instance_destroy_id(inst)
                                        k+=1
                                        inst=instance_place(real(xx),real(yy),real(obj))
                                    }
                                } else {
                                    objDeleted=true
                                }
                            }
                            if (k != 0) {
                                for (l=0; l<k; l+=1) {
                                    objCreateWithString(tempObj[l])
                                }
                            }
                            break
                    }
                    readPos+=1
                }
            }
        break

        case "move":
            objTxt=undoArray[arrayPos,2]
            firstX=true
            firstY=true
            readPos=0
            readStartPos=1
            strLen=string_length(objTxt)
            while (readPos < strLen+1) {
                char=string_char_at(objTxt,readPos)
                switch (char) {
                    case "x":
                        if (firstX) {
                            xx=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            firstX=false
                        } else {
                            xx2=string_copy(objTxt,readStartPos,readPos-readStartPos)
                        }
                        readStartPos=readPos+1
                        break
                    case "y":
                        if (firstY) {
                            yy=string_copy(objTxt,readStartPos,readPos-readStartPos)
                            firstY=false
                        } else {
                            yy2=string_copy(objTxt,readStartPos,readPos-readStartPos)
                        }
                        readStartPos=readPos+1
                        break
                    case ",":
                        k=0
                        objDeleted=false
                        obj=string_copy(objTxt,readStartPos,readPos-readStartPos)
                        readStartPos=readPos+1
                        sprite_index=object_get_sprite(real(obj))
                        inst=instance_place(real(xx),real(yy),real(obj))
                        while (!objDeleted) {
                            if (inst) {
                                if (inst.x == real(xx) and inst.y == real(yy)) {
                                    instance_destroy_id(inst)
                                    objDeleted=true
                                } else {
                                    tempObj[k]=string(inst.x) + "x" + string(inst.y) + "y" + string(inst.object_index) + ","
                                    instance_destroy_id(inst)
                                    k+=1
                                    inst=instance_place(real(xx),real(yy),real(obj))
                                }
                            } else {
                                objDeleted=true
                            }
                        }
                        if (k != 0) {
                            for (l=0; l<k; l+=1) {
                                objCreateWithString(tempObj[l])
                            }
                        }
                        objCreateWithString(xx2 + "x" + yy2 + "y" + obj + ",")
                        break
                }
                readPos+=1
            }
        break
    }
    arrayPos+=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*for (i=0; i<undoArrayLength; i+=1) {
    for (j=1; j<undoArray[i,0]; j+=1) {
        draw_text(32+96*(j-1),32+32*i,undoArray[i,j])
    }
}

draw_text(400,304,undoArrayLength)
draw_text(400,336,arrayPos)*/
