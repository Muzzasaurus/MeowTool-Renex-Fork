savetxt=""
file=get_save_filename("meowmap|*.meow", "unnamed map")
if (file != "") {
    if (string_pos(".meow",file) == 0) {
        file += ".meow"
    }
    if (file_exists(file)) {
        if (!show_question("This map already exists, do you want to replace it?")) {
            return false
        }
    }
    fileInst=file_text_open_write(file)
    with (all) {
        if (objInPalette(object_index)) {
            other.savetxt+=string(x) + "x" + string(y) + "y" + string(object_index) + ","
        }
    }
    file_text_write_string(fileInst,savetxt)
    file_text_close(fileInst)

    //Update caption with map name
    captionStr=file
    slashCount=string_count("\",captionStr)
    repeat(slashCount-1) {
        captionStr=string_replace(captionStr,"\","")
    }
    slashPos=string_pos("\",captionStr)
    captionStr=string_copy(captionStr,slashPos+1,string_length(captionStr)-slashPos)
    global.game_title_addition=" - " + captionStr

    return true
} else {
    return false
}
