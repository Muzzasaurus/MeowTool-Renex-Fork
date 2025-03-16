#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
keystrokes=""
fixedString=""
limit=7

lastKey=""
timer=0
backTimer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((keyboard_check(vk_anykey)) and (keyboard_lastkey == ord(keyboard_lastchar) or (keyboard_lastchar == "-"))) {
    if (lastKey != keyboard_lastchar) {
        timer=0
        lastKey = keyboard_lastchar
    }
    if (timer == 0) or (timer >= 25) {
        if (string_length(keystrokes+fixedString) < limit) or (limit == -1) {
            keystrokes+=keyboard_lastchar
            if (string_char_at(keystrokes,1) == "-") {
                tempStr=string_copy(keystrokes,1,string_length(keystrokes))
                tempStr=string_digits(tempStr)
                keystrokes="-"+tempStr
            } else {
                keystrokes=string_digits(keystrokes)
            }
        }
    }
    timer+=1
} else {
    timer=0
}
if (keyboard_check(vk_backspace)) {
    if (backTimer == 0) or (backTimer >= 25) {
        keystrokes=string_copy(keystrokes,0,string_length(keystrokes)-1)
    }
    backTimer+=1
} else {
    backTimer=0
}
