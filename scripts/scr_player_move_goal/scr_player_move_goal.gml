function scr_player_move_goal()
{
	
	#region /* Goal */
	if (asset_get_type("obj_goal") == asset_object)
	and (instance_exists(obj_goal))
	{
		if (distance_to_object(obj_goal) < 1920)
		{
			
			#region /* Touching goal */
			if (x > instance_nearest(x, y, obj_goal).bbox_right)
			and (x < instance_nearest(x, y, obj_goal).bbox_right + 16)
			and (y < instance_nearest(x, y, obj_goal).bbox_bottom)
			and (goal == false)
			and (!collision_line(x, y, instance_nearest(x, y, obj_goal).x, instance_nearest(x, y, obj_goal).y, obj_wall, false, true))
			and (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_goal).x + 1, instance_nearest(x, y, obj_goal).y + 1, obj_wall, false, true))
			or (place_meeting(x, y, obj_goal))
			and (goal == false)
			{
				just_hit_goal = true;
				obj_goal.goal = true;
			}
			#endregion /* Touching goal END */
			
			else
			
			#region /* Can't walk back when touched goal */
			if (x < instance_nearest(x, y, obj_goal).bbox_left + 4)
			and (goal == true)
			{
				x = instance_nearest(x, y, obj_goal).bbox_left + 4;
			}
			#endregion /* Can't walk back when touched goal END */
			
			if (just_hit_goal == true)
			and (goal == false)
			{
				if (!instance_exists(obj_camera.player1))
				{
					global.player1_can_play = false;
				}
				if (!instance_exists(obj_camera.player2))
				{
					global.player2_can_play = false;
				}
				if (!instance_exists(obj_camera.player3))
				{
					global.player3_can_play = false;
				}
				if (!instance_exists(obj_camera.player4))
				{
					global.player4_can_play = false;
				}
				global.goal_active = true;
				global.player_has_entered_goal = true;
				global.quit_level = false;
				global.quit_to_map = false;
				global.quit_to_title = false;
				global.restart_level = false;
				instance_nearest(x, y, obj_goal).image_index = 1;
				invincible_timer = false;
				
				if (instance_nearest(x, y, obj_goal).trigger_ending == true)
				{
					global.trigger_ending = true;
				}
				
				#region /* Stop Music */
				audio_stop_sound(global.music);
				audio_stop_sound(global.music_underwater);
				global.music = noone;
				global.music_underwater = noone;
				music = noone;
				music_underwater = noone;
				#endregion /* Stop Music END */
				
				#region /* Save Checkpoint */
				if (asset_get_type("room_leveleditor") == asset_room)
				and (room == room_leveleditor)
				and (global.character_select_in_this_menu == "main_game")
				{
					global.checkpoint_x = 0;
					global.checkpoint_y = 0;
					global.checkpoint_millisecond = 0;
					global.checkpoint_second = 0;
					global.checkpoint_minute = 0;
					global.checkpoint_realmillisecond = 0;
				
					var uppercase_level_name;
					uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
					uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
					var level_name = string(uppercase_level_name);
				
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					ini_write_real(level_name, "checkpoint_x", 0);
					ini_write_real(level_name, "checkpoint_y", 0);
					ini_write_real(level_name, "checkpoint_millisecond", 0);
					ini_write_real(level_name, "checkpoint_second", 0);
					ini_write_real(level_name, "checkpoint_minute", 0);
					ini_write_real(level_name, "checkpoint_realmillisecond", 0);
					ini_write_real(level_name, "checkpoint_direction", +1);
					ini_close();
				}
				else
				if (asset_get_type("room_leveleditor") == asset_room)
				and (room == room_leveleditor)
				and (global.character_select_in_this_menu == "level_editor")
				{
					global.checkpoint_x = 0;
					global.checkpoint_y = 0;
					global.checkpoint_millisecond = 0;
					global.checkpoint_second = 0;
					global.checkpoint_minute = 0;
					global.checkpoint_realmillisecond = 0;
				
					var uppercase_level_name;
					uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
					uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
					var level_name = string(uppercase_level_name);
				
					ini_open(working_directory + "/save_files/custom_level_save.ini");
					ini_write_real(level_name, "checkpoint_x", 0);
					ini_write_real(level_name, "checkpoint_y", 0);
					ini_write_real(level_name, "checkpoint_millisecond", 0);
					ini_write_real(level_name, "checkpoint_second", 0);
					ini_write_real(level_name, "checkpoint_minute", 0);
					ini_write_real(level_name, "checkpoint_realmillisecond", 0);
					ini_write_real(level_name, "checkpoint_direction", +1);
					ini_close();
				}
				#endregion /* Save Checkpoint END */
				
				scr_audio_play(voice_enter_goal, volume_source.voice);
				
				#region /* Level Clear Melody */
				if (level_clear_melody > noone)
				and (!audio_is_playing(level_clear_melody))
				{
					scr_audio_play(level_clear_melody, volume_source.melody);
				}
				#endregion /* Level Clear Melody END */
				
				goal = true; /* Set goal to true on last line */
			}
		}
	}
	#endregion /* Goal END */
	
}