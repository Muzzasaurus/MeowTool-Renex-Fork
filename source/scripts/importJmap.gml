file=get_open_filename("jmap|*.jmap", "")
if (file != "") {
    //Clear screen and load map
    clearMap()
    savetxt=file_text_read_all(file,"\")

    //Find second instance of "objects" and crop first part of txt
    objPos=findWord(savetxt,"objects",0,false,2)
    if (objPos != -1) {
        croppedtxt=string_copy(savetxt,objPos+15,string_length(savetxt)-objPos-15)
        //Find next linebreak and crop second part of txt
        endPos=string_pos("\",croppedtxt)
        objtxt=string_copy(croppedtxt,0,endPos-1)

        //Replace spaces in text with meowtool equivalents
        spaces=string_count(" ",objtxt)
        for (i=0; i<spaces; i+=1) {
            switch (i mod 3) {
                case 0:
                    char="x"
                    break
                case 1:
                    char="y"
                    break
                case 2:
                    char=","
                    break
            }
            objtxt=string_replace(objtxt," ",char)
        }
        objImportWithString(objtxt)
    }

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
