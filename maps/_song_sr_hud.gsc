#include common_scripts\utility;
#include maps\_utility; 
#include maps\_zombiemode;
#include maps\_zombiemode_utility; 
#include maps\_song_sr_utils;

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
    self endon("disconnect");
    level endon("end_game");

    AwaitLander();

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

    AwaitLander();

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

    AwaitLander();

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
    AwaitLander();

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

    AwaitLander();

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

GSpeedController()
{
    self endon("disconnect");
    level endon("end_game");

    AwaitLander();

    while (getDvarInt("g_speed") == 190)
        wait 0.05;

    gspeed_val = getDvar("g_speed");

	hud_gspeed_mark = NewHudElem();
	hud_gspeed_mark.horzAlign = "center";
	hud_gspeed_mark.vertAlign = "top";
	hud_gspeed_mark.alignX = "center";
	hud_gspeed_mark.alignY = "top";
	hud_gspeed_mark.x = 0;
	hud_gspeed_mark.y = 150;
	hud_gspeed_mark.fontScale = 1.3;
	hud_gspeed_mark.alpha = 0.66;
	hud_gspeed_mark.hidewheninmenu = 1;
	hud_gspeed_mark.foreground = 1;
	hud_gspeed_mark.color = (0.8, 0, 0);

    hud_gspeed_mark setText ("GSPEED CHANGED (" + getDvar("g_speed") + ")");

    while (true)
    {
        wait 0.1;

        if (getDvar("g_speed") == gspeed_val)
            continue;

        hud_gspeed_mark setText ("GSPEED CHANGED (" + getDvar("g_speed") + ")");
        gspeed_val = getDvar("g_speed");
    }

}

ZoneHud(print_real)
{
    self endon("disconnect");

    PlayerThreadBlackscreenWaiter();
    AwaitLander();
    AwaitVerrucktPrints();

	hud_zone = NewClientHudElem(self);
	hud_zone.horzAlign = "left";
	hud_zone.vertAlign = "bottom";
	hud_zone.alignX = "left";
	hud_zone.alignY = "bottom";
	hud_zone.x = 1;
	hud_zone.y = -100;
	hud_zone.fontScale = 1;
	hud_zone.alpha = 1;
	hud_zone.hidewheninmenu = 1;
	hud_zone.foreground = 1;

    zone = "";

    if (!isDefined(print_real))
        print_real = false;

    while (true)
    {
        wait 0.05;

        current_zone = self get_current_zone();

        if (current_zone == zone)
            continue;

        zone = current_zone;

        if (print_real)
            hud_zone setText(zone);
        else
            hud_zone setText(TranslateZone(zone));
    }
}

Compass()
{
    // Don't activate it randomly, will string overflow within a minute
    self endon("disconnect");

    PlayerThreadBlackscreenWaiter();

	comapss_hud = NewClientHudElem(self);
	comapss_hud.horzAlign = "center";
	comapss_hud.vertAlign = "middle";
	comapss_hud.alignX = "center";
	comapss_hud.alignY = "middle";
	comapss_hud.x = 25;
	comapss_hud.y = 25;
	comapss_hud.fontScale = 1;
	comapss_hud.alpha = 1;
	comapss_hud.hidewheninmenu = 1;
	comapss_hud.foreground = 1;

    position = (0, 0, 0);

    while (true)
    {
        wait 0.1;

        if (!getDvarInt("debug_compass"))
            continue;

        current_position = self.origin;

        if (current_position == position)
            continue;

        position = current_position;

        comapss_hud setText(position[0] + ", " + position[1] + ", " + position[2]);
    }
}

ZoneClock()
{
    self endon("disconnect");
    level endon("end_game");

    if (!isDefined(level.SONG_DEBUG) || !level.SONG_DEBUG)
        return;

	self.zone_clock = NewClientHudElem(self);
	self.zone_clock.horzAlign = "center";
	self.zone_clock.vertAlign = "middle";
	self.zone_clock.alignX = "center";
	self.zone_clock.alignY = "middle";
	self.zone_clock.x = 15;
	self.zone_clock.y = 15;
	self.zone_clock.fontScale = 1;
	self.zone_clock.alpha = 1;
	self.zone_clock.hidewheninmenu = 1;
	self.zone_clock.foreground = 1;
	self.zone_clock.color = (1, 1, 1);

    self thread ZoneClockColor(self.zone_clock);

    while (true)
    {
        self waittill("zoneclock_tick");
        self.zone_clock setTimer(3);
        // self waittill("zoneclock_waited");
        // self.zone_clock setText("^1TICK");
    }
}

ZoneClockColor(hud)
{
    while (true)
    {
        if (self.sessionstate == "spectator")
            hud.alpha = 0;
        else
            hud.alpha = 1;

        if (!self in_life_brush() && (self in_kill_brush() || !self in_enabled_playable_area()))
            hud.color = (1, 0.1, 0.1);
        else
            hud.color = (1, 1, 1);
        
        wait 0.05;
    }
}


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
