var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

key_a = (gamepad_button_check(global.player1_slot, global.player1_gamepad_button_accept))
or (keyboard_check(global.player1_key_jump));
key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
or (keyboard_check_pressed(global.player1_key_jump));
key_a_released = (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept))
or (keyboard_check_released(global.player1_key_jump));
key_b = (gamepad_button_check(global.player1_slot, global.player1_gamepad_button_back))
or (keyboard_check(global.player1_key_sprint));

if (global.play_edited_level == true)
{
	visible = false;
}

#region /* Push yourself out of other level start objects way */
if (asset_get_type("obj_level_player_1_start") == asset_object)
and (instance_exists(obj_level_player_1_start))
and (place_meeting(x, y, obj_level_player_1_start))
and (obj_level_player_1_start.drag_object == false)
{
	x -= 32;
}
#endregion /* Push yourself out of other level start objects way END */

#region /* Drag Object */
if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (obj_leveleditor.pause == false)
{
	if (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	{
		if (mouse_check_button_pressed(mb_left))
		or (key_a_pressed)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				if (drag_object < true)
				{
					drag_object = true;
					obj_leveleditor.drag_object = true;
				}
			}
		}
	}
	
	#region /* Drag the object */
	if (drag_object == true)
	{
		x = obj_leveleditor.x;
		y = obj_leveleditor.y;
	}
	#endregion /* Drag the object END */
	
	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	or (key_a_released)
	{
		if (drag_object == true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
}
#endregion /* Release the object END */

#endregion /* Drag Object END */

if (drag_release_timer > 0)
{
	drag_release_timer -= 1;
}
else
{
	if (drag_object == 0.5)
	{
		drag_object = false;
		move_snap(32, 32);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (x < 0 + sprite_width - 32)
{
	x = 0 + sprite_width - 32
}
if (x > room_width)
{
	x = room_width;
}
if (y < 64)
{
	y = 64
}
if (y > room_height)
{
	y = room_height;
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

if (global.play_edited_level == true)
or (global.actually_play_edited_level == true)
{
	if (global.actually_play_edited_level == true)
	{
		view_xview = x - view_wview * 0.5;
		view_yview = y - view_hview * 0.5;
		if (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera))
		{
			
			#region /* Load Custom Level Checkpoint */
			if (file_exists(working_directory + "/save_files/file" + string(global.file) + ".ini"))
			and (global.character_select_in_this_menu == "main_game")
			or (file_exists(working_directory + "/custom_level_save.ini"))
			and (global.character_select_in_this_menu == "level_editor")
			{
				if (global.character_select_in_this_menu == "main_game")
				{
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_x"))
					{
						global.checkpoint_x = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_x", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_y"))
					{
						global.checkpoint_y = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_y", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_millisecond"))
					{
						global.checkpoint_millisecond = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_millisecond", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_second"))
					{
						global.checkpoint_second = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_second", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_minute"))
					{
						global.checkpoint_minute = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_minute", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_realmillisecond"))
					{
						global.checkpoint_realmillisecond = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
					}
					ini_close();
				}
				else
				if (global.character_select_in_this_menu == "level_editor")
				{
					ini_open(working_directory + "/custom_level_save.ini");
					if (ini_key_exists(string(global.level_name), "checkpoint_x"))
					{
						global.checkpoint_x = ini_read_real(string(global.level_name), "checkpoint_x", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_y"))
					{
						global.checkpoint_y = ini_read_real(string(global.level_name), "checkpoint_y", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_millisecond"))
					{
						global.checkpoint_millisecond = ini_read_real(string(global.level_name), "checkpoint_millisecond", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_second"))
					{
						global.checkpoint_second = ini_read_real(string(global.level_name), "checkpoint_second", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_minute"))
					{
						global.checkpoint_minute = ini_read_real(string(global.level_name), "checkpoint_minute", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_realmillisecond"))
					{
						global.checkpoint_realmillisecond = ini_read_real(string(global.level_name), "checkpoint_realmillisecond", 0);
					}
					ini_close();
				}
				
				if (global.checkpoint_x > 0)
				or (global.checkpoint_y > 0)
				{
					camera_set_view_pos(view_camera[view_current], global.checkpoint_x, global.checkpoint_y); /* Set camera position to be on the last used checkpoint position */
					instance_activate_object(obj_camera);
					instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_camera);
				}
			}
			#endregion /* Load Checkpoint END */
			
		}
	}
	
	#region /* Destroy the level player 2 start if player 2 has spawned in the level */
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	//and (obj_camera.player2 >= 0)
	{
		instance_destroy();
	}
	#endregion /* Destroy the level player 2 start if player 2 has spawned in the level END */
	
}