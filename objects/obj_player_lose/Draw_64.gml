var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Game Over */
if (lives <= 0)
{
	
	#region /* When you get a game over, reset checkpoints */
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
	#endregion /* When you get a game over, reset checkpoints END */
	
	draw_set_halign(fa_center);
	if (iris_xscale <= 0.3)
	{
		game_over_sprite_y = lerp(game_over_sprite_y, get_window_height * 0.5 + 170, 0.07);
		game_over_text_y = lerp(game_over_text_y, get_window_height * 0.5 - 180, 0.1);
	}
	
	if (sprite_game_over_character_portrait > noone)
	{
		draw_sprite(sprite_game_over_character_portrait, image_index, get_window_width * 0.5, game_over_sprite_y);
	}
	
	draw_sprite(spr_game_over_text, image_index, get_window_width * 0.5, game_over_text_y);
	
	#region /* Continue / Quit from Game Over */
	if (game_over_text_y >= get_window_height * 0.5 - 190)
	{
		draw_menu_button(get_window_width * 0.5 - 370 - game_over_menu_seperation_distance, get_window_height - game_over_menu_y, l10n_text("Continue"), "continue", "continue");
		draw_menu_button(get_window_width * 0.5 + game_over_menu_seperation_distance, get_window_height - game_over_menu_y, l10n_text("Quit"), "quit", "quit");
		
		if (keyboard_check_pressed(global.player1_key_left))
		or (keyboard_check_pressed(global.player2_key_left))
		or (keyboard_check_pressed(global.player3_key_left))
		or (keyboard_check_pressed(global.player4_key_left))
		or (keyboard_check_pressed(global.player1_key2_left))
		or (keyboard_check_pressed(global.player2_key2_left))
		or (keyboard_check_pressed(global.player3_key2_left))
		or (keyboard_check_pressed(global.player4_key2_left))
		or (keyboard_check_pressed(ord("A")))
		or (keyboard_check_pressed(vk_left))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
		or (gamepad_button_check_pressed(global.player2_slot, gp_padl))
		or (gamepad_button_check_pressed(global.player3_slot, gp_padl))
		or (gamepad_button_check_pressed(global.player4_slot, gp_padl))
		or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
		or (keyboard_check_pressed(global.player1_key_right))
		or (keyboard_check_pressed(global.player2_key_right))
		or (keyboard_check_pressed(global.player3_key_right))
		or (keyboard_check_pressed(global.player4_key_right))
		or (keyboard_check_pressed(global.player1_key2_right))
		or (keyboard_check_pressed(global.player2_key2_right))
		or (keyboard_check_pressed(global.player3_key2_right))
		or (keyboard_check_pressed(global.player4_key2_right))
		or (keyboard_check_pressed(ord("D")))
		or (keyboard_check_pressed(vk_right))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
		or (gamepad_button_check_pressed(global.player2_slot, gp_padr))
		or (gamepad_button_check_pressed(global.player3_slot, gp_padr))
		or (gamepad_button_check_pressed(global.player4_slot, gp_padr))
		or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
		{
			if (menu_delay == 0)
			{
				if (menu == "continue")
				{
					menu = "quit";
					menu_delay = 10;
				}
				else
				if (menu == "quit")
				{
					menu = "continue";
					menu_delay = 10;
				}
			}
		}
		
		if (keyboard_check_pressed(global.player1_key_jump))
		or (keyboard_check_pressed(global.player2_key_jump))
		or (keyboard_check_pressed(global.player3_key_jump))
		or (keyboard_check_pressed(global.player4_key_jump))
		or (keyboard_check_pressed(global.player1_key2_jump))
		or (keyboard_check_pressed(global.player2_key2_jump))
		or (keyboard_check_pressed(global.player3_key2_jump))
		or (keyboard_check_pressed(global.player4_key2_jump))
		or (keyboard_check_pressed(ord("Z")))
		or (keyboard_check_pressed(vk_space))
		or (keyboard_check_pressed(vk_enter))
		or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
		or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept))
		or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept))
		or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept))
		or (menu == "continue")
		and (point_in_rectangle(
		mouse_get_x,
		mouse_get_y,
		get_window_width * 0.5 - 370 - game_over_menu_seperation_distance,
		get_window_height - game_over_menu_y + 2,
		get_window_width * 0.5 - 370 + 370 - game_over_menu_seperation_distance,
		get_window_height - game_over_menu_y + 41))
		and (mouse_check_button_pressed(mb_left))
		or (menu == "quit")
		and (point_in_rectangle(
		mouse_get_x,
		mouse_get_y,
		get_window_width * 0.5 + game_over_menu_seperation_distance,
		get_window_height - game_over_menu_y + 2,
		get_window_width * 0.5 + 370 + game_over_menu_seperation_distance,
		get_window_height - game_over_menu_y + 41))
		and (mouse_check_button_pressed(mb_left))
		{
			
			#region /* Click Menu */
			if (global.playergame == 0)
			{
				lives = 5;
			}
			if (global.playergame == 1)
			{
				lives = 10;
			}
			if (global.playergame == 2)
			{
				lives = 15;
			}
			if (global.playergame == 3)
			{
				lives = 20;
			}
				
			if (menu == "quit")
			{
				global.quit_level = true; /* Quit level and go to map screen */
			}
				
			#region /* Reset Level */
			global.timeattack_realmillisecond = 0;
			score = 0;
			scr_save_level();
			audio_stop_all();
				
			#region /* Go to level editor if you die in level editor */
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room == room_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /* Go to level editor if you die in level editor END */
				
			#endregion /* Reset Level END */
			
			#endregion /* Click Menu END */
			
		}
	}
	#endregion /* Continue / Quit from Game Over END */
	
}
#endregion /* Game Over END */

#region /* Draw loading screen when reloading level */
if (iris_xscale <= 0.001)
and (lives >= 1)
{
	draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false); /* Make the screen completly black in Draw GUI whenever the iris is small enough, to make sure that effects are completly hidden */
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	global.loading_spinning_angle -= 10;
	draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
}
#endregion /* Draw loading screen when reloading level END */

scr_draw_cursor_mouse();