///loadDirect(file location)
readPos=0
readStartPos=1
file=argument0
if (file != "") {
    clearMap()
    fileInst=file_text_open_read(file)
    savetxt=file_text_read_string(fileInst)
    file_text_close(fileInst)
    strLen=string_length(savetxt)
    while (readPos < strLen+1) {
        char=string_char_at(savetxt,readPos)
        switch (char) {
            case "x":
                xx=string_copy(savetxt,readStartPos,readPos-readStartPos)
                readStartPos=readPos+1
                break
            case "y":
                yy=string_copy(savetxt,readStartPos,readPos-readStartPos)
                readStartPos=readPos+1
                break
            case ",":
                obj=string_copy(savetxt,readStartPos,readPos-readStartPos)
                readStartPos=readPos+1
                instance_create(real(xx),real(yy),real(obj))
                break
        }
        readPos+=1
    }
}
