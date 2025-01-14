scr_set_screen_size();
scr_set_controls_used_to_navigate();
scr_zoom_camera_controls();
scr_toggle_fullscreen();
scr_deactivate_objects_outside_view();

if (menu_delay > 0)
{
	menu_delay -= 1;
}

if (keyboard_check_pressed(vk_rcontrol))
{
	draw_flush();
	draw_texture_flush();
}

#region /* Make background visible */
if (room == room_leveleditor)
{
	if (global.custom_background1 > noone)
	and (global.enable_background_layer1 == true)
	and (global.full_level_map_screenshot == false)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
	}
	
	if (global.custom_background2 > noone)
	and (global.enable_background_layer2 == true)
	and (global.full_level_map_screenshot == false)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
	}
	
	if (global.custom_background3 > noone)
	and (global.enable_background_layer3 == true)
	and (global.full_level_map_screenshot == false)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
	}
	
	if (global.custom_background4 > noone)
	and (global.enable_background_layer4 == true)
	and (global.full_level_map_screenshot == false)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
	}
}
#endregion /* Make background visible END */

#region /* Timer Countup */
if (asset_get_type("obj_goal") == asset_object)
and (instance_exists(obj_goal))
and (obj_goal.goal == false)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.allow_timeattack == true)
and (global.pause == false)
{
	if (instance_exists(obj_player))
	{
		global.timeattack_millisecond += 1;
	}

	global.timeattack_realmillisecond += 1;
	if (global.timeattack_millisecond > 60)
	{
		global.timeattack_millisecond = 0;
		global.timeattack_second += 1;
	}
	if (global.timeattack_second > 59)
	{
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute += 1;
	}
}
else
if (asset_get_type("obj_goal") == asset_object)
and (global.pause == false)
{
	if (instance_exists(obj_goal))
	and (obj_goal.goal == false)
	or (!instance_exists(obj_goal))
	{
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (obj_player.allow_timeattack == true)
		{
			if (instance_exists(obj_player))
			{
				global.timeattack_millisecond += 1;
			}
			global.timeattack_realmillisecond += 1;
			if (global.timeattack_millisecond > 60)
			{
				global.timeattack_millisecond = 0;
				global.timeattack_second += 1;
			}
			if (global.timeattack_second > 59)
			{
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute += 1;
			}
		}
	}
}
#endregion /* Timer Countup */

#region /* Time Countdown */
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (global.pause == false)
and (asset_get_type("obj_goal") == asset_object)
{
	if (instance_exists(obj_goal))
	and (obj_goal.goal == false)
	or (!instance_exists(obj_goal))
	{
		time_second += 1;
		if (time_second > room_speed)
		{
			time_second = 0;
			global.time_countdown_bonus -= 1;
			if (obj_player.allow_timeup == true)
			and (global.enable_time_countdown == true)
			{
				global.time_countdown -= 1;
			}
		}
	}
}
#endregion /* Time Countdown END */

room_speed = global.max_fps; /* Room Speed is max fps */
global.spikes_emerge_time += 1;
if (global.spikes_emerge_time >= room_speed * 4)
{
	global.spikes_emerge_time = 0;
}

#region /* Stop the screen from scrolling left if scrolling left isn't allowed */
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.stop_screen_from_scrolling_left == true)
{
	if (x > scrolling_left)
	{
		scrolling_left = x;
	}
	if (x < scrolling_left)
	{
		x = scrolling_left;
	}
}
#endregion /* Stop the screen from scrolling left if scrolling left isn't allowed END */

#region /* Rain Effect */
if (global.rain == true)
{
	if (floor(random(10 - 1)) == 0)
	{
		effect_create_above(ef_rain, x, y, 2, c_white);
	}
}
#endregion /* Rain Effect END */

#region /* Multiplayer - Has pressed keys */

#region /* Player 1 Show Controls HUD timer */
if (player1 >= 1)
and (can_spawn_player1 == true)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player1))
and (iris_xscale >= 10)
{
	if (global.player1_show_controls == 0)
	or (obj_player.can_move == false)
	{
		player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player1_show_controls >= 1)
	and (global.player1_show_controls <= 9)
	{
		if (player1_show_controls_timer >= 1)
		{
			player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
			player1_show_controls_timer -= 1;
		}
		if (player1_show_controls_timer <= 0)
		and (player1.speed == 0)
		{
			player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player1_show_controls == 10)
	{
		player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player1_key_up))
	or (keyboard_check(global.player1_key2_up))
	or (gamepad_button_check(global.player1_slot, gp_padu))
	or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
	or (keyboard_check(global.player1_key_left))
	or (keyboard_check(global.player1_key2_left))
	or (gamepad_button_check(global.player1_slot, gp_padl))
	or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
	or (keyboard_check(global.player1_key_right))
	or (keyboard_check(global.player1_key2_right))
	or (gamepad_button_check(global.player1_slot, gp_padr))
	or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
	or (keyboard_check(global.player1_key_down))
	or (keyboard_check(global.player1_key2_down))
	or (gamepad_button_check(global.player1_slot, gp_padd))
	or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
	or (gamepad_button_check(global.player1_slot, global.player1_gamepad_button_accept))
	or (gamepad_button_check(global.player1_slot, global.player1_gamepad_button_back))
	or (keyboard_check(global.player1_key_jump))
	or (keyboard_check(global.player1_key2_jump))
	or (gamepad_button_check(global.player1_slot, gp_face3))
	or (gamepad_button_check(global.player1_slot, gp_face4))
	or (keyboard_check(global.player1_key_sprint))
	or (keyboard_check(global.player1_key2_sprint))
	
	or (keyboard_check(global.player1_key_sprint_toggle))
	or (keyboard_check(global.player1_key2_sprint_toggle))
	or (keyboard_check(global.player1_key_crouch))
	or (keyboard_check(global.player1_key2_crouch))
	or (keyboard_check(global.player1_key_crouch_toggle))
	or (keyboard_check(global.player1_key2_crouch_toggle))
	or (keyboard_check(global.player1_key_dive))
	or (keyboard_check(global.player1_key2_dive))
	or (keyboard_check(global.player1_key_tongue))
	or (keyboard_check(global.player1_key2_tongue))
	{
		player1_show_controls_timer = room_speed * global.player1_show_controls;
	}
}
else
{
	player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
	player1_show_controls_timer = room_speed * global.player1_show_controls;
}
#endregion /* Player 1 Show Controls HUD timer */

#region /* Player 2 Show Controls HUD timer */
if (player2 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player2))
and (iris_xscale >= 10)
{
	if (global.player2_show_controls == 0)
	or (obj_player.can_move = false)
	{
		player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player2_show_controls >= 1)
	and (global.player2_show_controls <= 9)
	{
		if (player2_show_controls_timer >= 1)
		{
			player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
			player2_show_controls_timer -= 1;
		}
		if (player2_show_controls_timer <= 0)
		and (player2.speed == 0)
		{
			player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player2_show_controls = 10)
	{
		player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player2_key_up))
	or (keyboard_check(global.player2_key2_up))
	or (gamepad_button_check(global.player2_slot, gp_padu))
	or (gamepad_axis_value(global.player2_slot, gp_axislv) < 0)
	or (keyboard_check(global.player2_key_left))
	or (keyboard_check(global.player2_key2_left))
	or (gamepad_button_check(global.player2_slot, gp_padl))
	or (gamepad_axis_value(global.player2_slot, gp_axislh) < 0)
	or (keyboard_check(global.player2_key_right))
	or (keyboard_check(global.player2_key2_right))
	or (gamepad_button_check(global.player2_slot, gp_padr))
	or (gamepad_axis_value(global.player2_slot, gp_axislh) > 0)
	or (keyboard_check(global.player2_key_down))
	or (keyboard_check(global.player2_key2_down))
	or (gamepad_button_check(global.player2_slot, gp_padd))
	or (gamepad_axis_value(global.player2_slot, gp_axislv) > 0)
	or (gamepad_button_check(global.player2_slot, global.player2_gamepad_button_accept))
	or (gamepad_button_check(global.player2_slot, global.player2_gamepad_button_back))
	or (keyboard_check(global.player2_key_jump))
	or (keyboard_check(global.player2_key2_jump))
	or (gamepad_button_check(global.player2_slot, gp_face3))
	or (gamepad_button_check(global.player2_slot, gp_face4))
	or (keyboard_check(global.player2_key_sprint))
	or (keyboard_check(global.player2_key2_sprint))
	
	or (keyboard_check(global.player2_key_sprint_toggle))
	or (keyboard_check(global.player2_key2_sprint_toggle))
	or (keyboard_check(global.player2_key_crouch))
	or (keyboard_check(global.player2_key2_crouch))
	or (keyboard_check(global.player2_key_crouch_toggle))
	or (keyboard_check(global.player2_key2_crouch_toggle))
	or (keyboard_check(global.player2_key_dive))
	or (keyboard_check(global.player2_key2_dive))
	or (keyboard_check(global.player2_key_tongue))
	or (keyboard_check(global.player2_key2_tongue))
	{
		player2_show_controls_timer = room_speed * global.player2_show_controls;
	}
}
else
{
	player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
	player2_show_controls_timer = room_speed * global.player2_show_controls;
}
#endregion /* Player 2 Show Controls HUD timer */

#region /* Player 3 Show Controls HUD timer */
if (player3 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player3))
and (iris_xscale >= 10)
{
	if (global.player3_show_controls == 0)
	or (obj_player.can_move = false)
	{
		player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player3_show_controls >= 1)
	and (global.player3_show_controls <= 9)
	{
		if (player3_show_controls_timer >= 1)
		{
			player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
			player3_show_controls_timer -= 1;
		}
		if (player3_show_controls_timer <= 0)
		and (player3.speed == 0)
		{
			player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player3_show_controls = 10)
	{
		player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.2);
	}

	if (keyboard_check(global.player3_key_up))
	or (keyboard_check(global.player3_key2_up))
	or (gamepad_button_check(global.player3_slot, gp_padu))
	or (gamepad_axis_value(global.player3_slot, gp_axislv) < 0)
	or (keyboard_check(global.player3_key_left))
	or (keyboard_check(global.player3_key2_left))
	or (gamepad_button_check(global.player3_slot, gp_padl))
	or (gamepad_axis_value(global.player3_slot, gp_axislh) < 0)
	or (keyboard_check(global.player3_key_right))
	or (keyboard_check(global.player3_key2_right))
	or (gamepad_button_check(global.player3_slot, gp_padr))
	or (gamepad_axis_value(global.player3_slot, gp_axislh) > 0)
	or (keyboard_check(global.player3_key_down))
	or (keyboard_check(global.player3_key2_down))
	or (gamepad_button_check(global.player3_slot, gp_padd))
	or (gamepad_axis_value(global.player3_slot, gp_axislv) > 0)
	or (gamepad_button_check(global.player3_slot, global.player3_gamepad_button_accept))
	or (gamepad_button_check(global.player3_slot, global.player2_gamepad_button_back))
	or (keyboard_check(global.player3_key_jump))
	or (keyboard_check(global.player3_key2_jump))
	or (gamepad_button_check(global.player3_slot, gp_face3))
	or (gamepad_button_check(global.player3_slot, gp_face4))
	or (keyboard_check(global.player3_key_sprint))
	or (keyboard_check(global.player3_key2_sprint))
	
	or (keyboard_check(global.player3_key_sprint_toggle))
	or (keyboard_check(global.player3_key2_sprint_toggle))
	or (keyboard_check(global.player3_key_crouch))
	or (keyboard_check(global.player3_key2_crouch))
	or (keyboard_check(global.player3_key_crouch_toggle))
	or (keyboard_check(global.player3_key2_crouch_toggle))
	or (keyboard_check(global.player3_key_dive))
	or (keyboard_check(global.player3_key2_dive))
	or (keyboard_check(global.player3_key_tongue))
	or (keyboard_check(global.player3_key2_tongue))
	{
		player3_show_controls_timer = room_speed * global.player3_show_controls;
	}
}
else
{
	player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
	player3_show_controls_timer = room_speed * global.player3_show_controls;
}
#endregion /* Player 3 Show Controls HUD timer */

#region /* Player 4 Show Controls HUD timer */
if (player4 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player4))
and (iris_xscale >= 10)
{
	if (global.player4_show_controls == 0)
	or (obj_player.can_move = false)
	{
		player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player4_show_controls >= 1)
	and (global.player4_show_controls <= 9)
	{
		if (player4_show_controls_timer >= 1)
		{
			player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
			player4_show_controls_timer -= 1;
		}
		if (player4_show_controls_timer <= 0)
		and (player4.speed == 0)
		{
			player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player4_show_controls = 10)
	{
		player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player4_key_up))
	or (keyboard_check(global.player4_key2_up))
	or (gamepad_button_check(global.player4_slot, gp_padu))
	or (gamepad_axis_value(global.player4_slot, gp_axislv) < 0)
	or (keyboard_check(global.player4_key_left))
	or (keyboard_check(global.player4_key2_left))
	or (gamepad_button_check(global.player4_slot, gp_padl))
	or (gamepad_axis_value(global.player4_slot, gp_axislh) < 0)
	or (keyboard_check(global.player4_key_right))
	or (keyboard_check(global.player4_key2_right))
	or (gamepad_button_check(global.player4_slot, gp_padr))
	or (gamepad_axis_value(global.player4_slot, gp_axislh) > 0)
	or (keyboard_check(global.player4_key_down))
	or (keyboard_check(global.player4_key2_down))
	or (gamepad_button_check(global.player4_slot, gp_padd))
	or (gamepad_axis_value(global.player4_slot, gp_axislv) > 0)
	or (gamepad_button_check(global.player4_slot, global.player4_gamepad_button_accept))
	or (gamepad_button_check(global.player4_slot, global.player2_gamepad_button_back))
	or (keyboard_check(global.player4_key_jump))
	or (keyboard_check(global.player4_key2_jump))
	or (gamepad_button_check(global.player4_slot, gp_face3))
	or (gamepad_button_check(global.player4_slot, gp_face4))
	or (keyboard_check(global.player4_key_sprint))
	or (keyboard_check(global.player4_key2_sprint))
	
	or (keyboard_check(global.player4_key_sprint_toggle))
	or (keyboard_check(global.player4_key2_sprint_toggle))
	or (keyboard_check(global.player4_key_crouch))
	or (keyboard_check(global.player4_key2_crouch))
	or (keyboard_check(global.player4_key_crouch_toggle))
	or (keyboard_check(global.player4_key2_crouch_toggle))
	or (keyboard_check(global.player4_key_dive))
	or (keyboard_check(global.player4_key2_dive))
	or (keyboard_check(global.player4_key_tongue))
	or (keyboard_check(global.player4_key2_tongue))
	{
		player4_show_controls_timer = room_speed * global.player4_show_controls;
	}
}
else
{
	player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
	player4_show_controls_timer = room_speed * global.player4_show_controls;
}
#endregion /* Player 4 Show Controls HUD timer */

#endregion /* Multiplayer - Has pressed keys END */

#region /* Arcade Credit Increase */
if (mouse_wheel_up())
{
	global.arcade_credit += 1;
}
#endregion /* Arcade Credit Increase END */

#region /* Stop gamepad vibration for different players */

#region /* Stop gamepad vibration for player 1 */
if (player1_vibration_active = false)
{
	player1_motor_speed = lerp(player1_motor_speed, 0, 0.1);
}
gamepad_set_vibration(0, player1_motor_speed, player1_motor_speed);
#endregion /* Stop gamepad vibration for player 1 END */

#region /* Stop gamepad vibration for player 2 */
if (player2_vibration_active = false)
{
	player2_motor_speed = lerp(player2_motor_speed, 0, 0.1);
}
gamepad_set_vibration(1, player2_motor_speed, player2_motor_speed);
#endregion /* Stop gamepad vibration for player 2 END */

#region /* Stop gamepad vibration for player 3 */
if (player3_vibration_active = false)
{
	player3_motor_speed = lerp(player3_motor_speed, 0, 0.1);
}
gamepad_set_vibration(2, player3_motor_speed, player3_motor_speed);
#endregion /* Stop gamepad vibration for player 3 END */

#region /* Stop gamepad vibration for player 4 */
if (player4_vibration_active = false)
{
	player4_motor_speed = lerp(player4_motor_speed, 0, 0.1);
}
gamepad_set_vibration(3, player4_motor_speed, player4_motor_speed);
#endregion /* Stop gamepad vibration for player 4 END */

#endregion /* Stop gamepad vibration for different players END */

#region /* Make sure the lives counter never goes below 0 */
if (lives < 0)
{
	lives = 0;
}
#endregion /* Make sure the lives counter never goes below 0 END */

#region /* Spawn Players in multiplayer */
if (instance_exists(obj_player))
and (global.pause == false)
and (global.goal_active = false)
{
	if (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
	or (keyboard_check_pressed(global.player1_key_jump))
	or (keyboard_check_pressed(global.player1_key2_jump))
	{
		if (player1 <= 0)
		and (can_spawn_player1 == true)
		and (lives > 0)
		{
			if (global.player1_can_play == false)
			{
				global.player1_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player1 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
				with(player1)
				{
					custom_character = global.character_for_player_1;
					selected_voice_pack = global.voicepack_for_player_1;
					selected_skin = global.skin_for_player_1;
					player = 1;
				}
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept))
	or (keyboard_check_pressed(global.player2_key_jump))
	or (keyboard_check_pressed(global.player2_key2_jump))
	{
		if (player2 <= 0)
		and (can_spawn_player2 == true)
		and (lives > 0)
		{
			if (global.player2_can_play == false)
			{
				global.player2_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player2 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player2)
				{
					custom_character = global.character_for_player_2;
					selected_voice_pack = global.voicepack_for_player_2;
					selected_skin = global.skin_for_player_2;
					player = 2;
				}
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept))
	or (keyboard_check_pressed(global.player3_key_jump))
	or (keyboard_check_pressed(global.player3_key2_jump))
	{
		if (player3 <= 0)
		and (can_spawn_player3 == true)
		and (lives > 0)
		{
			if (global.player3_can_play == false)
			{
				global.player3_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player3 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player3)
				{
					custom_character = global.character_for_player_3;
					selected_voice_pack = global.voicepack_for_player_3;
					selected_skin = global.skin_for_player_3;
					player = 3;
				}
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept))
	or (keyboard_check_pressed(global.player4_key_jump))
	or (keyboard_check_pressed(global.player4_key2_jump))
	{
		if (player4 <= 0)
		and (can_spawn_player4 == true)
		and (lives > 0)
		{
			if (global.player4_can_play == false)
			{
				global.player4_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player4 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player4)
				{
					custom_character = global.character_for_player_4;
					selected_voice_pack = global.voicepack_for_player_4;
					selected_skin = global.skin_for_player_4;
					player = 4;
				}
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
}
#endregion /* Spawn Players in multiplayer END */

if (save_level_as_png = false)
{
	if (shake > 0)
	{
		x = x + random_range(-shake, + shake);
		y = y + random_range(-shake, + shake);
		shake = lerp(shake, 0, 0.1);
	}
	
	x = lerp(x, xx, 0.1);
	y = lerp(y, yy, 0.15);
	
	#region /* Boss Battle Camera */
	if (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_boss") == asset_object)
	and (instance_exists(obj_player))
	and (instance_exists(obj_boss))
	and (distance_to_object(obj_boss) < 500)
	{
		
		view_wview_lerp = lerp(0, 0, 0.05);
		view_hview_lerp = lerp(0, 0, 0.05);
		
		if (player1 > 0)
		and (instance_exists(player1))
		{
			if (player1.partner_character = false)
			{
				xx = mean(player1.x, obj_boss.x);
				yy = mean(player1.y, obj_boss.y);
			}
		}
		else
		if (player2 > 0)
		and (instance_exists(player2))
		{
			if (player2.partner_character = false)
			{
				xx = mean(player2.x, obj_boss.x);
				yy = mean(player2.y, obj_boss.y);
			}
		}
		else
		if (player3 > 0)
		and (instance_exists(player3))
		{
			if (player3.partner_character = false)
			{
				xx = mean(player3.x, obj_boss.x);
				yy = mean(player3.y, obj_boss.y);
			}
		}
		else
		if (player4 > 0)
		and (instance_exists(player4))
		{
			if (player4.partner_character = false)
			{
				xx = mean(player4.x, obj_boss.x);
				yy = mean(player4.y, obj_boss.y);
			}
		}
	}
	#endregion /* Boss Battle Camera END */
	
	else
	
	#region /* MULTIPLAYER CAMERA */
	if (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_camera") == asset_object)
	and (instance_number(obj_player) >= 1)
	{
		
		#region /* Camera should follow multiple players */
		
		/* 1, 2, 3, 4 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player1.x, player2.x, player3.x, player4.x);
			yy = mean(player1.y, player2.y, player3.y, player4.y);
		}
		
		else
		
		/* 1, 2, 3 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			xx = mean(player1.x, player2.x, player3.x);
			yy = mean(player1.y, player2.y, player3.y);
		}
		
		else
		
		/* 1, 2 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		{
			xx = mean(player1.x, player2.x);
			yy = mean(player1.y, player2.y);
		}
		
		else
		
		/* 1, 3 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			xx = mean(player1.x, player3.x);
			yy = mean(player1.y, player3.y);
		}
		
		else
		
		/* 1, 4 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player1.x, player4.x);
			yy = mean(player1.y, player4.y);
		}
		
		else
		
		/* 2, 3 */
		if (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			xx = mean(player2.x, player3.x);
			yy = mean(player2.y, player3.y);
		}
		
		else
		
		/* 2, 4 */
		if (player1 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player2.x, player4.x);
			yy = mean(player2.y, player4.y);
		}
		
		else
		
		/* 3, 4 */
		if (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player3.x, player4.x);
			yy = mean(player3.y, player4.y);
		}
		#endregion /* Camera should follow multiple players END */
		
		else
		
		#region /* Follow one player. In case something goes wrong, camera will always follow one player */
		/* 1 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player1.x + player1.hspeed * 15;
			if (player1.on_ground == true)
			and (player1.vspeed >= 0)
			{
				yy = player1.y
			}
			else
			if (player1.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player1.vspeed);
			}
			if (player1.wall_jump == true)
			or (player1.climb == true)
			{
				yy = player1.y
			}
			if (player1.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player1.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player1.in_water == true)
			or (player1.stick_to_wall == true)
			or (player1.spring == true)
			or (player1.climb == true)
			or (player1.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player1.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
					{
						yy = player1.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 2 */
		if (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player2.x + player2.hspeed * 15;
			if (player2.on_ground == true)
			and (player2.vspeed >= 0)
			{
				yy = player2.y
			}
			else
			if (player2.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player2.vspeed);
			}
			if (player2.wall_jump == true)
			or (player2.climb == true)
			{
				yy = player2.y
			}
			if (player2.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player2.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player2.in_water == true)
			or (player2.stick_to_wall == true)
			or (player2.spring == true)
			or (player2.climb == true)
			or (player2.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player2.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
					{
						yy = player2.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 3 */
		if (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player3.x + player3.hspeed * 15;
			if (player3.on_ground == true)
			and (player3.vspeed >= 0)
			{
				yy = player3.y
			}
			else
			if (player3.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player3.vspeed);
			}
			if (player3.wall_jump == true)
			or (player3.climb == true)
			{
				yy = player3.y
			}
			if (player3.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player3.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player3.in_water == true)
			or (player3.stick_to_wall == true)
			or (player3.spring == true)
			or (player3.climb == true)
			or (player3.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player3.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
					{
						yy = player3.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 4 */
		if (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player4.x + player4.hspeed * 15;
			if (player4.on_ground == true)
			and (player4.vspeed >= 0)
			{
				yy = player4.y
			}
			else
			if (player4.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player4.vspeed);
			}
			if (player4.wall_jump == true)
			or (player4.climb == true)
			{
				yy = player4.y
			}
			if (player4.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player4.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player4.in_water == true)
			or (player4.stick_to_wall == true)
			or (player4.spring == true)
			or (player4.climb == true)
			or (player4.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player4.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
					{
						yy = player4.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* nothing */
		{
			xx = x;
			yy = y;
		}
		#endregion /* Follow one player. In case something goes wrong, camera will always follow one player END */
		
		#region /* Zoom out the view when players are going outside view */
		if (instance_nearest(x, 0, obj_player).y < camera_get_view_y(view_camera[view_current]) + 32)
		and (fps >= global.max_fps)
		or (instance_nearest(x, room_height, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32)
		and (fps >= global.max_fps)
		or (instance_nearest(0, room_height * 0.5, obj_player).x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 - 320)
		and (instance_nearest(room_width, room_height * 0.5, obj_player).x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 + 320)
		and (fps >= global.max_fps)
		or (instance_nearest(room_width * 0.5, 0, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5 - 320)
		and (instance_nearest(room_width * 0.5, room_height, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5 + 320)
		and (fps >= global.max_fps)
		{
			if (camera_get_view_height(view_camera[view_current]) < room_height)
			and (camera_get_view_width(view_camera[view_current]) < room_width)
			{
				view_wview_lerp = lerp(view_wview_lerp, 10, 0.005);
				view_hview_lerp = lerp(view_hview_lerp, 10, 0.005);
			}
			else
			{
				view_wview_lerp = lerp(view_wview_lerp, 0, 0.005);
				view_hview_lerp = lerp(view_hview_lerp, 0, 0.005);
			}
		}
		else
		{
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.005);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.005);
		}
		#endregion /* Zoom out the view when players are going outside view END */
		
	}
	#endregion /* MULTIPLAYER CAMERA */
	
	#region /* Iris */
	if (allow_iris == true)
	{
		
		#region /* Zoom In */
		if (asset_get_type("obj_player") == asset_object) /* Zoom In Player Goal */
		and (instance_exists(obj_player))
		and (instance_nearest(room_width, y, obj_player).goal == true)
		and (global.time_countdown_bonus <= 0)
		
		or (global.iris_zoom_in == true) /* Zoom In Global Switch */
		{
			if (iris_zoom == 1)
			{
				iris_xscale = lerp(iris_xscale, 1, 0.15);
				iris_yscale = lerp(iris_yscale, 1, 0.15);
				if (iris_xscale <= 1.1)
				{
					iris_zoom = 0;
				}
			}
			else
			{
				iris_xscale = lerp(iris_xscale, 0, 0.15);
				iris_yscale = lerp(iris_yscale, 0, 0.15);
				if (iris_xscale <= 1.1)
				{
					iris_zoom = 0;
				}
			}
		}
		#endregion /* Zoom In END */
		
		else
		
		#region /* Zoom Out */
		if (iris_zoom == 0)
		{
			iris_xscale = lerp(iris_xscale, 1, 0.15);
			iris_yscale = lerp(iris_yscale, 1, 0.15);
			if (iris_xscale >= 0.99)
			{
				iris_zoom = 1;
			}
		}
		else
		{
			iris_xscale = lerp(iris_xscale, 32, 0.015);
			iris_yscale = lerp(iris_yscale, 32, 0.015);
			if (iris_xscale >= 0.99)
			{
				iris_zoom = 1;
			}
		}
		#endregion /* Zoom Out END */

	}
	#endregion /* Iris END */
	
}

#region /* Step Sprint Toggling */
key_player1_sprint_toggle_pressed = scr_key_initialize(key_player1_sprint_toggle_pressed, 1, 1, global.player1_key_sprint_toggle, global.player1_key2_sprint_toggle, global.player1_gamepad_button_sprint_toggle, global.player1_gamepad_button2_sprint_toggle);
key_player2_sprint_toggle_pressed = scr_key_initialize(key_player2_sprint_toggle_pressed, 1, 2, global.player2_key_sprint_toggle, global.player2_key2_sprint_toggle, global.player2_gamepad_button_sprint_toggle, global.player2_gamepad_button2_sprint_toggle);
key_player3_sprint_toggle_pressed = scr_key_initialize(key_player3_sprint_toggle_pressed, 1, 3, global.player3_key_sprint_toggle, global.player3_key2_sprint_toggle, global.player3_gamepad_button_sprint_toggle, global.player3_gamepad_button2_sprint_toggle);
key_player4_sprint_toggle_pressed = scr_key_initialize(key_player4_sprint_toggle_pressed, 1, 4, global.player4_key_sprint_toggle, global.player4_key2_sprint_toggle, global.player4_gamepad_button_sprint_toggle, global.player4_gamepad_button2_sprint_toggle);

if (key_player1_sprint_toggle_pressed)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 100;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_sprint_toggle = false)
	{
		global.player1_sprint_toggle = true;
	}
	else
	{
		global.player1_sprint_toggle = false;
	}
}
if (key_player2_sprint_toggle_pressed)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 100;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle = false)
	{
		global.player2_sprint_toggle = true;
	}
	else
	{
		global.player2_sprint_toggle = false;
	}
}
if (key_player3_sprint_toggle_pressed)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 100;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle = false)
	{
		global.player3_sprint_toggle = true;
	}
	else
	{
		global.player3_sprint_toggle = false;
	}
}
if (key_player4_sprint_toggle_pressed)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 100;
	if (global.player4_sprint_toggle = false)
	{
		global.player4_sprint_toggle = true;
	}
	else
	{
		global.player4_sprint_toggle = false;
	}
}
#endregion /* Step Sprint Toggling END */

#region /* Step Convention Mode */
if (global.convention_mode == true)
{
	reset_game_if_no_interactivity += 1;
	reset_game_if_no_interactivity_second_countdown_timer += 1;
	if (reset_game_if_no_interactivity_second_countdown_timer >= 60)
	{
		reset_game_if_no_interactivity_second_countdown_timer = 0;
		reset_game_if_no_interactivity_second_countdown -= 1;
	}
	if (reset_game_if_no_interactivity >= 3600)
	{
		game_restart();
	}
}
#endregion /* Step Convention Mode END */

#region /* Show HUD timers */

#region /* If HUD show timer is set to always hide */
if (global.hud_hide_time <= 0)
or (show_letterbox > 0)
{
	hud_show_lives_timer = false;
	hud_show_deaths_timer = false;
	hud_show_basic_collectibles_timer = false;
	hud_show_big_collectibles_timer = false;
	hud_show_score_timer = false;
}
#endregion /* If HUD show timer is set to always hide */

#region /* If HUD show timer is set to never hide */
if (global.hud_hide_time >= 10)
{
	hud_show_lives_timer = global.hud_hide_time * 60;
	if (global.show_deaths_counter == true)
	{
		hud_show_deaths_timer = global.hud_hide_time * 60;
	}
	hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
	hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	hud_show_score_timer = global.hud_hide_time * 60;
}
#endregion /* If HUD show timer is set to never hide */

if (global.hud_hide_time >= 10)
{
	if (global.show_deaths_counter == true)
	{
		hud_show_deaths_timer = global.hud_hide_time * 60;
	}
	hud_show_lives_timer = global.hud_hide_time * 60;
	hud_show_deaths_timer = global.hud_hide_time * 60;
	hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
	hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	hud_show_score_timer = global.hud_hide_time * 60;
}
else
{
	if (hud_show_lives_timer > 0)
	{
		hud_show_lives_timer -= 1;
	}
	if (hud_show_deaths_timer > 0)
	{
		hud_show_deaths_timer -= 1;
	}
	if (hud_show_big_collectibles_timer > 0)
	{
		hud_show_big_collectibles_timer -= 1;
	}
	if (hud_show_score_timer > 0)
	{
		hud_show_score_timer -= 1;
	}
}

#region /* Y position of all HUD should be lerping onto screen when it's relevant */
if (global.hud_hide_time > 0)
{
	/*
	Show these in right order:
	Lives
	Deaths
	Big Collectibles
	Basic Collectibles
	*/
	
	#region /* Show Lives y position */
	if (asset_get_type("room_world_map") == asset_room)
	and (room == room_world_map)
	{
		hud_show_lives_y = 32;
	}
	else
	{
		if (hud_show_lives_timer > 0)
		{
			hud_show_lives_y = lerp(hud_show_lives_y, 32, 0.1);
		}
		else
		{
			hud_show_lives_y = lerp(hud_show_lives_y, -32, 0.1);
		}
	}
	#endregion /* Show Lives y position END */
	
	#region /* Show Deaths y position */
	if (hud_show_deaths_timer > 0)
	and (global.show_deaths_counter == true)
	{
		if (hud_show_lives_y > 0)
		{
			hud_show_deaths_y = lerp(hud_show_deaths_y, 70, 0.1);
		}
		else
		{
			hud_show_deaths_y = lerp(hud_show_deaths_y, 32, 0.1);
		}
	}
	else
	{
		hud_show_deaths_y = lerp(hud_show_deaths_y, -32, 0.1);
	}
	#endregion /* Show Deaths y position END */
	
	#region /* Show Big Collectibles y position */
	if (hud_show_big_collectibles_timer > 0) /* Make sure it says BIG collectibles */
	{
		if (hud_show_lives_y > 0)
		and (hud_show_deaths_y > 0)
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 110, 0.1);
		}
		else
		if (hud_show_lives_y > 0)
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 70, 0.1);
		}
		else
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 30, 0.1);
		}
	}
	else
	{
		hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, -32, 0.1);
	}
	#endregion /* Show Big Collectibles y position END */
	
	#region /* Show Basic Collectible y position */
	if (hud_show_basic_collectibles_timer > 0) /* Make sure it says BASIC collectibles */
	{
		hud_show_basic_collectibles_timer -= 1;
		
		if (hud_show_lives_y > 0)
		and (hud_show_deaths_y > 0)
		and (hud_show_big_collectibles_y > 0)
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 150, 0.1);
		}
		else
		if (hud_show_lives_y < 0)
		and (hud_show_deaths_y > 0)
		and (hud_show_big_collectibles_y > 0)
		or(hud_show_lives_y > 0)
		and (hud_show_deaths_y < 0)
		and (hud_show_big_collectibles_y > 0)
		or(hud_show_lives_y > 0)
		and (hud_show_deaths_y > 0)
		and (hud_show_big_collectibles_y < 0)
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 110, 0.1);
		}
		else
		if (hud_show_lives_y > 0)
		and (hud_show_deaths_y < 0)
		and (hud_show_big_collectibles_y < 0)
		or(hud_show_lives_y < 0)
		and (hud_show_deaths_y > 0)
		and (hud_show_big_collectibles_y < 0)
		or(hud_show_lives_y < 0)
		and (hud_show_deaths_y < 0)
		and (hud_show_big_collectibles_y > 0)
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 64, 0.1);
		}
		else
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 32, 0.1);
		}
	}
	else
	{
		hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, -32, 0.1);
	}
	#endregion /* Show Basic Collectible y position END */
	
	#region /* Show Score y position */
	if (hud_show_score_timer > 0)
	{
		hud_show_score_y = lerp(hud_show_score_y, 32, 0.1);
	}
	else
	{
		hud_show_score_y = lerp(hud_show_score_y, -64, 0.1);
	}
	#endregion /* Show Score y position END */
	
}
#endregion /* Y position of all HUD should be lerping onto screen when it's relevant END */

#endregion /* Show HUD timers END */

#region /* Show Controls */
if (os_type != os_ios)
and (os_type != os_android)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	
	#region /* Show Multiplayer Controls */
	
	#region /* Y position of show controls for each player */
	if (player1_show_controls_alpha > 0)
	and (player2_show_controls_alpha <= 0)
	and (player3_show_controls_alpha <= 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, 32, 0.1);
		show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha <= 0)
	and (player2_show_controls_alpha > 0)
	and (player3_show_controls_alpha <= 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player2_controls_y = lerp(show_player2_controls_y, 32, 0.1);
		show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha <= 0)
	and (player2_show_controls_alpha <= 0)
	and (player3_show_controls_alpha > 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha <= 0)
	and (player2_show_controls_alpha <= 0)
	and (player3_show_controls_alpha <= 0)
	and (player4_show_controls_alpha > 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player4_controls_y = lerp(show_player4_controls_y, 32, 0.1);
	}
	else
	if (player1_show_controls_alpha > 0)
	and (player2_show_controls_alpha > 0)
	and (player3_show_controls_alpha <= 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, 74, 0.1);
		show_player2_controls_y = lerp(show_player2_controls_y, 32, 0.1);
		show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha > 0)
	and (player2_show_controls_alpha > 0)
	and (player3_show_controls_alpha > 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, 116, 0.1);
		show_player2_controls_y = lerp(show_player2_controls_y, 74, 0.1);
		show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha > 0)
	and (player2_show_controls_alpha <= 0)
	and (player3_show_controls_alpha > 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, 74, 0.1);
		show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha <= 0)
	and (player2_show_controls_alpha > 0)
	and (player3_show_controls_alpha > 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player2_controls_y = lerp(show_player2_controls_y, 74, 0.1);
		show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player1_show_controls_alpha <= 0)
	and (player2_show_controls_alpha <= 0)
	and (player3_show_controls_alpha <= 0)
	and (player4_show_controls_alpha <= 0)
	{
		show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
		show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
	}
	else
	{
		show_player1_controls_y = lerp(show_player1_controls_y, 158, 0.1);
		show_player2_controls_y = lerp(show_player2_controls_y, 116, 0.1);
		show_player3_controls_y = lerp(show_player3_controls_y, 74, 0.1);
		show_player4_controls_y = lerp(show_player4_controls_y, 32, 0.1);
	}
	#endregion /* Y position of show controls for each player END */
	
	#endregion /* Show Multiplayer Controls END */
	
}
#endregion /* Show Controls END */

#region /* Show what input is used */
if (show_controller_input_change_prompt > 0)
{
	show_controller_input_change_prompt -= 1;
	show_keyboard_and_mouse_input_change_prompt = 0;
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, -400, 0.1);
}
else
{
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, 0, 0.1);
}

if (show_keyboard_and_mouse_input_change_prompt > 0)
{
	show_keyboard_and_mouse_input_change_prompt -= 1;
	show_controller_input_change_prompt = 0;
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, -400, 0.1);
}
else
{
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, 0, 0.1);
}
#endregion /* Show what input is used END */

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (asset_get_type("obj_player") == asset_object)
and (!instance_exists(obj_player))
or (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.can_move = false)
{
	letterbox_top_y = lerp(letterbox_top_y, + 64, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, display_get_gui_height() - 64, 0.1);
	show_letterbox = 60;
}
else
{
	letterbox_top_y = lerp(letterbox_top_y, 0, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, display_get_gui_height(), 0.1);
	if (show_letterbox > 0)
	{
		show_letterbox -= 1;
	}
}
#endregion /* Letterboxing during cutscenes (when the player object is absent) END */

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (iris_xscale <= 1)
and (iris_zoom != 0)
and (delay <= 1)
or (instance_exists(obj_player_lose))
and (obj_player_lose.iris_xscale <= 1)
and (obj_player_lose.iris_zoom != 0)
and (delay <= 1)
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 1, 0.1);
}
else
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 0, 0.1);
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */