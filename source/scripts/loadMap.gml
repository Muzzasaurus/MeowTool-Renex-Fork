file=get_open_filename("meowmap|*.meow", "")
if (file != "") {
    //Clear screen and load map
    clearMap()
    fileInst=file_text_open_read(file)
    savetxt=file_text_read_string(fileInst)
    file_text_close(fileInst)
    objCreateWithString(savetxt)
    if (instance_exists(objObjSelect)) {
        objObjSelect.changesMade=false
    }

    //Update caption with map name
    captionStr=file
    slashCount=string_count("\",captionStr)
    repeat(slashCount-1) {
        captionStr=string_replace(captionStr,"\","")
    }
    slashPos=string_pos("\",captionStr)
    captionStr=string_copy(captionStr,slashPos+1,string_length(captionStr)-slashPos)
    global.game_title_addition=" - " + captionStr
}
