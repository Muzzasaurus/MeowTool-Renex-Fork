///objCreateWithString(str)
objTxt=argument0
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
            obj=string_copy(objTxt,readStartPos,readPos-readStartPos)
            readStartPos=readPos+1
            if (real(obj) != CustomSnap) {
                instance_create(real(xx),real(yy),real(obj))
            }
            break
    }
    readPos+=1
}
