var main_game_y = display_get_gui_height() * 0.5 + 100 + 40;
var level_editor_y = display_get_gui_height() * 0.5 + 100 + 80;
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Play Attract Demo */
if (global.play_attract_demo = false)
and (global.enable_attract_demo == true)
{
	if (file_exists("video/trailer.mp4"))
	{
		play_attract_demo_time += 1;
	}
	if (menu == "main_game")
	or (menu == "leveleditor")
	or (menu == "options")
	or (menu == "language_shortcut")
	or (menu == "accessibility_shortcut")
	or (menu == "profile_shortcut")
	or (menu == "credits")
	or (menu == "quit")
	or (menu == "link_discord")
	or (menu == "link_gamebanana")
	or (menu == "link_instagram")
	or (menu == "link_reddit")
	or (menu == "link_twitter")
	or (menu == "link_wiki")
	{
		if (play_attract_demo_time >= 960)
		and (file_exists("video/trailer.mp4"))
		{
			in_settings = false;
			video_seek_to(0);
			global.play_attract_demo = true;
		}
	}
	else
	{
		if (play_attract_demo_time >= 3600)
		and (global.convention_mode == true)
		and (file_exists("video/trailer.mp4"))
		{
			in_settings = false;
			menu = "main_game";
			video_seek_to(0);
			global.play_attract_demo = true;
		}
	}
}
if (global.play_attract_demo == true)
{
	video_open("video/trailer.mp4");
	video_resume();
	scr_audio_play(trailer_sound, volume_source.music);
	global.play_attract_demo = 2;
}
if (global.play_attract_demo = 2)
{
	menu_delay = 3;
	audio_sound_gain(trailer_sound, global.volume_music * global.volume_main, 0);
	var trailer_video = video_draw();
	if (trailer_video[0] == 0)
	{
		draw_surface_ext(trailer_video[1], 0, 0, 1.5, 1.47, 0, c_white, 1);
	}
	if (video_get_position() >= video_get_duration() - 2000)
	{
		play_attract_demo_time = 0;
		global.play_attract_demo = false;
		audio_stop_sound(trailer_sound);
		video_pause();
	}
}
#endregion /* Play Attract Demo END */

if (menu == "main_game")
or (menu == "options")
or (menu == "quit")
or (menu == "quit_game_no")
or (menu == "quit_game_yes")
or (menu == "link_discord")
or (menu == "link_gamebanana")
or (menu == "link_instagram")
or (menu == "link_reddit")
or (menu == "link_twitter")
or (menu == "link_wiki")
{
	
	#region /* Enable convention mode via cheat code, type "conventionmode" on your keyboard */
	if (keyboard_check_pressed(ord("C")))
	and (keyboard_string != "arc")
	and (can_input_level_name == false)
	and (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		keyboard_string = "c";
	}
	
	if (keyboard_string = "conventionmode")
	or (keyboard_string = "convention mode")
	{
		if (can_input_level_name == false)
		and (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		{
			if (global.convention_mode == false)
			{
				global.arcade_mode = false;
				global.convention_mode = true;
				if (menu == "options")
				or (menu == "quit")
				or (menu == "quit_game_no")
				or (menu == "quit_game_yes")
				or (menu == "link_discord")
				or (menu == "link_gamebanana")
				or (menu == "link_instagram")
				or (menu == "link_reddit")
				or (menu == "link_twitter")
				or (menu == "link_wiki")
				or (in_settings == true)
				{
					menu = "main_game";
					in_settings = false;
				}
				keyboard_string = "";
				show_convention_mode_enable_text = 180;
			}
			else
			{
				global.arcade_mode = false;
				global.convention_mode = false;
				keyboard_string = "";
				show_convention_mode_enable_text = 180;
			}
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "convention_mode", global.convention_mode);
			ini_close();
		}
	}
	#endregion /* Enable convention mode via cheat code, type "conventionmode" on your keyboard END */
	
	#region /* Enable arcade mode via cheat code, type "arcademode" on your keyboard */
	if (keyboard_check_pressed(ord("A")))
	and (keyboard_string != "arca")
	and (can_input_level_name == false)
	and (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		keyboard_string = "a";
	}
	
	if (keyboard_string = "arcademode")
	or (keyboard_string = "arcade mode")
	{
		if (can_input_level_name == false)
		and (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		{
			if (global.arcade_mode = false)
			{
				global.arcade_mode = true;
				global.convention_mode = false;
				if (menu == "options")
				or (menu == "quit")
				or (menu == "quit_game_no")
				or (menu == "quit_game_yes")
				or (menu == "link_discord")
				or (menu == "link_gamebanana")
				or (menu == "link_instagram")
				or (menu == "link_reddit")
				or (menu == "link_twitter")
				or (menu == "link_wiki")
				or (in_settings == true)
				{
					menu = "main_game";
					in_settings = false;
				}
				keyboard_string = "";
				show_arcade_mode_enable_text = 180;
			}
			else
			{
				global.arcade_mode = false;
				global.convention_mode = false;
				keyboard_string = "";
				show_arcade_mode_enable_text = 180;
			}
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "arcade_mode", global.arcade_mode);
			ini_close();
		}
	}
	#endregion /* Enable arcade mode via cheat code, type "arcademode" on your keyboard END */
	
}

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (global.convention_mode == true)
and (show_convention_mode_enable_text > 0)
{
	show_convention_mode_enable_text -= 1;
	scr_draw_text_outlined(64, 32, l10n_text("Convention mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, true, 32, 32, 0.5, 0.5, 0, c_white, 1);
}
else
if (global.convention_mode == false)
and (show_convention_mode_enable_text > 0)
{
	show_convention_mode_enable_text -= 1;
	scr_draw_text_outlined(64, 32, l10n_text("Convention mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, false, 32, 32, 0.5, 0.5, 0, c_white, 1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (global.arcade_mode == true)
and (show_arcade_mode_enable_text > 0)
{
	show_arcade_mode_enable_text -= 1;
	scr_draw_text_outlined(64, 32, l10n_text("Arcade mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, true, 32, 32, 0.5, 0.5, 0, c_white, 1);
}
else
if (global.arcade_mode = false)
and (show_arcade_mode_enable_text > 0)
{
	show_arcade_mode_enable_text -= 1;
	scr_draw_text_outlined(64, 32, l10n_text("Arcade mode"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, false, 32, 32, 0.5, 0.5, 0, c_white, 1);
}

#region /* Reset keys to noone if they happen to be 0, having a key at 0 means it's pressed every frame, and glitches the menus */

#region /* Player 1 reset keys to noone if they happen to be 0 */
if (global.player1_key_dive == 0){global.player1_key_dive = noone;}
if (global.player1_key_jump == 0){global.player1_key_jump = noone;}
if (global.player1_key_crouch == 0){global.player1_key_crouch = noone;}
if (global.player1_key_crouch_toggle == 0){global.player1_key_crouch_toggle = noone;}
if (global.player1_key_sprint == 0){global.player1_key_sprint = noone;}
if (global.player1_key_sprint_toggle == 0){global.player1_key_sprint_toggle = noone;}
if (global.player1_key_left == 0){global.player1_key_left = noone;}
if (global.player1_key_right == 0){global.player1_key_right = noone;}
if (global.player1_key_down == 0){global.player1_key_down = noone;}
if (global.player1_key_up == 0){global.player1_key_up = noone;}
if (global.player1_key_tongue == 0){global.player1_key_tongue = noone;}
if (global.player1_key2_dive == 0){global.player1_key2_dive = noone;}
if (global.player1_key2_jump == 0){global.player1_key2_jump = noone;}
if (global.player1_key2_crouch == 0){global.player1_key2_crouch = noone;}
if (global.player1_key2_crouch_toggle == 0){global.player1_key2_crouch_toggle = noone;}
if (global.player1_key2_sprint == 0){global.player1_key2_sprint = noone;}
if (global.player1_key2_sprint_toggle == 0){global.player1_key2_sprint_toggle = noone;}
if (global.player1_key2_left == 0){global.player1_key2_left = noone;}
if (global.player1_key2_right == 0){global.player1_key2_right = noone;}
if (global.player1_key2_down == 0){global.player1_key2_down = noone;}
if (global.player1_key2_up == 0){global.player1_key2_up = noone;}
if (global.player1_key2_tongue == 0){global.player1_key2_tongue = noone;}
#endregion /* Player 1 reset keys to noone if they happen to be 0 END */

#region /* Player 2 reset keys to noone if they happen to be 0 */
if (global.player2_key_dive == 0){global.player2_key_dive = noone;}
if (global.player2_key_jump == 0){global.player2_key_jump = noone;}
if (global.player2_key_crouch == 0){global.player2_key_crouch = noone;}
if (global.player2_key_crouch_toggle == 0){global.player2_key_crouch_toggle = noone;}
if (global.player2_key_sprint == 0){global.player2_key_sprint = noone;}
if (global.player2_key_sprint_toggle == 0){global.player2_key_sprint_toggle = noone;}
if (global.player2_key_left == 0){global.player2_key_left = noone;}
if (global.player2_key_right == 0){global.player2_key_right = noone;}
if (global.player2_key_down == 0){global.player2_key_down = noone;}
if (global.player2_key_up == 0){global.player2_key_up = noone;}
if (global.player2_key_tongue == 0){global.player2_key_tongue = noone;}
if (global.player2_key2_dive == 0){global.player2_key2_dive = noone;}
if (global.player2_key2_jump == 0){global.player2_key2_jump = noone;}
if (global.player2_key2_crouch == 0){global.player2_key2_crouch = noone;}
if (global.player2_key2_crouch_toggle == 0){global.player2_key2_crouch_toggle = noone;}
if (global.player2_key2_sprint == 0){global.player2_key2_sprint = noone;}
if (global.player2_key2_sprint_toggle == 0){global.player2_key2_sprint_toggle = noone;}
if (global.player2_key2_left == 0){global.player2_key2_left = noone;}
if (global.player2_key2_right == 0){global.player2_key2_right = noone;}
if (global.player2_key2_down == 0){global.player2_key2_down = noone;}
if (global.player2_key2_up == 0){global.player2_key2_up = noone;}
if (global.player2_key2_tongue == 0){global.player2_key2_tongue = noone;}
#endregion /* Player 2 reset keys to noone if they happen to be 0 END */

#region /* Player 3 reset keys to noone if they happen to be 0 */
if (global.player3_key_dive == 0){global.player3_key_dive = noone;}
if (global.player3_key_jump == 0){global.player3_key_jump = noone;}
if (global.player3_key_crouch == 0){global.player3_key_crouch = noone;}
if (global.player3_key_crouch_toggle == 0){global.player3_key_crouch_toggle = noone;}
if (global.player3_key_sprint == 0){global.player3_key_sprint = noone;}
if (global.player3_key_sprint_toggle == 0){global.player3_key_sprint_toggle = noone;}
if (global.player3_key_left == 0){global.player3_key_left = noone;}
if (global.player3_key_right == 0){global.player3_key_right = noone;}
if (global.player3_key_down == 0){global.player3_key_down = noone;}
if (global.player3_key_up == 0){global.player3_key_up = noone;}
if (global.player3_key_tongue == 0){global.player3_key_tongue = noone;}
if (global.player3_key2_dive == 0){global.player3_key2_dive = noone;}
if (global.player3_key2_jump == 0){global.player3_key2_jump = noone;}
if (global.player3_key2_crouch == 0){global.player3_key2_crouch = noone;}
if (global.player3_key2_crouch_toggle == 0){global.player3_key2_crouch_toggle = noone;}
if (global.player3_key2_sprint == 0){global.player3_key2_sprint = noone;}
if (global.player3_key2_sprint_toggle == 0){global.player3_key2_sprint_toggle = noone;}
if (global.player3_key2_left == 0){global.player3_key2_left = noone;}
if (global.player3_key2_right == 0){global.player3_key2_right = noone;}
if (global.player3_key2_down == 0){global.player3_key2_down = noone;}
if (global.player3_key2_up == 0){global.player3_key2_up = noone;}
if (global.player3_key2_tongue == 0){global.player3_key2_tongue = noone;}
#endregion /* Player 3 reset keys to noone if they happen to be 0 END */

#region /* Player 4 reset keys to noone if they happen to be 0 */
if (global.player4_key_dive == 0){global.player4_key_dive = noone;}
if (global.player4_key_jump == 0){global.player4_key_jump = noone;}
if (global.player4_key_crouch == 0){global.player4_key_crouch = noone;}
if (global.player4_key_crouch_toggle == 0){global.player4_key_crouch_toggle = noone;}
if (global.player4_key_sprint == 0){global.player4_key_sprint = noone;}
if (global.player4_key_sprint_toggle == 0){global.player4_key_sprint_toggle = noone;}
if (global.player4_key_left == 0){global.player4_key_left = noone;}
if (global.player4_key_right == 0){global.player4_key_right = noone;}
if (global.player4_key_down == 0){global.player4_key_down = noone;}
if (global.player4_key_up == 0){global.player4_key_up = noone;}
if (global.player4_key_tongue == 0){global.player4_key_tongue = noone;}
if (global.player4_key2_dive == 0){global.player4_key2_dive = noone;}
if (global.player4_key2_jump == 0){global.player4_key2_jump = noone;}
if (global.player4_key2_crouch == 0){global.player4_key2_crouch = noone;}
if (global.player4_key2_crouch_toggle == 0){global.player4_key2_crouch_toggle = noone;}
if (global.player4_key2_sprint == 0){global.player4_key2_sprint = noone;}
if (global.player4_key2_sprint_toggle == 0){global.player4_key2_sprint_toggle = noone;}
if (global.player4_key2_left == 0){global.player4_key2_left = noone;}
if (global.player4_key2_right == 0){global.player4_key2_right = noone;}
if (global.player4_key2_down == 0){global.player4_key2_down = noone;}
if (global.player4_key2_up == 0){global.player4_key2_up = noone;}
if (global.player4_key2_tongue == 0){global.player4_key2_tongue = noone;}
#endregion /* Player 4 reset keys to noone if they happen to be 0 END */

#endregion /* Reset keys to noone if they happen to be 0, having a key at 0 means it's pressed every frame, and glitches the menus END */

if (global.background_brightness_menu > +0.001)
{
	c_menu_outline = c_white;
	c_menu_fill = c_black;
}
else
{
	c_menu_outline = c_black;
	c_menu_fill = c_white;
}

/* Title Screen */

room_speed = global.max_fps; /* Room Speed END */

#region /* Change title screen during specific times and dates */
if (current_month == 12)
and (current_day >= 24)
and (current_day <= 26)
{
	effect_create_below(ef_snow, 0, 0, 2, c_white); /* Make the title screen snow when it's between 24th and 26th December */
}
#endregion /* Change title screen during specific times and dates END */

#region /* Volumes stay between 0 and 1 */
if (global.volume_music < 0)
{
	global.volume_music = 0;
}
else
if (global.volume_music > 1)
{
	global.volume_music = 1;
}
if (global.volume_sound < 0)
{
	global.volume_sound = 0;
}
else
if (global.volume_sound > 1)
{
	global.volume_sound = 1;
}
if (global.volume_ambient < 0)
{
	global.volume_ambient = 0;
}
else
if (global.volume_ambient > 1)
{
	global.volume_ambient = 1;
}
if (global.volume_voice < 0)
{
	global.volume_voice = 0;
}
else
if (global.volume_voice > 1)
{
	global.volume_voice = 1;
}
#endregion /* Volumes stay between 0 and 1 END */

#region /* Quit Game trough pause menu */
if (global.convention_mode == false)
and (global.enable_options_for_pc == true)
and (can_remap_key == false)
and (input_key == false)
and (menu_delay == 0)
{
	if (menu == "main_game")
	or (menu == "leveleditor")
	or (menu == "options")
	or (menu == "credits")
	or (menu == "quit")
	{
		if (keyboard_check_pressed(vk_escape))
		{
			menu_delay = 3;
			menu = "quit_game_no";
		}
		else
		{
			room_persistent = false;
		}
		if (global.quit_level == true)
		{
			game_end();
		}
	}
}
#endregion /* Quit Game trough pause menu END */

/* Draw Event */

#region /* Fullscreen toggle */
if (os_type != os_ios)
and (os_type != os_android)
and (global.enable_options_for_pc == true)
and (global.controls_used_for_menu_navigation != "controller")
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (window_get_fullscreen())
	{
		scr_draw_text_outlined(+ 52, display_get_gui_height() - 55 + version_y_pos, l10n_text("Windowed"), global.default_text_size, c_white, c_black, 1);
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 25, display_get_gui_height() - 74 + version_y_pos + 16, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	{
		scr_draw_text_outlined(+ 52, display_get_gui_height() - 55 + version_y_pos, l10n_text("Fullscreen"), global.default_text_size, c_white, c_black, 1);
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 25, display_get_gui_height() - 74 + version_y_pos + 16, 0.5, 0.5, 0, c_white, 1);
		}
	}
	if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() + version_y_pos - 85, 370, display_get_gui_height() + version_y_pos - 75 + 42))
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, display_get_gui_height() + version_y_pos - 85, 370, display_get_gui_height() + version_y_pos - 75 + 42, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() + version_y_pos - 85, 370, display_get_gui_height() + version_y_pos - 75 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (menu != "quit_game_no")
	and (menu != "quit_game_yes")
	{
		if (window_get_fullscreen())
		{
			window_set_fullscreen(false);
		}
		else
		{
			window_set_fullscreen(true);
		}
		menu_delay = 3;
	}
}
#endregion /* Fullscreen toggle END */

scr_toggle_fullscreen();

#region /* Build Date and Version */
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (global.demo == false)
{
	scr_draw_text_outlined(0 + 16, display_get_gui_height() - 16 + version_y_pos, "v" + string(scr_get_build_date()), global.default_text_size, c_menu_outline, c_menu_fill, 1);
}
else
{
	scr_draw_text_outlined(0 + 16, display_get_gui_height() - 16 + version_y_pos, "v" + string(scr_get_build_date()) + " " + l10n_text("Demo"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
#endregion /* Build Date and Version END */

var link_discord_x = 16;
var link_gamebanana_x = 56;
var link_instagram_x = 96;
var link_reddit_x = 136;
var link_twitter_x = 176;
var link_wiki_x = 216;

#region /* Links */
/* Put links underneath build date and version */
if (global.enable_links == true)
{
	draw_menu_button_sprite(global.resource_pack_sprite_logo_discord, link_discord_x, display_get_gui_height() + 8 + version_y_pos, +16, -8, 0.25, 0.25, 32, 32, "", "link_discord", "link_discord", false);
	draw_menu_button_sprite(global.resource_pack_sprite_logo_gamebanana, link_gamebanana_x, display_get_gui_height() + 8 + version_y_pos, +16, -8, 0.25, 0.25, 32, 32, "", "link_gamebanana", "link_gamebanana", false);
	draw_menu_button_sprite(global.resource_pack_sprite_logo_instagram, link_instagram_x, display_get_gui_height() + 8 + version_y_pos, +16, -8, 0.25, 0.25, 32, 32, "", "link_instagram", "link_instagram", false);
	draw_menu_button_sprite(global.resource_pack_sprite_logo_reddit, link_reddit_x, display_get_gui_height() + 8 + version_y_pos, +16, -8, 0.25, 0.25, 32, 32, "", "link_reddit", "link_reddit", false);
	draw_menu_button_sprite(global.resource_pack_sprite_logo_twitter, link_twitter_x, display_get_gui_height() + 8 + version_y_pos, +16, -8, 0.25, 0.25, 32, 32, "", "link_twitter", "link_twitter", false);
	draw_menu_button_sprite(global.resource_pack_sprite_logo_wiki, link_wiki_x, display_get_gui_height() + 8 + version_y_pos, +16, -8, 0.25, 0.25, 32, 32, "", "link_wiki", "link_wiki", false);
	
	if (key_a_pressed)
	and (menu == "link_discord")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, link_discord_x, display_get_gui_height() + 8 + version_y_pos, link_discord_x + 32, display_get_gui_height() + 8 + version_y_pos + 32))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_discord));
		menu_delay = 3;
	}
	else
	if (key_a_pressed)
	and (menu == "link_gamebanana")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, link_gamebanana_x, display_get_gui_height() + 8 + version_y_pos, link_gamebanana_x + 32, display_get_gui_height() + 8 + version_y_pos + 32))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_gamebanana));
		menu_delay = 3;
	}
	else
	if (key_a_pressed)
	and (menu == "link_instagram")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, link_instagram_x, display_get_gui_height() + 8 + version_y_pos, link_instagram_x + 32, display_get_gui_height() + 8 + version_y_pos + 32))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_instagram));
		menu_delay = 3;
	}
	else
	if (key_a_pressed)
	and (menu == "link_reddit")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, link_reddit_x, display_get_gui_height() + 8 + version_y_pos, link_reddit_x + 32, display_get_gui_height() + 8 + version_y_pos + 32))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_reddit));
		menu_delay = 3;
	}
	else
	if (key_a_pressed)
	and (menu == "link_twitter")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, link_twitter_x, display_get_gui_height() + 8 + version_y_pos, link_twitter_x + 32, display_get_gui_height() + 8 + version_y_pos + 32))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_twitter));
		menu_delay = 3;
	}
	else
	if (key_a_pressed)
	and (menu == "link_wiki")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, link_wiki_x, display_get_gui_height() + 8 + version_y_pos, link_wiki_x + 32, display_get_gui_height() + 8 + version_y_pos + 32))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_wiki));
		menu_delay = 3;
	}
}
#endregion /* Links END */

#region /* Hide Fullscreen and Version text / Set certain variables to default value */
if (menu == "main_game")
or (menu == "leveleditor")
or (menu == "options")
or (menu == "language_shortcut")
or (menu == "accessibility_shortcut")
or (menu == "profile_shortcut")
or (menu == "credits")
or (menu == "quit")
or (menu == "link_discord")
or (menu == "link_gamebanana")
or (menu == "link_instagram")
or (menu == "link_reddit")
or (menu == "link_twitter")
or (menu == "link_wiki")
{
	if (global.play_attract_demo = false)
	{
		
		#region /* Character select Accept Selection */
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		player_start_game = false;
		#endregion /* Character select Accept Selection END */

		#region /* What player can enter a name */
		can_input_player1_name = false;
		can_input_player2_name = false;
		can_input_player3_name = false;
		can_input_player4_name = false;
		#endregion /* What player can enter a name END */
	
		show_title_logo = true;
		if (global.enable_links == true)
		{
			version_y_pos = lerp(version_y_pos, -32 - 8, 0.1);
		}
		else
		{
			version_y_pos = lerp(version_y_pos, 0, 0.1);
		}
	}
	else
	{
		show_title_logo = false;
		version_y_pos = lerp(version_y_pos, 128, 0.1);
	}
}
else
{
	show_title_logo = false;
	version_y_pos = lerp(version_y_pos, 128, 0.1);
}
#endregion /* Hide Fullscreen and Version text / Set certain variables to default value END */

#region /* Draw Title Screen */
if (global.title_logo_index >= 0)
and (global.title_logo_index != undefined)
and (global.title_logo_index != "")
{
	draw_sprite_ext(global.title_logo_index, image_index, display_get_gui_width() * 0.5 + title_x, display_get_gui_height() * 0.5 - 100 + title_y, 402 / sprite_get_height(global.title_logo_index) * title_xscale, 402 / sprite_get_height(global.title_logo_index) * title_yscale, 0, c_white, title_alpha);
}

if (menu != "select_custom_level")
and (menu != "level_editor_play")
and (menu != "level_editor_make")
and (menu != "import_export_level")
and (menu != "delete_level")
and (show_title_logo == true)
{
	title_x = lerp(title_x, 0, 0.1);
	title_y = lerp(title_y, scr_wave(0, 40, 4.5, 0), 0.1);
	title_alpha = lerp(title_alpha, 1, 0.1);
	title_xscale = lerp(title_xscale, 1, 0.1);
	title_yscale = lerp(title_yscale, 1, 0.1);
}
else
if (global.play_attract_demo = false)
{
	title_x = lerp(title_x, 0, 0.1);
	title_y = lerp(title_y, - 800, 0.1);
	title_alpha = lerp(title_alpha, 0, 0.1);
	title_xscale = lerp(title_xscale, 1, 0.1);
	title_yscale = lerp(title_yscale, 1, 0.1);
}
else
{
	title_x = lerp(title_x, - 800, 0.1);
	title_y = lerp(title_y, scr_wave(-200, -240, 4.5, 0), 0.1);
	title_alpha = lerp(title_alpha, 0.5, 0.1);
	title_xscale = lerp(title_xscale, 0.5, 0.1);
	title_yscale = lerp(title_yscale, 0.5, 0.1);
}
#endregion /* Draw Title Screen END */

#region /* Arcade Mode Menu */
if (global.arcade_mode == true)
{
	if (menu != "load_characters")
	and (menu != "select_character")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 100 + 80, l10n_text("Insert Coin"), global.default_text_size * 2, c_black, c_white, scr_wave(1, 0, 1, 0));
	}
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("Credit") + " " + string(global.arcade_credit), global.default_text_size * 2, c_black, c_white, 1);
	if (global.arcade_credit >= 1)
	and (menu != "load_characters")
	and (menu != "select_character")
	{
		global.player1_can_play = false;
		global.player2_can_play = false;
		global.player3_can_play = false;
		global.player4_can_play = false;
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		global.character_select_in_this_menu = "main_game";
		in_settings = false;
		global.doing_clear_check = false;
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		scr_load_character_initializing();
		menu = "how_many_people_1player";
		menu_delay = 3;
	}
}
#endregion /* Arcade Mode Menu END */

#region /* Main Menu */
if (menu == "main_game")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "leveleditor")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "options")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "language_shortcut")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "accessibility_shortcut")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "profile_shortcut")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "credits")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "quit")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "link_discord")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "link_gamebanana")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "link_instagram")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "link_reddit")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "link_twitter")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
or (menu == "link_wiki")
and (global.play_attract_demo = false)
and (global.arcade_mode = false)
{
	
	if (global.demo == false)
	{
		draw_menu_button(display_get_gui_width() * 0.5 - 185, main_game_y, l10n_text("Main Game"), "main_game", "main_game");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, level_editor_y, l10n_text("Level Editor"), "leveleditor", "leveleditor");
		var options_and_quit_y = display_get_gui_height() * 0.5 + 100 + 120 + 1;
	}
	else
	{
		draw_menu_button(display_get_gui_width() * 0.5 - 185, main_game_y, l10n_text("Play Demo"), "main_game", "main_game");
		var options_and_quit_y = display_get_gui_height() * 0.5 + 100 + 120 - 42 + 1;
	}
	
	select_custom_level_menu_open = false;
	can_input_level_name = false;
	
	#region /* Click on menu buttons */
	
	#region /* Click Main Game */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 185,
	main_game_y,
	display_get_gui_width() * 0.5 + 185,
	main_game_y + 42))
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (in_settings = false)
	or (menu == "main_game")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (in_settings = false)
	{
		global.player1_can_play = false;
		global.player2_can_play = false;
		global.player3_can_play = false;
		global.player4_can_play = false;
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		global.character_select_in_this_menu = "main_game";
		in_settings = false;
		global.doing_clear_check = false;
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		scr_load_character_initializing();
		menu = "how_many_people_1player";
		menu_delay = 3;
	}
	#endregion /* Click Main Game END */
	
	else
	
	#region /* Click Level Editor */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 185,
	level_editor_y,
	display_get_gui_width() * 0.5 + 185,
	level_editor_y + 42))
	and (mouse_check_button_released(mb_left))
	and (menu == "leveleditor")
	and (menu_delay == 0)
	and (in_settings = false)
	and (global.demo == false)
	or (menu == "leveleditor")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (in_settings = false)
	and (global.demo == false)
	{
		global.player1_can_play = false;
		global.player2_can_play = false;
		global.player3_can_play = false;
		global.player4_can_play = false;
		player1_accept_selection = - 1;
		player2_accept_selection = - 1;
		player3_accept_selection = - 1;
		player4_accept_selection = - 1;
		in_settings = false;
		
		#region /* Select Level Editor */
		if (asset_get_type("room_leveleditor") == asset_room)
		and (menu == "leveleditor")
		and (menu_delay == 0)
		and (global.demo == false)
		{
			scr_audio_play(menuvoice_leveleditor, volume_source.voice);
			global.doing_clear_check = false;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			global.character_select_in_this_menu = "level_editor";
			scr_load_character_initializing();
			menu = "how_many_people_1player";
			menu_delay = 3;
			global.level_editor_level = 1;
		}
		#endregion /* Select Level Editor END */
	
	}
	#endregion /* Click Level Editor END */
	
	else
	
	#region /* Click Options */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 185,
	options_and_quit_y + 2,
	display_get_gui_width() * 0.5,
	options_and_quit_y + 42))
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (in_settings = false)
	or (menu == "options")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (in_settings = false)
	{
		
		#region /* Play Options Voice */
		if (voice_options > noone)
		{
			audio_stop_sound(voice_game_title);
			scr_audio_play(voice_options, volume_source.voice);
		}
		#endregion /* Play Options Voice END */
		
		in_settings = true;
		can_navigate_settings_sidebar = true;
		menu = noone;
		menu_delay = 3;
	}
	#endregion /* Click Options END */
	
	else

	#region /* Click Language Shortcut */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 250,
	display_get_gui_height() * 0.5 + 100 + 140 - 20,
	display_get_gui_width() * 0.5 - 208,
	display_get_gui_height() * 0.5 + 100 + 140 + 19))
	and (menu == "language_shortcut")
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (global.show_language_shortcut == true)
	and (in_settings = false)
	or (menu == "language_shortcut")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (global.show_language_shortcut == true)
	and (in_settings = false)
	{
		menu_delay = 3;
		in_settings = true;
		can_navigate_settings_sidebar = false;
		global.settings_sidebar_menu = "language_settings";
		menu = "Language" + string(global.language_localization);
	}
	#endregion /* Click Language Shortcut END */
	
	else
	
	#region /* Language Shortcut */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 250,
	display_get_gui_height() * 0.5 + 100 + 140 - 20,
	display_get_gui_width() * 0.5 - 208,
	display_get_gui_height() * 0.5 + 100 + 140 + 19))
	and (mouse_check_button(mb_left))
	and (global.show_language_shortcut == true)
	{
		menu = "language_shortcut";
	}
	#endregion /* Language Shortcut END */
	
	else

	#region /* Click Accessibility Shortcut */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 + 208,
	display_get_gui_height() * 0.5 + 100 + 140 - 20,
	display_get_gui_width() * 0.5 + 250,
	display_get_gui_height() * 0.5 + 100 + 140 + 19))
	and (menu == "accessibility_shortcut")
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (global.show_accessibility_shortcut == true)
	
	or (menu == "accessibility_shortcut")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (global.show_accessibility_shortcut == true)
	{
		menu_delay = 3;
		in_settings = true;
		can_navigate_settings_sidebar = false;
		global.settings_sidebar_menu = "accessibility_settings";
		menu = noone;
	}
	#endregion /* Click Accessibility Shortcut END */
	
	else
	
	#region /* Accessibility Shortcut */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 + 208,
	display_get_gui_height() * 0.5 + 100 + 140 - 20,
	display_get_gui_width() * 0.5 + 250,
	display_get_gui_height() * 0.5 + 100 + 140 + 19))
	and (mouse_check_button(mb_left))
	and (global.show_accessibility_shortcut == true)
	{
		menu = "accessibility_shortcut";
	}
	#endregion /* Accessibility Shortcut END */
	
	else

	#region /* Click Profile Shortcut */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 + 208+ 50,
	display_get_gui_height() * 0.5 + 100 + 140 - 20,
	display_get_gui_width() * 0.5 + 250 + 50,
	display_get_gui_height() * 0.5 + 100 + 140 + 19))
	and (menu == "profile_shortcut")
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (global.show_profile_shortcut == true)
	and (in_settings = false)
	or (menu == "profile_shortcut")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (global.show_profile_shortcut == true)
	and (in_settings = false)
	{
		menu_delay = 3;
		in_settings = true;
		can_navigate_settings_sidebar = false;
		global.settings_sidebar_menu = "profile_settings";
		menu = noone;
	}
	#endregion /* Click Profile Shortcut END */
	
	else
	
	#region /* Profile Shortcut */
	if (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 + 208+ 50,
	display_get_gui_height() * 0.5 + 100 + 140 - 20,
	display_get_gui_width() * 0.5 + 250 + 50,
	display_get_gui_height() * 0.5 + 100 + 140 + 19))
	and (mouse_check_button(mb_left))
	and (global.show_profile_shortcut == true)
	{
		menu = "profile_shortcut";
	}
	#endregion /* Profile Shortcut END */
	
	else
	
	#region /* Click Credits */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 370, display_get_gui_height() - 42, display_get_gui_width(), display_get_gui_height()))
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (in_settings = false)
	or (menu == "credits")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (in_settings = false)
	{
		if (!instance_exists(obj_credits))
		{
			instance_create_depth(x, y, 0, obj_credits);
		}
		in_settings = false;
		menu = "play_credits";
		menu_delay = 3;
		can_navigate_settings_sidebar = false;
	}
	#endregion /* Click Credits END */
	
	else
	
	#region /* Click Quit */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5, options_and_quit_y + 2, display_get_gui_width() * 0.5 + 185, options_and_quit_y + 42))
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	and (in_settings = false)
	and (global.convention_mode == false)
	and (global.enable_options_for_pc == true)
	or (menu == "quit")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (in_settings = false)
	and (global.convention_mode == false)
	and (global.enable_options_for_pc == true)
	{
		in_settings = false;
		menu = "quit_game_no";
		menu_delay = 3;
	}
	#endregion /* Click Quit END */
	
	#endregion /* Click on menu buttons END */
	
	if (menu == "main_game")
	{
		global.character_select_in_this_menu = "main_game";
	}
	
	if (asset_get_type("room_leveleditor") == asset_room)
	and (menu == "leveleditor")
	{
		if (global.level_editor_level > 0)
		{
			global.level_editor_level = 0;
		}
		global.character_select_in_this_menu = "level_editor"; /* No custom level is selected before you go into the level editor */
	}
	
	if (global.convention_mode == false)
	and (global.enable_options_for_pc == true)
	{
		draw_menu_button_sprite(spr_menu_button_short, display_get_gui_width() * 0.5 - 185, options_and_quit_y, 0, 0, 1, 1, 185, 42, l10n_text("Options"), "options", "options", true);
		draw_sprite_ext(spr_icons_cogwheel, 0, display_get_gui_width() * 0.5 - 185 + 8, options_and_quit_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button_sprite(spr_menu_button_short, display_get_gui_width() * 0.5, options_and_quit_y, 0, 0, 1, 1, 185, 42, l10n_text("Quit"), "quit", "quit", true);
		if (menu == "quit")
		{
			draw_menu_button_sprite(spr_menu_button_short, display_get_gui_width() * 0.5 - 185, options_and_quit_y, 0, 0, 1, 1, 185, 42, l10n_text("Options"), "options", "options", true);
			draw_sprite_ext(spr_icons_cogwheel, 0, display_get_gui_width() * 0.5 - 185 + 8, options_and_quit_y + 21, 1, 1, 0, c_white, 1);
		}
	}
	else
	if (global.convention_mode == false)
	and (global.enable_options_for_pc == false)
	{
		draw_menu_button(display_get_gui_width() * 0.5 - 185, options_and_quit_y, l10n_text("Options"), "options", "options");
	}
	
	draw_menu_button_sprite(spr_noone, display_get_gui_width() - 370, display_get_gui_height() - 42, 0, 0, 1, 1, 370, 42, l10n_text("Made by") + " " + (global.company_name), "credits", "play_credits", true);
	
	if (global.show_language_shortcut == true)
	and (global.convention_mode == false)
	{
		if (menu == "language_shortcut")
		{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 250, display_get_gui_height() * 0.5 + 100 + 140 - 20, display_get_gui_width() * 0.5 - 208, display_get_gui_height() * 0.5 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 - 250, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_green, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 - 250, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_gray, 1);}
		draw_sprite_ext(spr_settings_icons, 12, display_get_gui_width() * 0.5 - 230, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
		else{if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 250, display_get_gui_height() * 0.5 + 100 + 140 - 20, display_get_gui_width() * 0.5 - 208, display_get_gui_height() * 0.5 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 - 250, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_lime, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 - 250, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
		draw_sprite_ext(spr_settings_icons, 12, display_get_gui_width() * 0.5 - 230, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
	}

	if (global.show_accessibility_shortcut == true)
	and (global.convention_mode == false)
	{
		if (menu == "accessibility_shortcut")
		{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 + 208, display_get_gui_height() * 0.5 + 100 + 140 - 20, display_get_gui_width() * 0.5 + 250, display_get_gui_height() * 0.5 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_green, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_gray, 1);}
		draw_sprite_ext(spr_settings_icons, 1, display_get_gui_width() * 0.5 + 230, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
		else{if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 + 208, display_get_gui_height() * 0.5 + 100 + 140 - 20, display_get_gui_width() * 0.5 + 250, display_get_gui_height() * 0.5 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_lime, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
		draw_sprite_ext(spr_settings_icons, 1, display_get_gui_width() * 0.5 + 230, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
	}

	if (global.show_profile_shortcut == true)
	and (global.convention_mode == false)
	{
		if (menu == "profile_shortcut")
		{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 + 208+ 50, display_get_gui_height() * 0.5 + 100 + 140 - 20, display_get_gui_width() * 0.5 + 250 + 50, display_get_gui_height() * 0.5 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208+ 50, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_green, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208+ 50, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_gray, 1);}
		draw_sprite_ext(spr_settings_icons, 7, display_get_gui_width() * 0.5 + 230 + 50, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
		else{if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 + 208+ 50, display_get_gui_height() * 0.5 + 100 + 140 - 20, display_get_gui_width() * 0.5 + 250 + 50, display_get_gui_height() * 0.5 + 100 + 140 + 19)){draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208+ 50, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_lime, 1);}else{draw_sprite_ext(spr_menu_button_small, 0, display_get_gui_width() * 0.5 + 208+ 50, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
		draw_sprite_ext(spr_settings_icons, 7, display_get_gui_width() * 0.5 + 230 + 50, display_get_gui_height() * 0.5 + 100 + 140, 1, 1, 0, c_white, 1);}
	}
}
#endregion /* Main Menu END */

scr_options_menu(); /* Options */

scr_quit_to_desktop_menu("quit");

#region /* Select Custom Level Menu */
if (level_editor_template_select == true)
and (global.play_attract_demo = false)
{
	select_custom_level_menu_open = false;
	scr_select_official_level_menu();
	
	if (window_get_width() >= 1670)
	{
		row = 4;
	}
	else
	if (window_get_width() >= 1276)
	{
		row = 3;
	}
	else
	if (window_get_width() >= 882)
	{
		row = 2;
	}
	else
	if (window_get_width() >= 488)
	{
		row = 1;
	}
	
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_main_levels)))
	if (global.controls_used_for_menu_navigation == "mouse")
	and (can_input_level_name == false)
	and (can_navigate == true)
	{
		for(i = 0;
		i < ds_list_size(global.thumbnail_sprite);
		i += 1)
		{
			column = floor(i / row);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 394 * (i - column * row) + 100 - 3, 226 * (column - scroll) + 250 - 3, 394 * (i - column * row) + 100 + 384 + 3, 226 * (column - scroll) + 250 + link_wiki_x + 3))
			{
				if (menu != "level_editor_play")
				and (menu_delay == 0)
				{
					menu = "level_editor_play";
				}
				global.select_level_index = i;
			}
		}
	}
}
else
if (select_custom_level_menu_open == true)
and (global.play_attract_demo = false)
{
	level_editor_template_select = false;
	scr_select_custom_level_menu();
	scr_custom_level_select_with_the_mouse()
	scr_draw_upload_level_menu(); /* Draw upload level menu above everything */
}
#endregion /* Select Custom Level Menu END */

if (menu == "search_id_ok")
or (menu == "search_id_cancel")
or (menu == "searching_for_id")
or (menu == "searched_file_downloaded_play")
or (menu == "searched_file_downloaded_make")
or (menu == "searched_file_downloaded_back")
or (menu == "searching_for_id_back")
{
	scr_draw_menu_search_id(content_type); /* Display the search for ID screen */
}

scr_character_select_menu_draw();

#region /* Menu Navigation */
if (menu_joystick_delay <= 0)
and (input_key == false)
and (can_navigate == true)
and (menu_delay == 0)
{

	/* Level Editor Menu */
	if (global.level_editor_level<= 0)
	{
		global.level_editor_level = 1;
	}

	#region /* Navigate Main Menu */
	if (menu == "main_game")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "credits";
		}
		else
		if (key_down)
		and (global.demo == false)
		{
			menu_delay = 3;
			menu = "leveleditor";
		}
		else
		if (key_down)
		and (global.convention_mode == false)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_down)
		and (global.convention_mode == true)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu == "leveleditor")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		and (global.convention_mode == false)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_down)
		and (global.convention_mode == true)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu == "options")
	{
		if (key_left)
		and (global.show_language_shortcut == true)
		and (global.convention_mode == false)
		{
			menu_delay = 3;
			menu = "language_shortcut";
		}
		else
		if (key_right)
		or (key_left)
		and (global.show_language_shortcut = false)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			and (global.enable_options_for_pc == true)
			{
				menu = "quit";
			}
			else
			{
				menu = "main_game";
			}
		}
		else
		if (key_up)
		and (global.demo == false)
		{
			menu_delay = 3;
			menu = "leveleditor";
		}
		else
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu == "language_shortcut")
	{
		if (key_right)
		{
			menu_delay = 3;
			menu = "options";
		}
	}
	else
	if (menu == "accessibility_shortcut")
	{
		if (key_left)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			and (global.enable_options_for_pc == true)
			{
				menu = "quit";
			}
			else
			{
				menu = "main_game";
			}
		}
		else
		if (key_right)
		and (global.show_profile_shortcut == true)
		and (global.convention_mode == false)
		{
			menu_delay = 3;
			menu = "profile_shortcut";
		}
	}
	else
	if (menu == "profile_shortcut")
	{
		if (key_left)
		{
			menu_delay = 3;
			menu = "accessibility_shortcut";
		}
	}
	else
	if (menu == "quit")
	{
		if (key_left)
		and (global.convention_mode == false)
		or (key_right)
		and (global.show_accessibility_shortcut = false)
		and (global.convention_mode == false)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_right)
		and (global.show_accessibility_shortcut == true)
		and (global.convention_mode == false)
		{
			menu_delay = 3;
			menu = "accessibility_shortcut";
		}
		else
		if (key_up)
		and (global.demo == false)
		{
			menu_delay = 3;
			menu = "leveleditor";
		}
		else
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu == "credits")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			and (global.enable_options_for_pc == true)
			{
				menu = "quit";
			}
			else
			{
				menu = "options";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_wiki";
		}
		else
		if (key_right)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_discord";
		}
	}
	else
	if (menu == "link_wiki")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			{
				menu = "options";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_twitter";
		}
		else
		if (key_right)
		{
			menu_delay = 3;
			menu = "credits";
		}
	}
	else
	if (menu == "link_twitter")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			{
				menu = "options";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_reddit";
		}
		else
		if (key_right)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_wiki";
		}
	}
	else
	if (menu == "link_reddit")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			{
				menu = "options";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_instagram";
		}
		else
		if (key_right)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_twitter";
		}
	}
	else
	if (menu == "link_instagram")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			{
				menu = "options";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_gamebanana";
		}
		else
		if (key_right)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_reddit";
		}
	}
	else
	if (menu == "link_gamebanana")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			{
				menu = "options";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_discord";
		}
		else
		if (key_right)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_instagram";
		}
	}
	else
	if (menu == "link_discord")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.convention_mode == false)
			{
				menu = "options";
			}
			else
			{
				menu = "leveleditor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left)
		{
			menu_delay = 3;
			menu = "credits";
		}
		else
		if (key_right)
		and (global.enable_links == true)
		{
			menu_delay = 3;
			menu = "link_gamebanana";
		}
	}
	#endregion /* Navigate Main Menu END */

}
#endregion /* Menu Navigation END */

#region /* Accept */

#region /* Select Quit */
if (menu == "quit")
and (key_a_pressed)
and (menu_delay == 0)
and (global.convention_mode == false)
and (global.enable_options_for_pc == true)
{
	menu = "quit_game_no";
	menu_delay = 3;
}
#endregion /* Select Quit END */

#endregion /* Accept END */

#region /* Start Game */
if (iris_xscale <= 0.001)
and (menu_delay > 999) /* Make sure you can only start the game when the menu delay is set to over 999, as that's when the iris xscale is set to zoom in */
{
	
	#region /* Play or Make Level Editor */
	if (menu != "select_character")
	and (menu != "back_from_character_select")
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			scr_delete_sprite_properly(title_screen_background);
			if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
			and (global.create_level_from_template == false)
			{
				/* Update the "global level name" before updating all backgrounds and going to the level editor */
				global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
			}
			scr_update_all_backgrounds();
			room_goto(room_leveleditor);
		}
		/* The variables "doing clear check", "actually play edited level", and "play edited level" should be set before doing "menu delay = 9999" to zoom the iris xscale */
	}
	#endregion /* Play or Make Level Editor END */
	
	else
	
	#region /* Load File */
	if (menu == "select_character")
	or (menu == "back_from_character_select")
	{
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		if (asset_get_type("room_world_map") == asset_room)
		{
			scr_delete_sprite_properly(title_screen_background);
			scr_config_save();
			room_goto(room_world_map);
		}
	}
	#endregion /* Load File END */

}
#endregion /* Start Game END */

else

#region /* Back */
if (key_b_pressed)
{
	if (menu == "1player")
	or (menu == "2player")
	or (menu == "3player")
	or (menu == "4player")
	{
		if (menu_delay == 0)
		{
			if (global.character_select_in_this_menu == "main_game")
			{
				menu = "main_game";
				menu_delay = 3;
			}
			else
			{
				menu = "leveleditor";
				menu_delay = 3;
			}
		}
	}
}
#endregion /* Back END */

#region /* Menu Navigation Delay */
if (menu_delay > 0)
{
	menu_delay -= 1;
}
if (menu_delay < 0)
{
	menu_delay = 0;
}
#endregion /* Menu Navigation Delay END */

#region /* If player object is present, destroy the player object */
if (instance_exists(obj_player))
{
	with(obj_player)
	{
		instance_destroy();
	}
}
#endregion /* If player object is present, destroy the player object END */

scr_menu_navigation_with_joystick_delay();
scr_debug_screen();
scr_draw_cursor_mouse();

#region /* Have a black screen at the first frame so transitions look natural */
if (black_screen_at_start_delay < 1)
{
	draw_rectangle_color(0, 0, display_get_gui_width() * 3, display_get_gui_height() * 3, c_black, c_black, c_black, c_black, false);
	black_screen_at_start_delay += 1;
}
#endregion /* Have a black screen at the first frame so transitions look natural END */

scr_draw_darken_screen_when_window_is_unfocused();

#region /* Draw Iris Transitions */

#region /* Iris Zooming */
if (menu_delay > 999)
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

#endregion /* Iris Zooming END */

#region /* Loading Screen */
if (menu == "load_custom_level")
or (menu == "load_characters")
or (menu == "load_official_level_template")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	global.loading_spinning_angle -= 10;
	draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 +64, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 +64 + 32, string(file_found), global.default_text_size, c_white, c_black, 1);
}
#endregion /* Loading Screen END */

if (global.enable_transitions == true)
{
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, iris_xscale, iris_yscale, 0, c_black, 1);
		}
		draw_rectangle_color(0, 0, display_get_gui_width()* 2, display_get_gui_height() * 0.5 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, display_get_gui_width() * 0.5 - iris_xscale * 128, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(display_get_gui_width() * 0.5 + iris_xscale * 128 - 1, 0, display_get_gui_width()* 2, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, display_get_gui_height() * 0.5 + iris_yscale * 128, display_get_gui_width()* 2, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /* Draw Iris Transitions END */