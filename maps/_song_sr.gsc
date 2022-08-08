#include maps\_utility; 
#include common_scripts\utility;
#include maps\_zombiemode_utility; 

SongSrInit()
{
    ModSetup();
    // level thread OnConnect();

    AwaitBlackscreen();

    level.start_timestamp = getTime();

    players = get_players();
    players[0].score = 50000;

    level thread Welcome(" TESTING");
    level thread TimerHud();
    level thread SongWatcher();
    level thread AttemptsMain();
    level thread DisplayBlocker();
    level thread GspeedTracker();
    level thread PointDropTracker();
}

ModSetup()
{
    flag_init("song_nacht");
    flag_init("game_started");

    level.PATCH_VERSION = 1;
    level.WAIT_FOR_8BIT = false;
    level.playing_songs = 0;
    level.global_clock = -50;
}

AwaitBlackscreen()
{
    flag_wait("all_players_spawned");
	wait 3.15;
    flag_set("game_started");
}

PlayerThreadBlackscreenWaiter()
{
    while (!flag("game_started"))
        wait 0.05;
    return;
}

Welcome(override)
{
    if (!isDefined(override))
        override = " V" + level.PATCH_VERSION;

	welcome_hud = NewHudElem();
	welcome_hud.horzAlign = "center";
	welcome_hud.vertAlign = "middle";
	welcome_hud.alignX = "center";
	welcome_hud.alignY = "middle";
	welcome_hud.x = 0;
	welcome_hud.y = -120;
	welcome_hud.fontScale = 1.6;
	welcome_hud.alpha = 0;
	welcome_hud.hidewheninmenu = 0;
	welcome_hud.foreground = 1;
	welcome_hud.color = (1, 1, 0.75);

    welcome_hud setText("SongSR Timing" + override);
    welcome_hud fadeOverTime(0.25);
    welcome_hud.alpha = 1;
    wait 4;
    welcome_hud fadeOverTime(0.25);
    welcome_hud.alpha = 0;

    wait 1;
    welcome_hud destroy();
}

TimerHud()
{
	hud_timer = NewHudElem();
	hud_timer.horzAlign = "right";
	hud_timer.vertAlign = "top";
	hud_timer.alignX = "right";
	hud_timer.alignY = "top";
	hud_timer.x = -25;
	hud_timer.y = 30;
	hud_timer.fontScale = 1.7;
	hud_timer.alpha = 1;
	hud_timer.hidewheninmenu = 1;
	hud_timer.foreground = 1;
	hud_timer.color = (1, 0.8, 1);

	hud_timer SetTimerUp(0);
}

SplitHud(song_time, song_name, do_ms, override)
{
    if (!isDefined(level.playing_songs))
        y_offset = 0;
    else
        y_offset = 20 * level.playing_songs;

    if (!isDefined(do_ms))
        do_ms = false;
    else if (!do_ms)
        override = 0;
    // iPrintLn(override);

	hud_split = NewHudElem();
	hud_split.horzAlign = "right";
	hud_split.vertAlign = "top";
	hud_split.alignX = "right";
	hud_split.alignY = "top";
	hud_split.x = -25;
	hud_split.y = 170 + y_offset;
	hud_split.fontScale = 1.4;
	hud_split.alpha = 0;
	hud_split.hidewheninmenu = 1;
	hud_split.foreground = 1;
	hud_split.color = (0.6, 0.8, 1);
    hud_split.label = "" + song_name + ": ";
    
    hud_split setText(GetTimeDetailed(do_ms, override));
	hud_split.alpha = 1;
}

GetTimeDetailed(is_detailed, override)
{
    current_time = int(gettime());

    if (!isDefined(is_detailed))
        is_detailed = false;

    // for rounding
    time_offset = 50;

    if (is_detailed)
        miliseconds = override;
    else
        miliseconds = (current_time - level.start_timestamp) + time_offset;
    // iPrintLn(override + " / " + level.global_clock);

    minutes = 0;
    seconds = 0;

	if( miliseconds > 995 )
	{
		seconds = int( miliseconds / 1000 );

		miliseconds = int( miliseconds * 1000 ) % ( 1000 * 1000 );
		miliseconds = miliseconds * 0.001; 

        // iPrintLn("miliseconds: " + miliseconds);
        // iPrintLn("seconds: " + seconds);

		if( seconds > 59 )
		{
			minutes = int( seconds / 60 );
			seconds = int( seconds * 1000 ) % ( 60 * 1000 );
			seconds = seconds * 0.001; 	

            // iPrintLn("minutes: " + minutes);
		}
	}

    minutes = Int(minutes);
    if (minutes == 0)
        minutes = "00";
	else if(minutes < 10)
		minutes = "0" + minutes; 

	seconds = Int(seconds); 
    if (seconds == 0)
        seconds = "00";
	else if(seconds < 10)
		seconds = "0" + seconds; 

	miliseconds = Int(miliseconds); 
	if( miliseconds == 0 )
		miliseconds = "000";
	else if( miliseconds < 100 )
		miliseconds = "0" + miliseconds;

    miliseconds = getsubstr(miliseconds, 0, 2);
    if (!is_detailed)
        miliseconds = getsubstr(miliseconds, 0, 1);

	return "" + minutes + ":" + seconds + "." + miliseconds; 
}


NachtCounter()
{
    while (!flag("song_nacht"))
        wait 0.05;

    song_timestamp = int(getTime() - level.start_timestamp);
    // iPrintLn(till_radio);
    SplitHud(int(getTime()), SongTranslator("radio"), true, song_timestamp);
}

SongWatcher()
{
    if (isDefined(level.meteor_counter))
    {
        if (level.script == "zombie_moon")
        {
            self thread MoonSongWatcher();
            self thread EightBitWatcher();
        }

        while (level.meteor_counter < 3)
            wait 0.05;
    }
    else if (isDefined(level.teddybear_counter))
    {
        while (level.teddybear_counter < 3)
            wait 0.05;
    }
    else if (isDefined(level.phone_counter))
    {
        while (level.phone_counter < 3)
            wait 0.05;
    }
    else if (isDefined(level.toilet_counter))
    {
        while (level.toilet_counter < 3)
            wait 0.05;
    }
    else if (level.script == "zombie_cod5_prototype")
    {
        self thread NachtCounter();

        while (level.egg_damage_counter < 3)
            wait 0.05;
    }
    else
        return;

    song_timestamp = int(getTime() - level.start_timestamp);
    song_name = SongTranslator();
    level.playing_songs += 1;

    // iPrintLn("song activated!!!");
    SplitHud(int(getTime()), song_name, true, song_timestamp);
}

MoonSongWatcher()
{
	self endon("disconnect");
	level endon("disconnect");
    
    while (true)
    {
        if (is_true(level.played_extra_song_a7x))
        {
            song_timestamp = int(getTime() - level.start_timestamp);
            song_name = SongTranslator("nightmare");
            SplitHud(int(getTime()), song_name, true, song_timestamp);
            level.playing_songs += 1;
            break;
        }

        wait 0.05;
    }
}

EightBitWatcher()
{
	self endon("disconnect");
	level endon("disconnect");

    while (true)
    {
        level waittill("8-bit", song);
        song_timestamp = int(getTime() - level.start_timestamp);
        level.playing_songs += 1;
        SplitHud(int(getTime()), SongTranslator(song), true, song_timestamp);
    }
}

SongTranslator(param)
{
    if (!isDefined(param))
    {
        if (level.script == "zombie_theater")
            return "115";
        else if (level.script == "zombie_pentagon")
            return "Won't Back Down";
        else if (level.script == "zombie_cosmodrome")
            return "Abracadavre";
        else if (level.script == "zombie_coast")
            return "Not Ready to Die";
        else if (level.script == "zombie_temple")
            return "Pareidolia";
        else if (level.script == "zombie_moon")
            return "Coming Home";
        else if (level.script == "zombie_cod5_prototype")
            return "Undone";
        else if (level.script == "zombie_cod5_asylum")
            return "Lullaby for a Dead Man";
        else if (level.script == "zombie_cod5_sumpf")
            return "The One";
        else if (level.script == "zombie_cod5_factory")
            return "Beauty of Annihilation";
        return;
    }
    else if (param == "radio")
        return "Radio";
    else if (param == "nightmare")
        return "Nightmare";
    else if (param == "mus_8bit_2")
        return "Re-Damned 8-bit";
    else if (param == "mus_8bit_0")
        return "Coming Home 8-bit";
    else if (param == "mus_8bit_1")
        return "Pareidolia 8-bit";
}

AttemptsMain()
{
	attempt_hud = NewHudElem();
	attempt_hud.horzAlign = "right";
	attempt_hud.vertAlign = "top";
	attempt_hud.alignX = "right";
	attempt_hud.alignY = "top";
	attempt_hud.x = -25;
	attempt_hud.y = 50;
	attempt_hud.fontScale = 1.4;
	attempt_hud.alpha = 1;
	attempt_hud.hidewheninmenu = 1;
	attempt_hud.foreground = 1;
	attempt_hud.color = (1, 0.8, 1);
    attempt_hud.label = "Attempts: ";

    if (level.script != getDvar("song_attempt_map"))
    {
        setDvar("song_attempts", 0);
        setDvar("song_attempt_map", level.script);
    }

    attempt_hud setValue(getDvarInt("song_attempts"));
    setDvar("song_attempts", getDvarInt("song_attempts") + 1);
}

DisplayBlocker()
{
    self endon("disconnect");
    level endon("end_game");

	hud_blocker = NewHudElem();
	hud_blocker.horzAlign = "right";
	hud_blocker.vertAlign = "top";
	hud_blocker.alignX = "right";
	hud_blocker.alignY = "top";
	hud_blocker.x = -25;
	hud_blocker.y = 70;
	hud_blocker.fontScale = 1.4;
	hud_blocker.alpha = 1;
	hud_blocker.hidewheninmenu = 1;
	hud_blocker.foreground = 1;
	hud_blocker.color = (1, 0.6, 0.2);
    hud_blocker.label = "Music override: ";

    while (true)
    {
        hud_blocker setValue(level.music_override);
        wait 0.05;
    }
}

SpeedTracker()
{
    self endon("disconnect");
    level endon("end_game");

    PlayerThreadBlackscreenWaiter();

	hud_velocity = NewClientHudElem(self);
	hud_velocity.horzAlign = "right";
	hud_velocity.vertAlign = "top";
	hud_velocity.alignX = "right";
	hud_velocity.alignY = "top";
	hud_velocity.x = -25;
	hud_velocity.y = 120;
	hud_velocity.fontScale = 1.4;
	hud_velocity.alpha = 1;
	hud_velocity.hidewheninmenu = 1;
	hud_velocity.foreground = 1;
	hud_velocity.color = (0.4, 1, 0.7);
    hud_velocity.label = "Velocity: ";

    while (true)
    {
        hud_velocity setValue(int(length(self getvelocity() * (1, 1, 0))));
        wait 0.05;
    }
}

GspeedTracker()
{
    self endon("disconnect");
    level endon("end_game");

	hud_gspeed = NewHudElem();
	hud_gspeed.horzAlign = "right";
	hud_gspeed.vertAlign = "top";
	hud_gspeed.alignX = "right";
	hud_gspeed.alignY = "top";
	hud_gspeed.x = -25;
	hud_gspeed.y = 140;
	hud_gspeed.fontScale = 1.4;
	hud_gspeed.alpha = 1;
	hud_gspeed.hidewheninmenu = 1;
	hud_gspeed.foreground = 1;
	hud_gspeed.color = (0.4, 1, 0.7);
    hud_gspeed.label = "Gspeed: ";

    while (true)
    {
        current_gspeed = getDvarInt("g_speed");
        if (current_gspeed != 190)
            hud_gspeed.color = (1, 0, 0);
        hud_gspeed setValue(current_gspeed);
        wait 0.05;
    }
}

PointDropTracker()
{
    self endon("disconnect");
    level endon("end_game");

	hud_drop = NewHudElem();
	hud_drop.horzAlign = "right";
	hud_drop.vertAlign = "top";
	hud_drop.alignX = "right";
	hud_drop.alignY = "top";
	hud_drop.x = -25;
	hud_drop.y = 90;
	hud_drop.fontScale = 1.4;
	hud_drop.alpha = 1;
	hud_drop.hidewheninmenu = 1;
	hud_drop.foreground = 1;
	hud_drop.color = (1, 0.6, 0.2);;
    hud_drop.label = "Pointdrop coming: ";

    while (true)
    {
        hud_drop setValue(level.zombie_vars["zombie_drop_item"]);
        wait 0.05;
    }
}