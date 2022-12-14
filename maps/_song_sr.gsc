#include maps\_utility; 
#include common_scripts\utility;
#include maps\_zombiemode_utility; 
#include maps\_song_sr_utils;
#include maps\_song_sr_hud;

SongSrInit()
{
    ModSetup();

    AwaitBlackscreen();

    level.start_timestamp = getTime();

    level thread Welcome();
    level thread SongInit();
    level thread TimerColorController();
    level thread AscensionMapTimer();
    level thread TimerHud();
    level thread AttemptsMain();
    // level thread DisplayBlocker();
    // level thread GspeedTracker();
    level thread GSpeedController();
    level thread PointDropTracker();
}

// Setup

SongStrings()
{
    PrecacheString(&"SONGS_ATTEMPTS");
    PrecacheString(&"SONGS_YES");
    PrecacheString(&"SONGS_NO");
    PrecacheString(&"SONGS_INTRODUCE");
    PrecacheString(&"SONGS_NETWORK_FRAME");
    PrecacheString(&"SONGS_LAUNCHER");
    PrecacheString(&"SONGS_SELECTION");
    PrecacheString(&"SONGS_NO_SELECTION");
    PrecacheString(&"SONGS_WARNING_GSPEED");
    PreCacheString(&"SONGS_WARNING_HOTJOIN");
    PreCacheString(&"SONGS_SPLIT_METEOR_FIRST");
    PreCacheString(&"SONGS_SPLIT_METEOR_SECOND");
    PreCacheString(&"SONGS_SPLIT_PHONE_FIRST");
    PreCacheString(&"SONGS_SPLIT_PHONE_SECOND");
    PreCacheString(&"SONGS_SPLIT_TEDDY_FIRST");
    PreCacheString(&"SONGS_SPLIT_TEDDY_SECOND");
    PreCacheString(&"SONGS_SPLIT_BARREL_FIRST");
    PreCacheString(&"SONGS_SPLIT_BARREL_SECOND");
    PreCacheString(&"SONGS_SPLIT_NO_MANS_LAND");
    PreCacheString(&"SONGS_SPLIT_POWER");
    PreCacheString(&"SONGS_SPLIT_BREACH_11");
    PreCacheString(&"SONGS_SPLIT_BREACH_6");
    PreCacheString(&"SONGS_SPLIT_HELP_DOOR");
    PreCacheString(&"SONGS_SPLIT_TOILET");
    PreCacheString(&"SONGS_SPLIT_SPAWN_DOOR");
    PreCacheString(&"SONGS_SPLIT_COMMS_DOOR");
    PreCacheString(&"SONGS_SPLIT_TUBE");
    PreCacheString(&"SONGS_SPLIT_HANGAR");

    if (IsKino())
    {
        PrecacheString(&"ZONES_ZOMBIE_THEATER_FOYER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_FOYER2_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_VIP_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_DINING_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_DRESSING_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_STAGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_THEATER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_WEST_BALCONY_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_ALLEYWAY_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_THEATER_CREMATORIUM_ZONE");
    }
    else if (IsFive())
    {
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_CONFERENCE_LEVEL1");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_HALLWAY_LEVEL1");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_TOP");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_NORTH");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_SOUTH");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_ELEVATOR");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_ZONE_ELEVATOR");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_ELEVATOR");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_HALLWAY1");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_HALLWAY2");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_ZONE1");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_ZONE2");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_LABS_ZONE3");
        PrecacheString(&"ZONES_ZOMBIE_PENTAGON_CONFERENCE_LEVEL2");
    }
    else if (IsAscension())
    {
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_CENTRIFUGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_CENTRIFUGE_ZONE2");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_ACCESS_TUNNEL_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_STORAGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_STORAGE_ZONE2");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_STORAGE_LANDER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_BASE_ENTRY_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_BASE_ENTRY_ZONE2");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_POWER_BUILDING");
        preCacheString(&"ZONES_ZOMBIE_COSMODROME_POWER_BUILDING_ROOF");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_CENTRIFUGE2POWER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_NORTH_PATH_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_UNDER_ROCKET_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_CONTROL_ROOM_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_LABS_ZONE2");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_ROOF_CONNECTOR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COSMODROME_NORTH_CATWALK_ZONE3");
    }
    else if (IsCotd())
    {
        PrecacheString(&"ZONES_ZOMBIE_COAST_BEACH_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPBACK_NEAR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPBACK_FAR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPBACK_NEAR2_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPBACK_LEVEL3_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPFRONT_NEAR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPFRONT_FAR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPFRONT_STORAGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_SHIPFRONT_BOTTOM_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_BEACH_ZONE2");
        PrecacheString(&"ZONES_ZOMBIE_COAST_RESIDENCE_ROOF_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_RESIDENCE1_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_START_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_LIGHTHOUSE1_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_LIGHTHOUSE2_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_CATWALK_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_START_CAVE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_REAR_LAGOON_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COAST_START_BEACH_ZONE");
    }
    else if (IsShang())
    {
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_TEMPLE_START_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_PRESSURE_PLATE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_CAVE_TUNNEL_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_CAVES1_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_CAVES2_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_CAVES3_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_POWER_ROOM_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_CAVES_WATER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_WATERFALL_LOWER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_WATERFALL_TUNNEL_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_WATERFALL_TUNNEL_A_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_WATERFALL_UPPER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_TEMPLE_WATERFALL_UPPER1_ZONE");
    }
    else if (IsMoon())
    {
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_BRIDGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_WATER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_WEST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_CATA_LEFT_START_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_CATA_LEFT_MIDDLE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_WEST2_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_EAST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_CATA_RIGHT_START_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_CATA_RIGHT_MIDDLE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_NML_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_CATA_RIGHT_END_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_EAST2_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_GENERATOR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_GENERATOR_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_GENERATOR_EXIT_EAST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_ENTER_FOREST_EAST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_LABS_2_BIODOME");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_DIGSITE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_TOWER_ZONE_EAST2");
        PrecacheString(&"ZONES_ZOMBIE_MOON_TOWER_ZONE_EAST");
        PrecacheString(&"ZONES_ZOMBIE_MOON_BRIDGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_AIRLOCK_BIODOME_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_MOON_FOREST_ZONE");
    }
    else if (IsNacht())
    {
        PrecacheString(&"ZONES_ZOMBIE_COD5_PROTOTYPE_START_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_PROTOTYPE_BOX_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_PROTOTYPE_UPSTAIRS_ZONE");
    }
    else if (IsVerruckt())
    {
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_WEST_DOWNSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_SOUTH_UPSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_SOUTH2_UPSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_POWER_UPSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_KITCHEN_UPSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_NORTH2_UPSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_NORTH_UPSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_NORTH_DOWNSTAIRS_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_ASYLUM_WEST2_DOWNSTAIRS_ZONE");
    }
    else if (IsShino())
    {
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_CENTER_BUILDING_UPSTAIRS");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_CENTER_BUILDING_UPSTAIRS_BUY");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_CENTER_BUILDING_COMBINED");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_NORTHWEST_OUTSIDE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_NORTHWEST_BUILDING");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_SOUTHWEST_OUTSIDE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_SOUTHWEST_BUILDING");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_SOUTHEAST_OUTSIDE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_SOUTHEAST_BUILDING");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_NORTHEAST_OUTSIDE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_SUMPF_NORTHEAST_BUILDING");
    }
    else if (IsDer())
    {
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_RECEIVER_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_OUTSIDE_WEST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_WAREHOUSE_BOTTOM_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_BRIDGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_WAREHOUSE_TOP_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_TP_WEST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_OUTSIDE_EAST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_WNUEN_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_TP_EAST_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_WNUEN_BRIDGE_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_OUTSIDE_SOUTH_ZONE");
        PrecacheString(&"ZONES_ZOMBIE_COD5_FACTORY_TP_SOUTH_ZONE");
    }
}

ModSetup()
{
    flag_init("song_nacht");
    flag_init("game_started");

    // This dvar has to always be overriden for .menu hud elems
    setDvar("zm_song_start", 0);
    song_dvars = array("debug_compass", "hud_color", "split", "velocity_size");
    for (d=0; d<song_dvars.size; d++)
        InitSongDvar(song_dvars[d]);

    SetDefaultSplit();

    level.PATCH_VERSION = 3;
    level.WAIT_FOR_8BIT = true;
    level.SONG_DEBUG = false;
    level.VALIDATE_NETWORK_FRAME = true;
    level.OFFSET_LANDER_TIME = true;

    level.playing_songs = 0;
    level.longest_splits = 0;

    self thread HotJoinMonitor();
}

SongInit()
{
	self endon("disconnect");
	level endon("disconnect");
    level endon("end_game");

    songs = SpawnSongs();

    if (IsMoon())
    {
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

        else if (split_mode == "coming home 8")
        {
            for (s = 0; s < songs.size; s++)
            {
                if (songs[s].title == "Coming Home 8-bit")
                    song = songs[s];
            }
        }

        else if (split_mode == "pareidolia 8")
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

FirstUseSongWatcher()
{
    if (isDefined(level.meteor_counter))
    {
        while (level.meteor_counter == 0)
            wait 0.05;
        GenerateSplit(self.splits[0], self.active_splits, self.id);
        self.active_splits++;

        while (level.meteor_counter < 3)
            wait 0.05;
    }

    song_timestamp = GetGametime();
    GenerateSong(song_timestamp, self.title, self.id);
}

ZoneScanner()
{
    self thread SplitWatcherHub();

    reached_zone = false;
    while (!reached_zone)
    {
        players = getPlayers();

        if (IsVerruckt())
        {
            for (p = 0; p < players.size; p++)
            {
                if ((players[p].origin[0] < -127) && (players[p].origin[1] < -845))
                    reached_zone = true;
            }
        }

        else if (IsDer())
        {
            for (p = 0; p < players.size; p++)
            {
                // Y can go up to -963, but it's moved to prevent trigger going off on garage stairs
                if ((players[p].origin[0] < 151.4) && (players[p].origin[1] < -1009) && (players[p].origin[2] > 188.5))
                    reached_zone = true;
            }
        }

        wait 0.05;
    }

    GenerateSplit(self.splits[1], self.active_splits, self.id);
    self.active_splits++;
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
            case "coming home 8":
            case "pareidolia 8":
                return getDvar("split");
            default:
                wait 0.05;
        }
    }
}

SplitWatcherHub()
{
    self thread SplitWatcherDoors();
    self thread SplitWatcherDebris();
}

SplitWatcherDoors()
{
    while (true)
    {
        level waittill("door_opened", door_origin);

        if (isDefined(level.SONG_DEBUG) && level.SONG_DEBUG)
            iPrintLn(door_origin);

        // Nacht help door
        if ((door_origin == (175, 587, -9946)) && IsNacht())
        {
            GenerateSplit(self.splits[0], self.active_splits, self.id);
            self.active_splits++;
        }

        // Second Verruckt doors
        // else if ((door_origin == (144, -678, -9733)) && IsVerruckt())
        // {
        //     GenerateSplit(self.splits[1], self.active_splits, self.id);
        //     self.active_splits++;
        // }

        // Third Shino doors
        else if ((door_origin == (7966, -1046, -10619)) && IsShino())
        {
            GenerateSplit(self.splits[1], self.active_splits, self.id);
            self.active_splits++;
        }
    }
}

SplitWatcherDebris()
{
    while (true)
    {
        level waittill("junk purchased", door_origin);

        if (isDefined(level.SONG_DEBUG) && level.SONG_DEBUG)
            iPrintLn(door_origin);

        // First Verruckt doors
        if ((door_origin == (1017, -678, 188)) && IsVerruckt())
        {
            GenerateSplit(self.splits[0], self.active_splits, self.id);
            self.active_splits++;
        }

        // First Shino doors
        else if ((door_origin == (10124, 373, -478)) && IsShino())
        {
            GenerateSplit(self.splits[0], self.active_splits, self.id);
            self.active_splits++;
        }
    }
}

SpawnSongs()
{
    all_songs = array();

    if (IsKino())
    {
        one_one_five = spawnStruct();
        one_one_five.title = "115";
        one_one_five.func = ::SongWatcher;
        one_one_five.splits = array(&"SONGS_SPLIT_METEOR_FIRST", &"SONGS_SPLIT_METEOR_SECOND");
        all_songs[all_songs.size] = one_one_five;
    }

    else if (IsFive())
    {
        wont_back_down = spawnStruct();
        wont_back_down.title = "Won't Back Down";
        wont_back_down.func = ::SongWatcher;
        wont_back_down.splits = array(&"SONGS_SPLIT_PHONE_FIRST", &"SONGS_SPLIT_PHONE_SECOND");
        all_songs[all_songs.size] = wont_back_down;
    }

    else if (IsAscension())
    {
        abracadavre = spawnStruct();
        abracadavre.title = "Abracadavre";
        abracadavre.func = ::SongWatcher;
        abracadavre.splits = array(&"SONGS_SPLIT_TEDDY_FIRST", &"SONGS_SPLIT_TEDDY_SECOND");
        all_songs[all_songs.size] = abracadavre;
    }

    else if (IsCotd())
    {
        not_ready_to_die = spawnStruct();
        not_ready_to_die.title = "Not Ready to Die";
        not_ready_to_die.func = ::SongWatcher;
        not_ready_to_die.splits = array(&"SONGS_SPLIT_METEOR_FIRST", &"SONGS_SPLIT_METEOR_SECOND");
        all_songs[all_songs.size] = not_ready_to_die;
    }

    else if (IsShang())
    {
        pareidolia = spawnStruct();
        pareidolia.title = "Pareidolia";
        pareidolia.func = ::SongWatcher;
        pareidolia.splits = array(&"SONGS_SPLIT_METEOR_FIRST", &"SONGS_SPLIT_METEOR_SECOND");
        all_songs[all_songs.size] = pareidolia;
    }

    else if (IsMoon())
    {
        coming_home = spawnStruct();
        coming_home.title = "Coming Home";
        coming_home.func = ::MoonSongWatcher;
        coming_home.splitfunc = ::MoonSplits;
        coming_home.splits = array(&"SONGS_SPLIT_NO_MANS_LAND", &"SONGS_SPLIT_TEDDY_FIRST", &"SONGS_SPLIT_TEDDY_SECOND");
        coming_home.split_offset = 1;
        all_songs[all_songs.size] = coming_home;

        coming_home_8 = spawnStruct();
        coming_home_8.title = "Coming Home 8-bit";
        coming_home_8.func = ::EightBitWatcher;
        coming_home_8.splitfunc = ::MoonSplits;
        coming_home_8.splits = array(&"SONGS_SPLIT_NO_MANS_LAND", &"SONGS_SPLIT_POWER");
        coming_home_8.trigger = "mus_8bit_0";
        coming_home_8.split_offset = 2;
        all_songs[all_songs.size] = coming_home_8;

        pareidolia_8 = spawnStruct();
        pareidolia_8.title = "Pareidolia 8-bit";
        pareidolia_8.func = ::EightBitWatcher;
        pareidolia_8.splitfunc = ::MoonSplits;
        pareidolia_8.splits = array(&"SONGS_SPLIT_NO_MANS_LAND", &"SONGS_SPLIT_POWER");
        pareidolia_8.trigger = "mus_8bit_1";
        pareidolia_8.split_offset = 2;
        all_songs[all_songs.size] = pareidolia_8;

        re_damned = spawnStruct();
        re_damned.title = "Re-Damned";
        re_damned.func = ::EightBitWatcher;
        re_damned.splitfunc = ::MoonSplits;
        re_damned.splits = array(&"SONGS_SPLIT_NO_MANS_LAND", &"SONGS_SPLIT_POWER");
        re_damned.trigger = "mus_8bit_2";
        re_damned.split_offset = 2;
        all_songs[all_songs.size] = re_damned;

        nightmare = spawnStruct();
        nightmare.title = "Nightmare";
        nightmare.func = ::A7xHandler;
        nightmare.splitfunc = ::MoonSplits;
        nightmare.splits = array(&"SONGS_SPLIT_NO_MANS_LAND", &"SONGS_SPLIT_POWER", &"SONGS_SPLIT_BREACH_11", &"SONGS_SPLIT_BREACH_6");
        nightmare.split_offset = 2;
        all_songs[all_songs.size] = nightmare;
    }

    else if (IsNacht())
    {
        undone = spawnStruct();
        undone.title = "Undone";
        undone.func = ::SongWatcher;
        undone.splits = array(&"SONGS_SPLIT_BARREL_FIRST", &"SONGS_SPLIT_BARREL_SECOND");
        all_songs[all_songs.size] = undone;

        radio = spawnStruct();
        radio.title = "Radio";
        radio.func = ::NachtCounter;
        radio.splitfunc = ::SplitWatcherHub;
        radio.splits = array(&"SONGS_SPLIT_HELP_DOOR");
        all_songs[all_songs.size] = radio;
    }

    else if (IsVerruckt())
    {
        lullaby = spawnStruct();
        lullaby.title = "Lullaby for a Dead Man";
        lullaby.func = ::SongWatcher;
        lullaby.splitfunc = ::ZoneScanner;
        lullaby.splits = array(&"SONGS_SPLIT_SPAWN_DOOR", &"SONGS_SPLIT_TOILET");
        all_songs[all_songs.size] = lullaby;
    }

    else if (IsShino())
    {
        the_one = spawnStruct();
        the_one.title = "The One";
        the_one.func = ::SongWatcher;
        the_one.splitfunc = ::SplitWatcherHub;
        the_one.splits = array(&"SONGS_SPLIT_SPAWN_DOOR", &"SONGS_SPLIT_COMMS_DOOR");
        all_songs[all_songs.size] = the_one;
    }

    else if (IsDer())
    {
        beauty_of_annihilation = spawnStruct();
        beauty_of_annihilation.title = "Beauty of Annihilation";
        beauty_of_annihilation.func = ::FirstUseSongWatcher;
        beauty_of_annihilation.splitfunc = ::ZoneScanner;
        beauty_of_annihilation.splits = array(&"SONGS_SPLIT_TUBE", &"SONGS_SPLIT_HANGAR");
        all_songs[all_songs.size] = beauty_of_annihilation;
    }

    return all_songs;
}
