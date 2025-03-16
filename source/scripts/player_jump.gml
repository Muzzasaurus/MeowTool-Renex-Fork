if (vvvvvv) {
    if (player_can_jump()) {
        //vvvvvv flipping
        vflip*=-1
        vspeed=0
        y+=4*vflip
        if (vflip==-1) {sound_play_slomo("sndVFlip1")}
        else { sound_play_slomo("sndVFlip2")}
        trigger_broadcast(tr_playerjump)
        coyoteTime=0
        jump_timer=0
        onGround=false
    }
} else if (!hang && !onVineL && !onVineR) {

    //get shape water type
    var sw,swt;
    sw=instance_place(x,y,ShapeWater)
    if (sw) {
        swt=sw.water_type
    } else swt=""

    if (player_can_jump()
        || instance_place(x,y+vflip,Water1)
        || instance_place(x,y+vflip,PlatformWater)
        || instance_place(x,y+vflip,GuyWater)
        || swt=="Water1"
        || ladderjump
        || instance_place(x,y+vflip,Platform)
        || instance_place(x,y+vflip,GravPlatformBoth)
        )
            {
            plat=instance_place(x,y+vflip,OneTimePlatform)
            if (plat != noone) {
                plat.active=false
            }
            plat=instance_place(x,y+vflip,GravPlatformBoth)
            if (plat != noone) {
                if (plat.flip != 0) {
                    flip_no_reset(plat.flip)
                } else {
                    flip_no_reset()
                }
            }
            //floor jump
            if (!instance_place(x,y,WaterNoJump)) {
                vspeed=-jump*vflip
            }
            if (global.use_momentum_values) {
                with (instance_place(x,y+vflip,Platform)) other.hspeed+=hspeed
            }
            sound_play_slomo("sndJump")
            djump=1
            image_index=0
            trigger_broadcast(tr_playerjump)
            coyoteTime=0
            jump_timer=0
            onGround=false
            if(maxSpeed > maxSpeedDefault + 2 and fricSpeed and input_h!=0) {
                maxSpeed += 3
                decRate *= 1.2
            }
            if (instance_place(x,y+1,GuyWater)) onfire=false
    } else if (global.debug_jump || infJump
        || (djump<maxjumps || instance_place(x,y+1*vflip,Water2) || instance_place(x,y+1*vflip,NekoronAir) || swt=="Water2")
        && !(beamstate&beam_onejump)) {
            //double jump
            if (!instance_place(x,y,WaterNoJump)) {
                vspeed=-jump2*vflip
            }
            sound_play_slomo("sndDJump")
            if (djump<maxjumps) djump+=1
            if (djump>2) {
                repeat (5) instance_create(random_range(x-5,x+5),random_range(y+4,y+4),TripleJumpStar)
            }
            image_index=0
            trigger_broadcast(tr_playerdjump)
            coyoteTime=0
            jump_timer=0
    } else jump_timer=global.jump_buffering
    ladderjump=false
}
