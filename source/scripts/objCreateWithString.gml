///objCreateWithString(str)
objTxt=argument0
readPos=0
readStartPos=1
strLen=string_length(objTxt)
isWord=false
checkStr=false
xscale=1
yscale=1
while (readPos <= strLen+1) {
    if (readPos == strLen+1) {
        char=""
    } else {
        char=string_char_at(objTxt,readPos)
    }
    if (is_letter(char) or (char == ",")) {
        checkStr=false
        if (!isWord) {
            isWord=true
            wordStart=readPos
        }
    } else if (isWord) {
        str=string_copy(objTxt,wordStart,readPos-wordStart)
        checkStr=true
        isWord=false
    }
    if (checkStr) {
        switch (str) {
            case "x":
                xx=string_copy(objTxt,readStartPos,readPos-readStartPos-string_length(str))
                readStartPos=readPos
                break
            case "y":
                yy=string_copy(objTxt,readStartPos,readPos-readStartPos-string_length(str))
                readStartPos=readPos
                break
            case "xs":
                xscale=string_copy(objTxt,readStartPos,readPos-readStartPos-string_length(str))
                readStartPos=readPos
                break
            case "ys":
                yscale=string_copy(objTxt,readStartPos,readPos-readStartPos-string_length(str))
                readStartPos=readPos
                break
            case ",":
                obj=string_copy(objTxt,readStartPos,readPos-readStartPos-string_length(str))
                readStartPos=readPos
                if (real(obj) != CustomSnap) {
                    inst=instance_create(real(xx),real(yy),real(obj))
                    inst.image_xscale=real(xscale)
                    inst.image_yscale=real(yscale)
                }
                xscale=1
                yscale=1
                break
        }
        checkStr=false
    }
    readPos+=1
}
