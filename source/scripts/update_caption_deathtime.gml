if (global.show_deathtime && room!=global.difficulty_room) {
    /*room_caption=str_cat(
        global.game_title,
        " - "+global.name_difficulties[difficulty],
        " - "+lang("deaths")+": ",savedatap("deaths"),
        " - "+lang("time")+": ",format_time(savedatap("time")),
        pick(global.lastjoyname!="",""," - "+global.lastjoyname),
        pick(savedatap("clear"),""," - "+lang("fileclear"))
    )*/
    room_caption=str_cat(
        global.game_title,
        " - "+lang("time")+": ",format_time(savedatap("time")),
        " - "+lang("session")+": ",format_time(global.increment),
        global.game_title_addition
        )
} else room_caption=global.game_title
