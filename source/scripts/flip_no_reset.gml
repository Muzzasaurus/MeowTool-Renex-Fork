///flip_no_reset([vflip])
//corrects the player for gravity flipping

with (Player) {
    if (argument_count) {
        if (vflip!=argument[0]) {
            vflip=argument[0]
            vspeed=0
            djump=1
            move_player(x,y+4*vflip,0)
        }
    } else {
        vflip=-vflip
        vspeed=0
        djump=1
        move_player(x,y+4*vflip,0)
    }
}
