if (global.actually_play_edited_level == false)
{
	with (other)
	{
		
		#region /* All code before initializing the object */
		
		if (delay < 3)
		{
			delay += 1;
		}
		
		if (asset_get_type("obj_leveleditor") == asset_object)
		and (instance_exists(obj_leveleditor))
		and (delay == 3)
		and (variable_instance_exists(obj_leveleditor, "pause"))
		and (obj_leveleditor.pause == false)
		{
			
			#region /* Destroy if erased */
			if (asset_get_type("obj_level_player_1_start") == asset_object)
			and (instance_exists(obj_level_player_1_start))
			and (place_meeting(x, y, obj_level_player_1_start))
			and (asset_get_type("obj_level_player_2_start") == asset_object)
			and (instance_exists(obj_level_player_2_start))
			and (place_meeting(x, y, obj_level_player_2_start))
			and (asset_get_type("obj_level_player_3_start") == asset_object)
			and (instance_exists(obj_level_player_3_start))
			and (place_meeting(x, y, obj_level_player_3_start))
			and (asset_get_type("obj_level_player_4_start") == asset_object)
			and (instance_exists(obj_level_player_4_start))
			and (place_meeting(x, y, obj_level_player_4_start))
			and (obj_leveleditor.drag_object == false)
			and (obj_level_player_1_start.drag_object == false)
			and (obj_level_player_2_start.drag_object == false)
			and (obj_level_player_3_start.drag_object == false)
			and (obj_level_player_4_start.drag_object == false)
			{
				
				#region /* Reset Level Editor Checkpoint */
				if (asset_get_type("room_leveleditor") == asset_room)
				and (room == room_leveleditor)
				and (global.character_select_in_this_menu == "level_editor")
				{
					ini_open(working_directory + "/save_files/custom_level_save.ini");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_x");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_y");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_millisecond");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_second");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_minute");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_realmillisecond");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_direction");
					ini_close();			
				}
				#endregion /* Reset Level Editor Checkpoint END */
				
				instance_destroy();
			}
			#endregion /* Destroy if erased END */
			
		}
		
		if (mouse_check_button_released(mb_left))
		or (instance_exists(obj_leveleditor))
		and (obj_leveleditor.key_a_released)
		{
			placed_for_the_first_time = false;
		}

		#endregion /* All code before initializing the object */
		
	}
}