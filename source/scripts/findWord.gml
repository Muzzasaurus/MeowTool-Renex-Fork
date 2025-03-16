///findWord(str,word,startPos,returnStart,appearanceNum)
__str = argument0
__word = argument1
readPos = argument2
__return = argument3
__num = argument4

isWord=false
checkStr=false
appearance=0
strLen=string_length(__str)

while (readPos <= strLen+1) {
    if (readPos == strLen+1) {
        char=""
    } else {
        char=string_char_at(__str,readPos)
    }

    if (is_letter(char)) {
        checkStr=false
        if (!isWord) {
            isWord=true
            wordStart=readPos
        }
    } else if (isWord) {
        checkWord=string_copy(__str,wordStart,readPos-wordStart)
        checkStr=true
        isWord=false
    }

    if (checkStr) {
        checkStr=false
        if (checkWord == __word) {
            appearance+=1
            if (appearance >= __num) {
                if (__return) {
                    return wordStart
                } else {
                    return readPos
                }
            }
        }
    }
    readPos+=1
}
return -1
