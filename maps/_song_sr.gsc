#include maps\_utility; 
#include common_scripts\utility;
#include maps\_zombiemode_utility; 

SongSrInit()
{
    ModSetup();
    level thread OnConnect();

    flag_wait("all_players_spawned");
	wait 3.15;

    level.start_timestamp = getTime();

    player = get_players();
    player[0].score = 50000;

    level thread TimerHud();
    level thread SongWatcher();
    level thread AttemptsMain();
    // level thread DevTest();
}

OnConnect()
{
    for(;;)
    {
        level waittill("connecting", player);
    }
}

ModSetup()
{
    flag_init("song_nacht");

    level.playing_songs = 0;
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
	hud_timer.hidewheninmenu = 0;
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

	hud_split = NewHudElem();
	hud_split.horzAlign = "right";
	hud_split.vertAlign = "top";
	hud_split.alignX = "right";
	hud_split.alignY = "top";
	hud_split.x = -25;
	hud_split.y = 170 + y_offset;
	hud_split.fontScale = 1.4;
	hud_split.alpha = 0;
	hud_split.hidewheninmenu = 0;
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

    if (!is_detailed)
        miliseconds = getsubstr(miliseconds, 0, 1);

	return "" + minutes + ":" + seconds + "." + miliseconds; 
}


NachtCounter()
{
    till_radio = 0;

    while (!flag("song_nacht"))
    {
        till_radio += 50;
        wait 0.05;
    }

    // iPrintLn(till_radio);
    SplitHud(int(getTime()), SongTranslator("radio"), true, till_radio);
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

    song_name = SongTranslator();
    level.playing_songs += 1;

    // iPrintLn("song activated!!!");
    SplitHud(int(getTime()), song_name);
}

MoonSongWatcher()
{
	self endon("disconnect");
	level endon("disconnect");
    
    while (true)
    {
        if (is_true(level.played_extra_song_a7x))
        {
            SplitHud(int(getTime()), SongTranslator("nightmare"));
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
        level.playing_songs += 1;
        SplitHud(int(getTime()), SongTranslator(song));
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
	attempt_hud.hidewheninmenu = 0;
	attempt_hud.foreground = 1;
	attempt_hud.color = (0.6, 0.8, 1);
    attempt_hud.label = "Attempts: ";

    if (level.script != getDvar("song_attempt_map"))
    {
        setDvar("song_attempts", 0);
        setDvar("song_attempt_map", level.script);
    }

    attempt_hud setValue(getDvarInt("song_attempts"));
    setDvar("song_attempts", getDvarInt("song_attempts") + 1);
}

DevTest()
{
    while (true)
    {
        if (isDefined(level.playing_songs))
            iPrintLn(level.playing_songs);
        wait 0.5;
    }
}
