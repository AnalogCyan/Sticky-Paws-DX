if (bounce_up == false)
{
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		image_index = obj_camera.image_index;
	}
}
if (bounce_up == false)
and (instance_exists(obj_player))
{
	if (place_meeting(bbox_left, y, obj_player))
	or (place_meeting(bbox_right, y, obj_player))
	or (place_meeting(x, bbox_top, obj_player))
	or (place_meeting(x, bbox_bottom, obj_player))
	{
		if (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_semisolid_platform, false, true))
		{
			follow_player = true;
		}
	}
}
if (follow_player == true)
and (asset_get_type("obj_wall") == asset_object)
and (place_meeting(x, y + 16, obj_wall))
or (follow_player == true)
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (place_meeting(x, y + 16, obj_semisolid_platform))
or (follow_player == true)
and (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).horizontal_rope_climb == true)
or (follow_player == true)
and (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).climb == true)
or (follow_player == true)
and (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).midair_jumps_left >= instance_nearest(x, y, obj_player).number_of_jumps)
or (asset_get_type("obj_enemy_bowlingball") == asset_object)
and (place_meeting(x, bbox_bottom, obj_enemy_bowlingball))
and (instance_nearest(x, y, obj_enemy_bowlingball).flat == true)
and (instance_nearest(x, y, obj_enemy_bowlingball).die = false)
and (instance_nearest(x, y, obj_enemy_bowlingball).die_volting = false)
{
	effect_create_above(ef_ring, x, y, 2, c_white);
	
	#region /* 3 Basic Collectibles */
	if (asset_get_type("obj_basic_collectible") == asset_object)
	{
		with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
		{
			image_speed = 1;
			motion_set(90, 10);
			bounce_up = true;
		}
		with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
		{
			image_speed = 1;
			motion_set(90, 10);
			bounce_up = true;
			delay_time = 10;
		}
		with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
		{
			image_speed = 1;
			motion_set(90, 10);
			bounce_up = true;
			delay_time = 20;
		}
	}
	#endregion /* 3 Basic Collectibles END */
	
	#region /* 1000 Score */
	score += 1000;
	if (asset_get_type("obj_score_up") == asset_object)
	{
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			score_up = 1000;
		}
	}
	#endregion /* 1000 Score END */
	
	#region /* What Big Collectible is this? */
	if (big_collectible == 1)
	{
		global.big_collectible1 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				big_collectible1_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible1", true);
			ini_close();
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible1", true);
			ini_close();
		}
	}
	if (big_collectible == 2)
	{
		global.big_collectible2 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				big_collectible2_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible2", true);
			ini_close();
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible2", true);
			ini_close();
		}
	}
	if (big_collectible == 3)
	{
		global.big_collectible3 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				big_collectible3_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible3", true);
			ini_close();
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible3", true);
			ini_close();
		}
	}
	if (big_collectible == 4)
	{
		global.big_collectible4 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				big_collectible4_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible4", true);
			ini_close();
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible4", true);
			ini_close();
		}
	}
	if (big_collectible >= 5)
	{
		global.big_collectible5 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				big_collectible5_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible5", true);
			ini_close();
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var uppercase_level_name;
			uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
			uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
			var level_name = string(uppercase_level_name);
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible5", true);
			ini_close();
		}
	}
	#endregion /* What Big Collectible is this? END */
	
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	instance_create_depth(xstart, ystart, 0, obj_big_collectible_outline);
	instance_destroy();
}

#region /* Follow Player */
if (follow_player == true)
{
	if (instance_exists(obj_player))
	and (distance_to_object(obj_player) < sprite_height + sprite_width)
	{
		
		#region /* Show Big Collectible HUD */
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_big_collectibles_timer = global.hud_hide_time * 60;
			}
		}
		#endregion /* Show Big Collectible HUD END */
		
		x = lerp(x, instance_nearest(x, y, obj_player).x, 0.5);
		y = lerp(y, instance_nearest(x, y, obj_player).y, 0.5);
	}
	else
	{
		x = lerp(x, xstart, 0.5);
		y = lerp(y, ystart, 0.5);
		if (x = xstart)
		and (y = ystart)
		{
			follow_player = false;
		}
	}
}
#endregion /* Follow Player END */

if (bounce_up == true)
{
	
	#region /* Show Big Collectible HUD */
	if (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		}
	}
	#endregion /* Show Big Collectible HUD END */
	
	if (delay >= delay_time)
	{
		if (coinsound = false)
		{
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			coinsound = true;
		}
		visible = true;
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		if (vspeed > 0)
		and (y > ystart - 32)
		{
			
			#region /* 3 Basic Collectibles */
			if (asset_get_type("obj_basic_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					bounce_up = true;
				}
				with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					bounce_up = true;
					delay_time = 10;
				}
				with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					bounce_up = true;
					delay_time = 20;
				}
			}
			#endregion /* 3 Basic Collectibles END */
			
			#region /* 1000 Score */
			score += 1000;
			if (asset_get_type("obj_score_up") == asset_object)
			{
				with(instance_create_depth(x, y, 0, obj_score_up))
				{
					score_up = 1000;
				}
			}
			#endregion /* 1000 Score END */
			
			#region /* What Big Collectible is this? */
			if (big_collectible == 1)
			{
				global.big_collectible1 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						big_collectible1_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible1", true);
						ini_close();
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible1", true);
						ini_close();
					}
				}
			}
			if (big_collectible == 2)
			{
				global.big_collectible2 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						big_collectible2_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible2", true);
						ini_close();
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible2", true);
						ini_close();
					}
				}
			}
			if (big_collectible == 3)
			{
				global.big_collectible3 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						big_collectible3_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible3", true);
						ini_close();
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible3", true);
						ini_close();
					}
				}
			}
			if (big_collectible == 4)
			{
				global.big_collectible4 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						big_collectible4_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible4", true);
						ini_close();
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible4", true);
						ini_close();
					}
				}
			}
			if (big_collectible == 5)
			{
				global.big_collectible5 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						big_collectible5_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible5", true);
						ini_close();
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var uppercase_level_name;
						uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
						uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
						var level_name = string(uppercase_level_name);
						
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible5", true);
						ini_close();
					}
				}
			}
			#endregion /* What Big Collectible is this? END */
			
			effect_create_above(ef_ring, x, y, 2, c_white);
			instance_create_depth(xstart, ystart, 0, obj_big_collectible_outline);
			instance_destroy();
		}
	}
	else
	{
		delay += 1;
		visible = false;
		y = ystart;
	}
	
	#region /* Don't go outside view boundary */
	if (x < camera_get_view_x(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + 32;
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32;
	}
	#endregion /* Don't go outside view boundary END */
	
}

#region /* If big collectible value is 0 or lower, set it to 1 */
if (big_collectible <= 0)
{
	big_collectible = 1;
}
#endregion /* If big collectible value is 0 or lower, set it to 1 END */

#region /* Expanding Ring Effect */
effect_time += 1;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */