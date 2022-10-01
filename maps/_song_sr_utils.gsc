#include maps\_utility; 
#include common_scripts\utility;
#include maps\_zombiemode_utility; 

ZoneHandler(zonestr)
{
    switch(zonestr)
    {
        case "songs_zombie_theater_foyer_zone":
            return &"SONGS_ZOMBIE_THEATER_FOYER_ZONE";
        case "songs_zombie_theater_foyer2_zone":
            return &"SONGS_ZOMBIE_THEATER_FOYER2_ZONE";
        case "songs_zombie_theater_vip_zone":
            return &"SONGS_ZOMBIE_THEATER_VIP_ZONE";
        case "songs_zombie_theater_dining_zone":
            return &"SONGS_ZOMBIE_THEATER_DINING_ZONE";
        case "songs_zombie_theater_dressing_zone":
            return &"SONGS_ZOMBIE_THEATER_DRESSING_ZONE";
        case "songs_zombie_theater_stage_zone":
            return &"SONGS_ZOMBIE_THEATER_STAGE_ZONE";
        case "songs_zombie_theater_theater_zone":
            return &"SONGS_ZOMBIE_THEATER_THEATER_ZONE";
        case "songs_zombie_theater_west_balcony_zone":
            return &"SONGS_ZOMBIE_THEATER_WEST_BALCONY_ZONE";
        case "songs_zombie_theater_alleyway_zone":
            return &"SONGS_ZOMBIE_THEATER_ALLEYWAY_ZONE";
        case "songs_zombie_theater_crematorium_zone":
            return &"SONGS_ZOMBIE_THEATER_CREMATORIUM_ZONE";

        case "songs_zombie_pentagon_conference_level1":
            return &"SONGS_ZOMBIE_PENTAGON_CONFERENCE_LEVEL1";
        case "songs_zombie_pentagon_hallway_level1":
            return &"SONGS_ZOMBIE_PENTAGON_HALLWAY_LEVEL1";
        case "songs_zombie_pentagon_war_room_zone_top":
            return &"SONGS_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_TOP";
        case "songs_zombie_pentagon_war_room_zone_north":
            return &"SONGS_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_NORTH";
        case "songs_zombie_pentagon_war_room_zone_south":
            return &"SONGS_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_SOUTH";
        case "songs_zombie_pentagon_war_room_zone_elevator":
            return &"SONGS_ZOMBIE_PENTAGON_WAR_ROOM_ZONE_ELEVATOR";
        case "songs_zombie_pentagon_labs_zone_elevator":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_ZONE_ELEVATOR";
        case "songs_zombie_pentagon_labs_elevator":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_ELEVATOR";
        case "songs_zombie_pentagon_labs_hallway1":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_HALLWAY1";
        case "songs_zombie_pentagon_labs_hallway2":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_HALLWAY2";
        case "songs_zombie_pentagon_labs_zone1":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_ZONE1";
        case "songs_zombie_pentagon_labs_zone2":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_ZONE2";
        case "songs_zombie_pentagon_labs_zone3":
            return &"SONGS_ZOMBIE_PENTAGON_LABS_ZONE3";
        case "songs_zombie_pentagon_conference_level2":
            return &"SONGS_ZOMBIE_PENTAGON_CONFERENCE_LEVEL2";

        case "songs_zombie_cosmodrome_centrifuge_zone":
            return &"SONGS_ZOMBIE_COSMODROME_CENTRIFUGE_ZONE";
        case "songs_zombie_cosmodrome_centrifuge_zone2":
            return &"SONGS_ZOMBIE_COSMODROME_CENTRIFUGE_ZONE2";
        case "songs_zombie_cosmodrome_access_tunnel_zone":
            return &"SONGS_ZOMBIE_COSMODROME_ACCESS_TUNNEL_ZONE";
        case "songs_zombie_cosmodrome_storage_zone":
            return &"SONGS_ZOMBIE_COSMODROME_STORAGE_ZONE";
        case "songs_zombie_cosmodrome_storage_zone2":
            return &"SONGS_ZOMBIE_COSMODROME_STORAGE_ZONE2";
        case "songs_zombie_cosmodrome_storage_lander_zone":
            return &"SONGS_ZOMBIE_COSMODROME_STORAGE_LANDER_ZONE";
        case "songs_zombie_cosmodrome_base_entry_zone":
            return &"SONGS_ZOMBIE_COSMODROME_BASE_ENTRY_ZONE";
        case "songs_zombie_cosmodrome_base_entry_zone2":
            return &"SONGS_ZOMBIE_COSMODROME_BASE_ENTRY_ZONE2";
        case "songs_zombie_cosmodrome_power_building":
            return &"SONGS_ZOMBIE_COSMODROME_POWER_BUILDING";
        case "songs_zombie_cosmodrome_power_building_roof":
            return &"SONGS_ZOMBIE_COSMODROME_POWER_BUILDING_ROOF";
        case "songs_zombie_cosmodrome_centrifuge2power_zone":
            return &"SONGS_ZOMBIE_COSMODROME_CENTRIFUGE2POWER_ZONE";
        case "songs_zombie_cosmodrome_north_path_zone":
            return &"SONGS_ZOMBIE_COSMODROME_NORTH_PATH_ZONE";
        case "songs_zombie_cosmodrome_under_rocket_zone":
            return &"SONGS_ZOMBIE_COSMODROME_UNDER_ROCKET_ZONE";
        case "songs_zombie_cosmodrome_control_room_zone":
            return &"SONGS_ZOMBIE_COSMODROME_CONTROL_ROOM_ZONE";
        case "songs_zombie_cosmodrome_labs_zone2":
            return &"SONGS_ZOMBIE_COSMODROME_LABS_ZONE2";
        case "songs_zombie_cosmodrome_roof_connector_zone":
            return &"SONGS_ZOMBIE_COSMODROME_ROOF_CONNECTOR_ZONE";
        case "songs_zombie_cosmodrome_north_catwalk_zone3":
            return &"SONGS_ZOMBIE_COSMODROME_NORTH_CATWALK_ZONE3";

        case "songs_zombie_coast_beach_zone":
            return &"SONGS_ZOMBIE_COAST_BEACH_ZONE";
        case "songs_zombie_coast_shipback_near_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPBACK_NEAR_ZONE";
        case "songs_zombie_coast_shipback_far_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPBACK_FAR_ZONE";
        case "songs_zombie_coast_shipback_near2_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPBACK_NEAR2_ZONE";
        case "songs_zombie_coast_shipback_level3_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPBACK_LEVEL3_ZONE";
        case "songs_zombie_coast_shipfront_near_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPFRONT_NEAR_ZONE";
        case "songs_zombie_coast_shipfront_far_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPFRONT_FAR_ZONE";
        case "songs_zombie_coast_shipfront_storage_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPFRONT_STORAGE_ZONE";
        case "songs_zombie_coast_shipfront_bottom_zone":
            return &"SONGS_ZOMBIE_COAST_SHIPFRONT_BOTTOM_ZONE";
        case "songs_zombie_coast_beach_zone2":
            return &"SONGS_ZOMBIE_COAST_BEACH_ZONE2";
        case "songs_zombie_coast_residence_roof_zone":
            return &"SONGS_ZOMBIE_COAST_RESIDENCE_ROOF_ZONE";
        case "songs_zombie_coast_residence1_zone":
            return &"SONGS_ZOMBIE_COAST_RESIDENCE1_ZONE";
        case "songs_zombie_coast_start_zone":
            return &"SONGS_ZOMBIE_COAST_START_ZONE";
        case "songs_zombie_coast_lighthouse1_zone":
            return &"SONGS_ZOMBIE_COAST_LIGHTHOUSE1_ZONE";
        case "songs_zombie_coast_lighthouse2_zone":
            return &"SONGS_ZOMBIE_COAST_LIGHTHOUSE2_ZONE";
        case "songs_zombie_coast_catwalk_zone":
            return &"SONGS_ZOMBIE_COAST_CATWALK_ZONE";
        case "songs_zombie_coast_start_cave_zone":
            return &"SONGS_ZOMBIE_COAST_START_CAVE_ZONE";
        case "songs_zombie_coast_rear_lagoon_zone":
            return &"SONGS_ZOMBIE_COAST_REAR_LAGOON_ZONE";
        case "songs_zombie_coast_start_beach_zone":
            return &"SONGS_ZOMBIE_COAST_START_BEACH_ZONE";

        case "songs_zombie_temple_temple_start_zone":
            return &"SONGS_ZOMBIE_TEMPLE_TEMPLE_START_ZONE";
        case "songs_zombie_temple_pressure_plate_zone":
            return &"SONGS_ZOMBIE_TEMPLE_PRESSURE_PLATE_ZONE";
        case "songs_zombie_temple_cave_tunnel_zone":
            return &"SONGS_ZOMBIE_TEMPLE_CAVE_TUNNEL_ZONE";
        case "songs_zombie_temple_caves1_zone":
            return &"SONGS_ZOMBIE_TEMPLE_CAVES1_ZONE";
        case "songs_zombie_temple_caves2_zone":
            return &"SONGS_ZOMBIE_TEMPLE_CAVES2_ZONE";
        case "songs_zombie_temple_caves3_zone":
            return &"SONGS_ZOMBIE_TEMPLE_CAVES3_ZONE";
        case "songs_zombie_temple_power_room_zone":
            return &"SONGS_ZOMBIE_TEMPLE_POWER_ROOM_ZONE";
        case "songs_zombie_temple_caves_water_zone":
            return &"SONGS_ZOMBIE_TEMPLE_CAVES_WATER_ZONE";
        case "songs_zombie_temple_waterfall_lower_zone":
            return &"SONGS_ZOMBIE_TEMPLE_WATERFALL_LOWER_ZONE";
        case "songs_zombie_temple_waterfall_tunnel_zone":
            return &"SONGS_ZOMBIE_TEMPLE_WATERFALL_TUNNEL_ZONE";
        case "songs_zombie_temple_waterfall_tunnel_a_zone":
            return &"SONGS_ZOMBIE_TEMPLE_WATERFALL_TUNNEL_A_ZONE";
        case "songs_zombie_temple_waterfall_upper_zone":
            return &"SONGS_ZOMBIE_TEMPLE_WATERFALL_UPPER_ZONE";
        case "songs_zombie_temple_waterfall_upper1_zone":
            return &"SONGS_ZOMBIE_TEMPLE_WATERFALL_UPPER1_ZONE";

        case "songs_zombie_moon_airlock_bridge_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_BRIDGE_ZONE";
        case "songs_zombie_moon_water_zone":
            return &"SONGS_ZOMBIE_MOON_WATER_ZONE";
        case "songs_zombie_moon_airlock_west_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_WEST_ZONE";
        case "songs_zombie_moon_cata_left_start_zone":
            return &"SONGS_ZOMBIE_MOON_CATA_LEFT_START_ZONE";
        case "songs_zombie_moon_cata_left_middle_zone":
            return &"SONGS_ZOMBIE_MOON_CATA_LEFT_MIDDLE_ZONE";
        case "songs_zombie_moon_airlock_west2_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_WEST2_ZONE";
        case "songs_zombie_moon_airlock_east_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_EAST_ZONE";
        case "songs_zombie_moon_cata_right_start_zone":
            return &"SONGS_ZOMBIE_MOON_CATA_RIGHT_START_ZONE";
        case "songs_zombie_moon_cata_right_middle_zone":
            return &"SONGS_ZOMBIE_MOON_CATA_RIGHT_MIDDLE_ZONE";
        case "songs_zombie_moon_nml_zone":
            return &"SONGS_ZOMBIE_MOON_NML_ZONE";
        case "songs_zombie_moon_cata_right_end_zone":
            return &"SONGS_ZOMBIE_MOON_CATA_RIGHT_END_ZONE";
        case "songs_zombie_moon_airlock_east2_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_EAST2_ZONE";
        case "songs_zombie_moon_generator_zone":
            return &"SONGS_ZOMBIE_MOON_GENERATOR_ZONE";
        case "songs_zombie_moon_airlock_generator_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_GENERATOR_ZONE";
        case "songs_zombie_moon_generator_exit_east_zone":
            return &"SONGS_ZOMBIE_MOON_GENERATOR_EXIT_EAST_ZONE";
        case "songs_zombie_moon_enter_forest_east_zone":
            return &"SONGS_ZOMBIE_MOON_ENTER_FOREST_EAST_ZONE";
        case "songs_zombie_moon_airlock_labs_2_biodome":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_LABS_2_BIODOME";
        case "songs_zombie_moon_airlock_digsite_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_DIGSITE_ZONE";
        case "songs_zombie_moon_tower_zone_east":
            return &"SONGS_ZOMBIE_MOON_TOWER_ZONE_EAST";
        case "songs_zombie_moon_tower_zone_east2":
            return &"SONGS_ZOMBIE_MOON_TOWER_ZONE_EAST2";
        case "songs_zombie_moon_bridge_zone":
            return &"SONGS_ZOMBIE_MOON_BRIDGE_ZONE";
        case "songs_zombie_moon_airlock_biodome_zone":
            return &"SONGS_ZOMBIE_MOON_AIRLOCK_BIODOME_ZONE";
        case "songs_zombie_moon_forest_zone":
            return &"SONGS_ZOMBIE_MOON_FOREST_ZONE";

        case "songs_zombie_cod5_prototype_start_zone":
            return &"SONGS_ZOMBIE_COD5_PROTOTYPE_START_ZONE";
        case "songs_zombie_cod5_prototype_box_zone":
            return &"SONGS_ZOMBIE_COD5_PROTOTYPE_BOX_ZONE";
        case "songs_zombie_cod5_prototype_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_PROTOTYPE_UPSTAIRS_ZONE";

        case "songs_zombie_cod5_asylum_west_downstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_WEST_DOWNSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_south_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_SOUTH_UPSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_south2_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_SOUTH2_UPSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_power_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_POWER_UPSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_kitchen_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_KITCHEN_UPSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_north2_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_NORTH2_UPSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_north_upstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_NORTH_UPSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_north_downstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_NORTH_DOWNSTAIRS_ZONE";
        case "songs_zombie_cod5_asylum_west2_downstairs_zone":
            return &"SONGS_ZOMBIE_COD5_ASYLUM_WEST2_DOWNSTAIRS_ZONE";

        case "songs_zombie_cod5_sumpf_center_building_upstairs":
            return &"SONGS_ZOMBIE_COD5_SUMPF_CENTER_BUILDING_UPSTAIRS";
        case "songs_zombie_cod5_sumpf_center_building_upstairs_buy":
            return &"SONGS_ZOMBIE_COD5_SUMPF_CENTER_BUILDING_UPSTAIRS_BUY";
        case "songs_zombie_cod5_sumpf_northwest_outside":
            return &"SONGS_ZOMBIE_COD5_SUMPF_NORTHWEST_OUTSIDE";
        case "songs_zombie_cod5_sumpf_northwest_building":
            return &"SONGS_ZOMBIE_COD5_SUMPF_NORTHWEST_BUILDING";
        case "songs_zombie_cod5_sumpf_southwest_outside":
            return &"SONGS_ZOMBIE_COD5_SUMPF_SOUTHWEST_OUTSIDE";
        case "songs_zombie_cod5_sumpf_southwest_building":
            return &"SONGS_ZOMBIE_COD5_SUMPF_SOUTHWEST_BUILDING";
        case "songs_zombie_cod5_sumpf_southeast_outside":
            return &"SONGS_ZOMBIE_COD5_SUMPF_SOUTHEAST_OUTSIDE";
        case "songs_zombie_cod5_sumpf_southeast_building":
            return &"SONGS_ZOMBIE_COD5_SUMPF_SOUTHEAST_BUILDING";
        case "songs_zombie_cod5_sumpf_northeast_outside":
            return &"SONGS_ZOMBIE_COD5_SUMPF_NORTHEAST_OUTSIDE";
        case "songs_zombie_cod5_sumpf_northeasy_building":
            return &"SONGS_ZOMBIE_COD5_SUMPF_NORTHEASY_BUILDING";

        case "songs_zombie_cod5_factory_warehouse_bottom_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_WAREHOUSE_BOTTOM_ZONE";
        case "songs_zombie_cod5_factory_receiver_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_RECEIVER_ZONE";
        case "songs_zombie_cod5_factory_outside_west_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_OUTSIDE_WEST_ZONE";
        case "songs_zombie_cod5_factory_bridge_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_BRIDGE_ZONE";
        case "songs_zombie_cod5_factory_warehouse_top_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_WAREHOUSE_TOP_ZONE";
        case "songs_zombie_cod5_factory_tp_west_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_TP_WEST_ZONE";
        case "songs_zombie_cod5_factory_outside_east_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_OUTSIDE_EAST_ZONE";
        case "songs_zombie_cod5_factory_wnuen_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_WNUEN_ZONE";
        case "songs_zombie_cod5_factory_tp_east_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_TP_EAST_ZONE";
        case "songs_zombie_cod5_factory_wnuen_bridge_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_WNUEN_BRIDGE_ZONE";
        case "songs_zombie_cod5_factory_outside_south_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_OUTSIDE_SOUTH_ZONE";
        case "songs_zombie_cod5_factory_tp_south_zone":
            return &"SONGS_ZOMBIE_COD5_FACTORY_TP_SOUTH_ZONE";

        default:
            return "UNKNOWN";
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

AwaitLander()
{
    // Is needed for .menu files hud elements
    if (level.script == "zombie_cosmodrome")
        wait 6.5;
    return;
}

AwaitVerrucktPrints()
{
    if (level.script == "zombie_cod5_asylum")
        wait 8;
    return;
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

TranslateZone(zone)
{
    zone_str = maps\_song_sr_utils::ZoneHandler("songs_" + level.script + "_"  + zone);
    return zone_str;
}

GetGametime()
{
    if (isDefined(level.start_timestamp))
        gametime = int(getTime() - level.start_timestamp);
    else
        gametime = int(getTime());
    return gametime;
}
