//most engine hotkeys are handled here

//restart
if (key_restart(vi_pressed) && !global.no_restart && !frozen) {
    if (is_ingame() && !global.pause) {
        if (room==global.difficulty_room) {
            Player.dead=1
            room_restart()
            exit
        }
        savedata_load()
        dead=0
        //reset objects manually as room no longer restarts
        instance_destroy_id(BloodEmitter)
        instance_destroy_id(Blood)
        instance_destroy_id(GibParticle)
        sound_stop("sndDeath")
        instance_destroy_id(ShootKid)
        with (JumpRefresher) {
            active=true
        }
        with (VCoinGive) {
            visible=true
        }
        with (VCoinTake) {
            visible=true
        }
        with (LucsterBubble) {
            visible=true
            ready=true
            image_alpha=1
            alarm[1]=0
            startLaunch=false
        }
        with (ShootRefresherL) {
            image_index=0
        }
        with (OneTimePlatform) {
            active=true
        }
    }
}

//maker pause
if (is_ingame() and keyboard_check_pressed(vk_space)) {
    frozen=!frozen
}

//pause
if (is_ingame() && !global.no_pause) {
    if (pause_delay<=0) {
        if (key_pause(vi_pressed)) {
            if (!global.pause) {
                instance_create(0,0,PauseMenu)
            } else {
                instance_destroy_id(PauseMenu)
            }
        }
    } else {
        pause_delay-=1
    }
    //unfocus pause doesn't care about pause delay
    if (global.unfocus_pause) {
        if (!global.pause && !window_has_focus() && !unfocus_paused) {
            instance_create(0,0,PauseMenu)
            unfocus_paused=1
        } else if (global.pause && window_has_focus() && unfocus_paused) {
            instance_destroy_id(PauseMenu)
            unfocus_paused=0
        }
    }
}

if (!global.no_quit) {
    //escape key
    /*if (keyboard_check_pressed(vk_escape) || scheduled_close_button) {
        event_game_end()
    }*/
    
    //close game
    if (keyboard_check_pressed(vk_f4) && keyboard_check(vk_alt)) {
        event_game_end()
    }
    
    //go to title
    /*
    if (keyboard_check_pressed(vk_f2)) {
        instance_activate_all_safe()
        if (is_ingame() and instance_exists(objObjSelect)) {
            if (!objObjSelect.changesMade) {
                instance_destroy_id(PauseMenu)
                savedata_write()
                room_goto(rmWait2FramesLol)
            } else if (!instance_exists(objPopup)) {
                instance_create(0,0,objPopup)
            }
        }// else room_goto(rmWait2FramesLol)
    }
    */
}

//toggle mute
if (keyboard_check_pressed(ord("M"))) {
    var storevol;storevol=settings("stored mus vol")
    settings("stored mus vol",settings("musvol"))
    settings("musvol",storevol)
    sound_kind_volume(1,settings("musvol"))
    if (storevol>0) show_message_right("Unmuted music")
    else show_message_right("Muted music")
}

//toggle fullscreen
if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_return)) || keyboard_check_pressed(vk_f11) || (keyboard_check_pressed(vk_f4) && !keyboard_check(vk_alt))) {
    if (settings("fullscreen")) {
        if (settings("screenscale")!=1) window_delayed_center()
        settings("screenscale",1)
        settings("fullscreen",0)
    } else if (settings("screenscale")<global.dmaxscale) {
        settings("screenscale",settings("screenscale")+0.5)
        window_delayed_center()
    } else {
        settings("fullscreen",1)
    }
    update_fullscreen()
    input_clear()
}

//take a screenshot
if (keyboard_check_pressed(vk_f9)) {
    take_screenshot()
}
