#include maps\_utility; 
#include common_scripts\utility;
#include maps\_zombiemode_utility; 

SongSrInit()
{
    ModSetup();

    AwaitBlackscreen();

    level.start_timestamp = getTime();

    level thread Welcome();
    level thread SongInit();
    level thread TimerHud();
    level thread AttemptsMain();
    // level thread DisplayBlocker();
    level thread GspeedTracker();
    level thread PointDropTracker();
}

// Setup

ModSetup()
{
    PrecacheString(&"SONGS_ATTEMPTS");
    PrecacheString(&"SONGS_YES");
    PrecacheString(&"SONGS_NO");

    flag_init("song_nacht");
    flag_init("game_started");

    setDvar("zm_song_start", 0);

    level.PATCH_VERSION = 2;
    level.WAIT_FOR_8BIT = true;
    level.SONG_DEBUG = true;

    level.playing_songs = 0;
    level.longest_splits = 0;
}

SetDefaultSplit()
{
    switch (getDvar("split"))
    {
        case "coming home":
        case "nightmare":
        case "redamned":
        case "coming home 8":
        case "pareidolia 8":
            AskForSplit(true);
            return;
        default:
            AskForSplit(false);
            setDvar("split", "Select a split");
            return;
    }
}

TranslateSongName()
{
    selection = getDvar("split");

    if (selection == "coming home")
        return "Coming Home";
    else if (selection == "nightmare")
        return "Nightmare";
    else if (selection == "redamned")
        return "Re-Damned";
    else if (selection == "coming home 8")
        return "Coming Home 8-bit";
    else if (selection == "pareidolia 8")
        return "Pareidolia 8-bit";
}

AwaitBlackscreen()
{
    flag_wait("all_players_spawned");
	wait 3.15;
    flag_set("game_started");
    setDvar("zm_song_start", 1);

    if (isDefined(level.SONG_DEBUG) && level.SONG_DEBUG)
    {
        players = get_players();
        for (i = 0; i < players.size; i++)
        {
            players[i].score = 50005;
        }
    }
}

PlayerThreadBlackscreenWaiter()
{
    while (!flag("game_started"))
        wait 0.05;
    return;
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
    // iPrintLn(override);

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

// HUD Elements

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

AskForSplit(is_selected)
{
    if (is_selected)
        override = "SELECTED SONG: " + TranslateSongName();
    else
        override = "No split selected. Select a split using '/split' command. Then 'fast_restart' the game.";

	split_selection_hud = NewHudElem();
	split_selection_hud.horzAlign = "center";
	split_selection_hud.vertAlign = "middle";
	split_selection_hud.alignX = "center";
	split_selection_hud.alignY = "middle";
	split_selection_hud.x = 0;
	split_selection_hud.y = -40;
	split_selection_hud.fontScale = 1.5;
	split_selection_hud.alpha = 0;
	split_selection_hud.hidewheninmenu = 0;
	split_selection_hud.foreground = 1;
	split_selection_hud.color = (1, 0.6, 0.6);

    split_selection_hud setText(override);
    split_selection_hud fadeOverTime(0.25);
    split_selection_hud.alpha = 1;
    wait 5;
    split_selection_hud fadeOverTime(0.25);
    split_selection_hud.alpha = 0;

    wait 1;
    split_selection_hud destroy();
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
	hud_timer.fontScale = 1.8;
	hud_timer.alpha = 1;
	hud_timer.hidewheninmenu = 1;
	hud_timer.foreground = 1;
	hud_timer.color = (1, 0.8, 1);

	hud_timer SetTimerUp(0);
}

AttemptsMain()
{
	attempt_hud = NewHudElem();
	attempt_hud.horzAlign = "right";
	attempt_hud.vertAlign = "top";
	attempt_hud.alignX = "right";
	attempt_hud.alignY = "top";
	attempt_hud.x = -25;
	attempt_hud.y = 80;
	attempt_hud.fontScale = 1.4;
	attempt_hud.alpha = 1;
	attempt_hud.hidewheninmenu = 1;
	attempt_hud.foreground = 1;
	attempt_hud.color = (1, 0.8, 1);

    if (level.script != getDvar("song_attempt_map"))
    {
        setDvar("song_attempts", 0);
        setDvar("song_attempt_map", level.script);
    }

    attempt_hud setValue(getDvarInt("song_attempts"));
    setDvar("song_attempts", getDvarInt("song_attempts") + 1);
}

PointDropTracker()
{
    self endon("disconnect");
    level endon("end_game");

	hud_drop_value = NewHudElem();
	hud_drop_value.horzAlign = "right";
	hud_drop_value.vertAlign = "top";
	hud_drop_value.alignX = "right";
	hud_drop_value.alignY = "top";
	hud_drop_value.x = -25;
	hud_drop_value.y = 100;
	hud_drop_value.fontScale = 1.4;
	hud_drop_value.alpha = 1;
	hud_drop_value.hidewheninmenu = 1;
	hud_drop_value.foreground = 1;
	hud_drop_value.color = (1, 0.6, 0.2);

    while (true)
    {
        if (level.zombie_vars["zombie_drop_item"])
        {
            hud_drop_value.color = (0.4, 1, 0.7);
            hud_drop_value setText(&"SONGS_YES");
        }
        else
        {
            hud_drop_value.color = (0.9, 0.5, 0);
            hud_drop_value setText(&"SONGS_NO");
        }

        wait 0.05;
    }
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

	hud_velocity_value = NewClientHudElem(self);
	hud_velocity_value.horzAlign = "right";
	hud_velocity_value.vertAlign = "top";
	hud_velocity_value.alignX = "right";
	hud_velocity_value.alignY = "top";
	hud_velocity_value.x = -25;
	hud_velocity_value.y = 130;
	hud_velocity_value.fontScale = 1.4;
	hud_velocity_value.alpha = 1;
	hud_velocity_value.hidewheninmenu = 1;
	hud_velocity_value.foreground = 1;

    while (true)
    {
        velocity = int(length(self getvelocity() * (1, 1, 0)));

        // Scale from IW3 / IW4 patches
        if (velocity < 330)
        {
            hud_velocity_value.color = (0.4, 1, 0.7);
            hud_velocity_value.glowcolor = (0.2, 0.7, 0.4);
        }

        else if (velocity <= 340)
        {
            hud_velocity_value.color = (0.8, 1, 0.6);
            hud_velocity_value.glowcolor = (0.6, 0.7, 0.4);
        }

        else if (velocity <= 350)
        {
            hud_velocity_value.color = (1, 1, 0.6);
            hud_velocity_value.glowcolor = (0.7, 0.7, 0.4);
        }

        else if (velocity <= 360)
        {
            hud_velocity_value.color = (1, 0.8, 0.4);
            hud_velocity_value.glowcolor = (0.7, 0.6, 0.2);
        }

        else if (velocity <= 370)
        {
            hud_velocity_value.color = (1, 0.6, 0.2);
            hud_velocity_value.glowcolor = (0.7, 0.4, 0.1);
        }

        else if (velocity <= 380)
        {
            hud_velocity_value.color = (1, 0.2, 0);
            hud_velocity_value.glowcolor = (0.7, 0.1, 0);
        }
        
        else
        {
            hud_velocity_value.color = (0.6, 0, 0);
            hud_velocity_value.glowcolor = (0.3, 0, 0);
        }
        
        hud_velocity_value setValue(velocity);
        wait 0.05;
    }
}

GspeedTracker()
{
    self endon("disconnect");
    level endon("end_game");

	hud_gspeed_value = NewHudElem();
	hud_gspeed_value.horzAlign = "right";
	hud_gspeed_value.vertAlign = "top";
	hud_gspeed_value.alignX = "right";
	hud_gspeed_value.alignY = "top";
	hud_gspeed_value.x = -25;
	hud_gspeed_value.y = 150;
	hud_gspeed_value.fontScale = 1.4;
	hud_gspeed_value.alpha = 1;
	hud_gspeed_value.hidewheninmenu = 1;
	hud_gspeed_value.foreground = 1;
	hud_gspeed_value.color = (0.4, 1, 0.7);

    while (true)
    {
        current_gspeed = getDvarInt("g_speed");
        if (current_gspeed != 190)
            hud_gspeed_value.color = (0.9, 0, 0);
        hud_gspeed_value setValue(current_gspeed);
        wait 0.05;
    }
}

// Songs logic

SongInit()
{
	self endon("disconnect");
	level endon("disconnect");
    level endon("end_game");

    songs = SpawnSongs();

    if (level.script == "zombie_moon")
    {
        SetDefaultSplit();
        split_mode = SelectSplit();

        song = undefined;
        if (split_mode == "coming home")
        {
            for (s = 0; s < songs.size; s++)
            {
                if (songs[s].title == "Coming Home")
                    song = songs[s];
            }
        }

        else if (split_mode == "nightmare")
        {
            for (s = 0; s < songs.size; s++)
            {
                if (songs[s].title == "Nightmare")
                    song = songs[s];
            }
        }

        else if (split_mode == "redamned")
        {
            for (s = 0; s < songs.size; s++)
            {
                if (songs[s].title == "Re-Damned")
                    song = songs[s];
            }
        }

        else if (split_mode == "coming home 8bit")
        {
            for (s = 0; s < songs.size; s++)
            {
                if (songs[s].title == "Coming Home 8-bit")
                    song = songs[s];
            }
        }

        else if (split_mode == "pareidolia 8bit")
        {
            for (s = 0; s < songs.size; s++)
            {
                if (songs[s].title == "Pareidolia 8-bit")
                    song = songs[s];
            }
        }

        song.active_splits = 1;
        song.id = 0;
        level.longest_splits = song.splits.size;
        song thread [[song.func]]();
        song thread [[song.splitfunc]]();
    }
    else
    {
        for (s = 0; s < songs.size; s++)
        {
            songs[s].id = s;
            songs[s].active_splits = 1;

            if (level.longest_splits < songs[s].splits.size)
                level.longest_splits = songs[s].splits.size;

            if (isDefined(songs[s].splitfunc))
                songs[s] thread [[songs[s].splitfunc]]();

            songs[s] thread [[songs[s].func]]();
        }
    }
}

SongWatcher()
{
    if (isDefined(level.meteor_counter))
    {
        while (level.meteor_counter == 0)
            wait 0.05;
        GenerateSplit(self.splits[0], self.active_splits, self.id);
        self.active_splits++;

        while (level.meteor_counter == 1)
            wait 0.05;
        GenerateSplit(self.splits[1], self.active_splits, self.id);
        self.active_splits++;

        while (level.meteor_counter == 2)
            wait 0.05;
    }
    else if (isDefined(level.teddybear_counter))
    {
        while (level.teddybear_counter == 0)
            wait 0.05;
        GenerateSplit(self.splits[0], self.active_splits, self.id);
        self.active_splits++;

        while (level.teddybear_counter == 1)
            wait 0.05;
        GenerateSplit(self.splits[1], self.active_splits, self.id);
        self.active_splits++;

        while (level.teddybear_counter == 2)
            wait 0.05;
    }
    else if (isDefined(level.phone_counter))
    {
        while (level.phone_counter == 0)
            wait 0.05;
        GenerateSplit(self.splits[0], self.active_splits, self.id);
        self.active_splits++;

        while (level.phone_counter == 1)
            wait 0.05;
        GenerateSplit(self.splits[1], self.active_splits, self.id);
        self.active_splits++;

        while (level.phone_counter == 2)
            wait 0.05;
    }
    else if (isDefined(level.toilet_counter))
    {
        // Custom splits func for Verr and Shino
        while (level.toilet_counter < 3)
            wait 0.05;
    }
    else if (isDefined(level.egg_damage_counter))
    {
        while (level.egg_damage_counter == 0)
            wait 0.05;
        GenerateSplit(self.splits[0], self.active_splits, self.id);
        self.active_splits++;

        while (level.egg_damage_counter == 1)
            wait 0.05;
        GenerateSplit(self.splits[1], self.active_splits, self.id);
        self.active_splits++;

        while (level.egg_damage_counter == 2)
            wait 0.05;
    }

    song_timestamp = GetGametime();
    // iPrintLn("song activated!!!");
    GenerateSong(song_timestamp, self.title, self.id);
}

MoonSongWatcher()
{
    id = 0;
    if (isDefined(self.split_offset))
        id = self.split_offset;

    while (!isDefined(level.meteor_counter) || level.meteor_counter == 0)
        wait 0.05;
    GenerateSplit(self.splits[id], self.active_splits, self.id);
    self.active_splits++;
    id++;

    while (level.meteor_counter == 1)
        wait 0.05;
    GenerateSplit(self.splits[id], self.active_splits, self.id);
    self.active_splits++;

    while (level.meteor_counter == 2)
        wait 0.05;

    song_timestamp = GetGametime();
    GenerateSong(song_timestamp, self.title, self.id);
}

MoonSplits()
{
    while (!isDefined(level.left_nomans_land) || (isDefined(level.left_nomans_land) && !level.left_nomans_land))
        wait 0.05;
    GenerateSplit(self.splits[0], self.active_splits, self.id);
    self.active_splits++;

    if (self.split_offeset == 2) 
    {
        flag_wait("power_on");
        GenerateSplit(self.splits[1], self.active_splits, self.id);
        self.active_splits++;
    }
}

EightBitWatcher()
{
	self endon("disconnect");
	level endon("disconnect");

    while (true)
    {
        level waittill("8-bit", trigger);
        if (trigger == self.trigger)
        {
            song_timestamp = GetGametime();
            GenerateSong(song_timestamp, self.title, self.id);
        }
        else
        {
            continue;
        }
    }
}

A7xHandler()
{
    breach_t11 = false;
    breach_t6 = false;
    while (!flag("both_tunnels_breached"))
    {
        if (flag("hangar_breached") && !breach_t11)
        {
            breach_t11 = true
            GenerateSplit(self.splits[2], self.active_splits, self.id);
            self.active_splits++;
        }
        if (flag("teleporter_breached") && !breach_t6)
        {
            breach_t6 = true
            GenerateSplit(self.splits[3], self.active_splits, self.id);
            self.active_splits++;
        }

        wait 0.05;
    }

    while (!level.played_extra_song_a7x)
        wait 0.05;
    song_timestamp = GetGametime();
    GenerateSong(song_timestamp, self.title, self.id);
}

NachtCounter()
{
    while (!flag("song_nacht"))
        wait 0.05;

    song_timestamp = GetGametime();
    GenerateSong(song_timestamp, self.title, self.id);
}

SelectSplit()
{
    while (true)
    {
        switch (getDvar("split"))
        {
            case "coming home":
            case "nightmare":
            case "redamned":
            case "coming home 8bit":
            case "pareidolia 8bit":
                return getDvar("split");
            default:
                wait 0.05;
        }
    }
}

SplitWatcherNacht()
{
    level waittill("door_opened", door_origin);
    if (door_origin == (175, 587, -9946))
        GenerateSplit(self.splits[0], self.active_splits, self.id);
}

SpawnSongs()
{
    all_songs = array();

    if (level.script == "zombie_theater")
    {
        one_one_five = spawnStruct();
        one_one_five.title = "115";
        one_one_five.func = ::SongWatcher;
        one_one_five.splits = array("First Meteor", "Second Meteor");
        all_songs[all_songs.size] = one_one_five;
    }

    else if (level.script == "zombie_pentagon")
    {
        wont_back_down = spawnStruct();
        wont_back_down.title = "Won't Back Down";
        wont_back_down.func = ::SongWatcher;
        wont_back_down.splits = array("First Phone", "Second Phone");
        all_songs[all_songs.size] = wont_back_down;
    }

    else if (level.script == "zombie_cosmodrome")
    {
        abracadavre = spawnStruct();
        abracadavre.title = "Abracadavre";
        abracadavre.func = ::SongWatcher;
        abracadavre.splits = array("First Teddy", "Second Teddy");
        all_songs[all_songs.size] = abracadavre;
    }

    else if (level.script == "zombie_coast")
    {
        not_ready_to_die = spawnStruct();
        not_ready_to_die.title = "Not Ready to Die";
        not_ready_to_die.func = ::SongWatcher;
        not_ready_to_die.splits = array("First Meteor", "Second Meteor");
        all_songs[all_songs.size] = not_ready_to_die;
    }

    else if (level.script == "zombie_temple")
    {
        pareidolia = spawnStruct();
        pareidolia.title = "Pareidolia";
        pareidolia.func = ::SongWatcher;
        pareidolia.splits = array("First Meteor", "Second Meteor");
        all_songs[all_songs.size] = pareidolia;
    }

    else if (level.script == "zombie_moon")
    {
        coming_home = spawnStruct();
        coming_home.title = "Coming Home";
        coming_home.func = ::MoonSongWatcher;
        coming_home.splitfunc = ::MoonSplits;
        coming_home.splits = array("No Man's Land", "First Teddy", "Second Teddy");
        coming_home.split_offset = 1;
        all_songs[all_songs.size] = coming_home;

        coming_home_8 = spawnStruct();
        coming_home_8.title = "Coming Home 8-bit";
        coming_home_8.func = ::EightBitWatcher;
        coming_home_8.splitfunc = ::MoonSplits;
        coming_home_8.splits = array("No Man's Land", "Power");
        coming_home_8.trigger = "mus_8bit_0";
        coming_home_8.split_offset = 2;
        all_songs[all_songs.size] = coming_home_8;

        pareidolia_8 = spawnStruct();
        pareidolia_8.title = "Pareidolia 8-bit";
        pareidolia_8.func = ::EightBitWatcher;
        pareidolia_8.splitfunc = ::MoonSplits;
        pareidolia_8.splits = array("No Man's Land", "Power");
        pareidolia_8.trigger = "mus_8bit_1";
        pareidolia_8.split_offset = 2;
        all_songs[all_songs.size] = pareidolia_8;

        re_damned = spawnStruct();
        re_damned.title = "Re-Damned";
        re_damned.func = ::EightBitWatcher;
        re_damned.splitfunc = ::MoonSplits;
        re_damned.splits = array("No Man's Land", "Power");
        re_damned.trigger = "mus_8bit_2";
        re_damned.split_offset = 2;
        all_songs[all_songs.size] = re_damned;

        nightmare = spawnStruct();
        nightmare.title = "Nightmare";
        nightmare.func = ::A7xHandler;
        nightmare.splitfunc = ::MoonSplits;
        nightmare.splits = array("No Man's Land", "Power", "Breach Tunnel 11", "Breach Tunnel 6");
        nightmare.split_offset = 2;
        all_songs[all_songs.size] = nightmare;
    }

    else if (level.script == "zombie_cod5_prototype")
    {
        undone = spawnStruct();
        undone.title = "Undone";
        undone.func = ::SongWatcher;
        undone.splits = array("First Barrel", "Second Barrel");
        all_songs[all_songs.size] = undone;

        radio = spawnStruct();
        radio.title = "Radio";
        radio.func = ::NachtCounter;
        radio.splitfunc = ::SplitWatcherNacht;
        radio.splits = array("Help Doors");
        all_songs[all_songs.size] = radio;
    }

    else if (level.script == "zombie_cod5_asylum")
    {
        lullaby = spawnStruct();
        lullaby.title = "Lullaby for a Dead Man";
        lullaby.func = ::SongWatcher;
        // lullaby.splitfunc = ::;
        all_songs[all_songs.size] = lullaby;
    }

    else if (level.script == "zombie_cod5_sumpf")
    {
        the_one = spawnStruct();
        the_one.title = "The One";
        the_one.func = ::SongWatcher;
        // the_one.splitfunc = ::;
        all_songs[all_songs.size] = the_one;
    }

    else if (level.script == "zombie_cod5_factory")
    {
        beauty_of_annihilation = spawnStruct();
        beauty_of_annihilation.func = ::SongWatcher;
        all_songs[all_songs.size] = beauty_of_annihilation;
    }

    return all_songs;
}

GetGametime()
{
    if (isDefined(level.start_timestamp))
        gametime = int(getTime() - level.start_timestamp);
    else
        gametime = int(getTime());
    return gametime;
}

// Songs HUD

GenerateSong(song_time, song_name, song_id)
{
    // y_offset = level.playing_songs * (20 * (level.longest_splits + 1));
    position = 30 + (((level.longest_splits + 1) * 20) * (song_id + 1));

    // iPrintLn("playing_songs: " + level.playing_songs + " / longest_splits: " + level.longest_splits + " / song_id: " + song_id);
    // iPrintLn("position: " + position);
    // iPrintLn("y_offset: " + y_offset);

	hud_song = NewHudElem();
	hud_song.horzAlign = "left";
	hud_song.vertAlign = "top";
	hud_song.alignX = "left";
	hud_song.alignY = "top";
	hud_song.x = 10;
	hud_song.y = position - 50;
	hud_song.fontScale = 1.4;
	hud_song.alpha = 0;
	hud_song.hidewheninmenu = 1;
	hud_song.foreground = 1;
	hud_song.color = (1, 0.6, 0.8);
    hud_song.label = song_name + ": ";
    
    hud_song setText(GetTimeDetailed(true, song_time));
	hud_song.alpha = 1;

    level.playing_songs++;

    return;
}

GenerateSplit(split, split_numbers, song_id)
{
    split_time = GetGametime();

    position = 35 + (((level.longest_splits + 1) * 20) * (song_id + 1));
    y_offset = split_numbers * 15;

    // iPrintLn("playing_songs: " + level.playing_songs + " / longest_splits: " + level.longest_splits + " / song_id: " + song_id + " / split_numbers: " + split_numbers);
    // iPrintLn("position: " + position);
    // iPrintLn("y_offset: " + y_offset);

	hud_split = NewHudElem();
	hud_split.horzAlign = "left";
	hud_split.vertAlign = "top";
	hud_split.alignX = "left";
	hud_split.alignY = "top";
	hud_split.x = 10;
	hud_split.y = (position + y_offset) - 50;
	hud_split.fontScale = 1.2;
	hud_split.alpha = 0;
	hud_split.hidewheninmenu = 1;
	hud_split.foreground = 1;
	hud_split.color = (0.8, 0.8, 0.8);
    hud_split.label = "" + split + ": ";
    
    hud_split setText(GetTimeDetailed(true, split_time));
	hud_split.alpha = 1;

    return;
}
