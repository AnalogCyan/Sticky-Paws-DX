function scr_save_custom_world()
{
	
	#region /* Save Custom World */
	if (global.character_select_in_this_menu == "level_editor")
	{
	
		#region /* Create directory for saving custom worlds */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_worlds/" + string(ds_list_find_value(global.all_loaded_custom_worlds, global.select_level_index))))
		{
			directory_create(working_directory + "/custom_worlds/" + string(ds_list_find_value(global.all_loaded_custom_worlds, global.select_level_index)));
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_worlds/" + string(global.level_name)))
		{
			directory_create(working_directory + "/custom_worlds/" + string(global.level_name));
		}
		#endregion /* Create directory for saving custom levels END */
	
		#region /* Save object placement */
		instance_activate_all();
		var file, str;
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		{
			file = file_text_open_write(working_directory + "/custom_worlds/" + string(ds_list_find_value(global.all_loaded_custom_worlds, global.select_level_index)) + "/data/object_placement.txt"); /* Open file for writing */
		}
		else
		if (global.level_name != "")
		{
			file = file_text_open_write(working_directory + "/custom_worlds/" + string(global.level_name) + "/data/object_placement.txt"); /* Open file for writing */
		}
		str = ""; /* Reset string var */
		
		#region /* Write all objects to file */
		with(obj_leveleditor_placed_object)
		{
			str+= string(x) + "|" + string(y) + "|" + string(object) + "|";
		}
		#endregion /* Write all objects to file END */
		
		file_text_write_string(file, str); /* Write string with wall information to file and start a new line */
		file_text_close(file);
		
		#endregion /* Save object placement END */
		
		scr_save_objects_with_rotation_placement();
		
		#region /* Save World Information */
		if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
		{
			if (global.select_level_index >= 1)
			and (global.create_level_from_template == false)
			{
				ini_open(working_directory + "/custom_worlds/" + string(ds_list_find_value(global.all_loaded_custom_worlds, global.select_level_index)) + "/data/level_information.ini");
			}
			else
			if (global.level_name != "")
			{
				ini_open(working_directory + "/custom_worlds/" + string(global.level_name) + "/data/level_information.ini");
			}
			if (instance_exists(obj_level_player_1_start))
			{
				ini_write_real("info", "level_player_1_start_x", obj_level_player_1_start.x);
			}
			if (instance_exists(obj_level_player_1_start))
			{
				ini_write_real("info", "level_player_1_start_y", obj_level_player_1_start.y);
			}
			if (instance_exists(obj_level_height))
			{
				ini_write_real("info", "level_height", obj_level_height.y);
			}
			if (instance_exists(obj_level_width))
			{
				ini_write_real("info", "level_width", obj_level_width.x);
			}
			ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
			ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
			ini_close();
		}
		#endregion /* Save World Information END */
	
	}

	#endregion /* Save Custom World END */
}
