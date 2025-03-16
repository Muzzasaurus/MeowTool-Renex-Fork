#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hover=false
primed=false
bg=$DDDDDD

width=256
height=400

buttonX=0
buttonY=174
buttonWidth=72
buttonHeight=36

selectedField=-1

blockDepth=savedatap("blockDepth")
spikeDepth=savedatap("spikeDepth")
waterDepth=savedatap("waterDepth")

keyTracker=instance_create(0,0,objKeyLogger)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_id(keyTracker)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (curInside(400+buttonX-buttonWidth/2,304+buttonY-buttonHeight/2,400+buttonX+buttonWidth/2,304+buttonY+buttonHeight/2)) {
    hover=true
    bg=$BBBBBB
    if (mouse_check_button(mb_left)) {
        primed=true
        bg=$FFFFFF
    }
    if (mouse_check_button_released(mb_left)) and (primed) {
        primed=false
        instance_destroy()
    }
} else {
    hover=false
    bg=$DDDDDD
}

if (curInside(400-width/2+76,304-height/2+64,400+width/2-24,304-height/2+96)) {
    if (mouse_check_button_released(mb_left)) {
        selectedField=0
        keyTracker.keystrokes=string(blockDepth)
    }
} else if (curInside(400-width/2+76,304-height/2+112,400+width/2-24,304-height/2+144)) {
    if (mouse_check_button_released(mb_left)) {
        selectedField=1
        keyTracker.keystrokes=string(spikeDepth)
    }
} else if (curInside(400-width/2+76,304-height/2+160,400+width/2-24,304-height/2+192)) {
    if (mouse_check_button_released(mb_left)) {
        selectedField=2
        keyTracker.keystrokes=string(waterDepth)
    }
}

//update depths
if (instance_exists(objKeyLogger)) {
    switch (selectedField) {
        case 0:
            blockDepth=keyTracker.keystrokes
            if (keyTracker.keystrokes != "-") {
                object_set_depth(Block,real(keyTracker.keystrokes))
                object_set_depth(MiniBlock,real(keyTracker.keystrokes))
                object_set_depth(SlipBlock,real(keyTracker.keystrokes))
                with (Block) {
                    depth=real(other.keyTracker.keystrokes)
                }
                savedatap("blockDepth",real(keyTracker.keystrokes))
            }
            break
        case 1:
            spikeDepth=keyTracker.keystrokes
            if (keyTracker.keystrokes != "-") {
                object_set_depth(PlayerKiller,real(keyTracker.keystrokes))
                object_set_depth(SpikeU,real(keyTracker.keystrokes))
                object_set_depth(SpikeR,real(keyTracker.keystrokes))
                object_set_depth(SpikeL,real(keyTracker.keystrokes))
                object_set_depth(SpikeD,real(keyTracker.keystrokes))
                object_set_depth(MiniSpikeUp,real(keyTracker.keystrokes))
                object_set_depth(MiniSpikeDown,real(keyTracker.keystrokes))
                object_set_depth(MiniSpikeLeft,real(keyTracker.keystrokes))
                object_set_depth(MiniSpikeRight,real(keyTracker.keystrokes))
                object_set_depth(Cherry,real(keyTracker.keystrokes))
                object_set_depth(KillBlock,real(keyTracker.keystrokes))
                with (PlayerKiller) {
                    depth=real(other.keyTracker.keystrokes)
                }
                savedatap("spikeDepth",real(keyTracker.keystrokes))
            }
            break
        case 2:
            waterDepth=keyTracker.keystrokes
            if (keyTracker.keystrokes != "-") {
                object_set_depth(AnyWater,real(keyTracker.keystrokes))
                object_set_depth(Water1,real(keyTracker.keystrokes))
                object_set_depth(Water2,real(keyTracker.keystrokes))
                object_set_depth(Water3,real(keyTracker.keystrokes))
                object_set_depth(CatharsisWater,real(keyTracker.keystrokes))
                //object_set_depth(NekoronAir,real(keyTracker.keystrokes))
                object_set_depth(UpdraftWater,real(keyTracker.keystrokes))
                object_set_depth(WaterNoJump,real(keyTracker.keystrokes))
                with (AnyWater) {
                    if (object_index != NekoronAir) {
                        depth=real(other.keyTracker.keystrokes)
                    }
                }
                savedatap("waterDepth",real(keyTracker.keystrokes))
            }
            break
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_valign(fa_middle)
//darken the background
draw_set_color($000000)
draw_set_alpha(0.3)
draw_rectangle(0,0,room_width,room_height,0)
draw_set_alpha(1)

//main popup bg
draw_set_color($BBBBBB)
draw_rectangle(400-width/2,304-height/2,400+width/2,304+height/2,0)
draw_set_color($000000)
draw_rectangle(400-width/2,304-height/2,400+width/2,304+height/2,1)

//done button
draw_set_color(bg)
draw_rectangle(400+buttonX-buttonWidth/2,304+buttonY-buttonHeight/2,400+buttonX+buttonWidth/2,304+buttonY+buttonHeight/2,0)
draw_set_color($000000)
draw_rectangle(400+buttonX-buttonWidth/2,304+buttonY-buttonHeight/2,400+buttonX+buttonWidth/2,304+buttonY+buttonHeight/2,1)

//block depth visuals
draw_set_color($DDDDDD)
draw_sprite(sprBlock,0,400-width/2+24,304-height/2+64)
draw_rectangle(400-width/2+76,304-height/2+64,400+width/2-24,304-height/2+96,0)
draw_set_color($000000)
draw_rectangle(400-width/2+76,304-height/2+64,400+width/2-24,304-height/2+96,1)
draw_text(400-width/2+80,304-height/2+80,blockDepth)

//spike depth visuals
draw_set_color($DDDDDD)
draw_sprite(sprSpikeUp,0,400-width/2+24,304-height/2+112)
draw_rectangle(400-width/2+76,304-height/2+112,400+width/2-24,304-height/2+144,0)
draw_set_color($000000)
draw_rectangle(400-width/2+76,304-height/2+112,400+width/2-24,304-height/2+144,1)
draw_text(400-width/2+80,304-height/2+128,spikeDepth)

//water depth visuals
draw_set_color($DDDDDD)
draw_sprite(sprWater1,0,400-width/2+24,304-height/2+160)
draw_rectangle(400-width/2+76,304-height/2+160,400+width/2-24,304-height/2+192,0)
draw_set_color($000000)
draw_rectangle(400-width/2+76,304-height/2+160,400+width/2-24,304-height/2+192,1)
draw_text(400-width/2+80,304-height/2+176,waterDepth)

//cursor visual
if (selectedField != -1) {
    cursorOffsetX=string_width(keyTracker.keystrokes)
}
if (floor(global.increment/25) mod 2 == 0) and (selectedField != -1) {
    draw_rectangle(400+cursorOffsetX-width/2+80,304-height/2+68+48*selectedField,400+cursorOffsetX-width/2+82,304-height/2+92+48*selectedField,0)
}

draw_set_halign(fa_center)
draw_text(400,304-height/2+20,"Depth Order")
draw_text(400+buttonX,304+buttonY,"Done")
draw_set_valign(fa_top)
draw_set_halign(fa_left)
