function scr_set_default_remapping_player4_keyboard()
{
	
	#region /* Player 4 Keyboard Remapping (everything should be set to noone) */
	
	#region /* Player 4 Key 1 defaults */
	global.player4_key_dive = noone;
	global.player4_key_jump = noone;
	global.player4_key_crouch = noone;
	global.player4_key_crouch_toggle = noone;
	global.player4_key_sprint = noone;
	global.player4_key_sprint_toggle = noone;
	global.player4_key_left = noone;
	global.player4_key_right = noone;
	global.player4_key_down = noone;
	global.player4_key_up = noone;
	global.player4_key_tongue = noone;
	global.player4_key_zoom_in = noone;
	global.player4_key_zoom_out = noone;
	global.player4_key_accept = noone;
	global.player4_key_back = noone;
	#endregion /* Player 4 Key 1 defaults END */
	
	#region /* Player 4 Key 2 defaults */
	global.player4_key2_dive = noone;
	global.player4_key2_jump = noone;
	global.player4_key2_crouch = noone;
	global.player4_key2_crouch_toggle = noone;
	global.player4_key2_sprint = noone;
	global.player4_key2_sprint_toggle = noone;
	global.player4_key2_left = noone;
	global.player4_key2_right = noone;
	global.player4_key2_down = noone;
	global.player4_key2_up = noone;
	global.player4_key2_tongue = noone;
	global.player4_key2_zoom_in = noone;
	global.player4_key2_zoom_out = noone;
	global.player4_key2_accept = noone;
	global.player4_key2_back = noone;
	#endregion /* Player 4 Key 2 defaults END */
	
	global.player4_up_is_also_jump = false;
	global.player4_double_tap_to_run = true;
	global.player4_sprint_toggle = false;
	global.player4_double_tap_to_dive = false;
	global.player4_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player4_cancel_dive_by_pressing_opposite_direction = false;
	global.player4_down_and_jump_to_groundpound = false;
	global.player4_wall_jump_setting = 1;
	global.player4_drop_from_rope = 1;
	global.player4_show_controls = 1;
	#endregion /* Player 4 Keyboard Remapping (everything should be set to noone) END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "config.ini");
	ini_write_real("config", "player4_key_dive", global.player4_key_dive);
	ini_write_real("config", "player4_key2_dive", global.player4_key2_dive);
	ini_write_real("config", "player4_key_jump", global.player4_key_jump);
	ini_write_real("config", "player4_key2_jump", global.player4_key2_jump);
	ini_write_real("config", "player4_key_crouch", global.player4_key_crouch);
	ini_write_real("config", "player4_key2_crouch", global.player4_key2_crouch);
	ini_write_real("config", "player4_key_crouch_toggle", global.player4_key_crouch_toggle);
	ini_write_real("config", "player4_key2_crouch_toggle", global.player4_key2_crouch_toggle);
	ini_write_real("config", "player4_key_sprint", global.player4_key_sprint);
	ini_write_real("config", "player4_key2_sprint", global.player4_key2_sprint);
	ini_write_real("config", "player4_key_sprint_toggle", global.player4_key_sprint_toggle);
	ini_write_real("config", "player4_key2_sprint_toggle", global.player4_key2_sprint_toggle);
	ini_write_real("config", "player4_key_left", global.player4_key_left);
	ini_write_real("config", "player4_key2_left", global.player4_key2_left);
	ini_write_real("config", "player4_key_right", global.player4_key_right);
	ini_write_real("config", "player4_key2_right", global.player4_key2_right);
	ini_write_real("config", "player4_key_down", global.player4_key_down);
	ini_write_real("config", "player4_key2_down", global.player4_key2_down);
	ini_write_real("config", "player4_key_up", global.player4_key_up);
	ini_write_real("config", "player4_key2_up", global.player4_key2_up);
	ini_write_real("config", "player4_key_tongue", global.player4_key_tongue);
	ini_write_real("config", "player4_key2_tongue", global.player4_key2_tongue);
	ini_write_real("config", "player4_key_zoom_in", global.player4_key_zoom_in);
	ini_write_real("config", "player4_key2_zoom_in", global.player4_key2_zoom_in);
	ini_write_real("config", "player4_key_zoom_out", global.player4_key_zoom_out);
	ini_write_real("config", "player4_key2_zoom_out", global.player4_key2_zoom_out);
	ini_write_real("config", "player4_key_accept", global.player4_key_accept);
	ini_write_real("config", "player4_key2_accept", global.player4_key2_accept);
	ini_write_real("config", "player4_key_back", global.player4_key_back);
	ini_write_real("config", "player4_key2_back", global.player4_key2_back);
	ini_write_real("config", "player4_up_is_also_jump", global.player4_up_is_also_jump);
	ini_write_real("config", "player4_double_tap_to_run", global.player4_double_tap_to_run);
	ini_write_real("config", "player4_sprint_toggle", global.player4_sprint_toggle);
	ini_write_real("config", "player4_double_tap_to_dive", global.player4_double_tap_to_dive);
	ini_write_real("config", "player4_cancel_dive_by_pressing_jump_or_dive_button", global.player4_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player4_cancel_dive_by_pressing_opposite_direction", global.player4_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player4_down_and_jump_to_groundpound", global.player4_down_and_jump_to_groundpound);
	ini_write_real("config", "player4_wall_jump_setting", global.player4_wall_jump_setting);
	ini_write_real("config", "player4_drop_from_rope", global.player4_drop_from_rope);
	ini_write_real("config", "player4_show_controls", global.player4_show_controls);
	ini_close();
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}