var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

if (os_type == os_linux)
{
	var show_copy_to_clipboard_button = false;
	if (menu == "copy_to_clipboard")
	{
		menu = "back_open_folder_text";
	}
}
else
{
	var show_copy_to_clipboard_button = true;
}

draw_set_alpha(image_alpha * 0.99);
draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var key_open_localappdata_x = get_window_width * 0.5 - 238;

if (os_type == os_windows)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("Add custom things in Local Appdata"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, 91, key_open_localappdata_x, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 38, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, ord("R"), key_open_localappdata_x + 74, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(key_open_localappdata_x + 110, get_window_height * 0.5 - 90, l10n_text("Then type") + " " + "%localappdata%", global.default_text_size * 1.1, c_black, c_white, image_alpha);
}
else
if (os_type == os_macosx)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("Add custom things in Finder"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, vk_shift, key_open_localappdata_x, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 38, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, 91, key_open_localappdata_x + 74, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 110, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, ord("G"), key_open_localappdata_x + 146, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(key_open_localappdata_x + 182, get_window_height * 0.5 - 90, l10n_text("Then type path name"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
}
else
if (os_type == os_linux)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("Add custom things in .config"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, vk_alt, key_open_localappdata_x, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 38, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, vk_f2, key_open_localappdata_x + 74, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(key_open_localappdata_x + 110, get_window_height * 0.5 - 90, l10n_text("Then type") + " " + "~/.config/" + string(global.game_name_appdata), global.default_text_size * 1.1, c_black, c_white, image_alpha);
}

draw_set_halign(fa_center);
if (get_window_width <= 1350)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string_replace_all(string(open_folder_string), "\\", "/"), global.default_text_size * 0.75, c_black, c_white, image_alpha);
}
else
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string_replace_all(string(open_folder_string), "\\", "/"), global.default_text_size, c_black, c_white, image_alpha);
}

if (close = false)
{
	if (show_copy_to_clipboard_button == true)
	{
		draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Copy to Clipboard"), "copy_to_clipboard", "copy_to_clipboard");
	}
	draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Back"), "back_open_folder_text", "back_open_folder_text");
	draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
}

#region /* Navigate menu up and down */
if (menu == "copy_to_clipboard")
{
	if (instance_exists(obj_title))
	and (obj_title.key_up)
	or (instance_exists(obj_pause))
	and (obj_pause.key_up)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_up)
	or (instance_exists(obj_title))
	and (obj_title.key_down)
	or (instance_exists(obj_pause))
	and (obj_pause.key_down)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_down)
	{
		menu = "back_open_folder_text";
	}
}
else
if (menu == "back_open_folder_text")
{
	if (instance_exists(obj_title))
	and (obj_title.key_up)
	or (instance_exists(obj_pause))
	and (obj_pause.key_up)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_up)
	or (instance_exists(obj_title))
	and (obj_title.key_down)
	or (instance_exists(obj_pause))
	and (obj_pause.key_down)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_down)
	{
		if (show_copy_to_clipboard_button == true)
		{
			menu = "copy_to_clipboard";
		}
	}
}
#endregion /* Navigate menu up and down END */

if (show_copy_to_clipboard_button == true)
{
	if (instance_exists(obj_title))
	and (obj_title.key_a_pressed)
	and (menu == "copy_to_clipboard")
	or (instance_exists(obj_pause))
	and (obj_pause.key_a_pressed)
	and (menu == "copy_to_clipboard")
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_a_pressed)
	and (menu == "copy_to_clipboard")
	or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 42 + 39))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (mouse_check_button_pressed(mb_left))
	or (keyboard_check(vk_control))
	and (keyboard_check_pressed(ord("C")))
	{
		clipboard_set_text(string(open_folder_string));
		if (instance_exists(obj_score_up))
		{
			with(obj_score_up)
			{
				instance_destroy();
			}
		}
		with(instance_create_depth(get_window_width * 0.5, get_window_height * 0.5 + 42, 0, obj_score_up))
		{
			score_up = "Copied";
		}
	}
}

#region /* Close the open folder text by pressing any close button */
if (keyboard_check_pressed(ord("X")))
or (keyboard_check_pressed(vk_backspace))
or (keyboard_check_pressed(vk_escape))
or (mouse_check_button_pressed(mb_right))
or (mouse_check_button_pressed(mb_side1))
or (gamepad_button_check(global.player1_slot, global.player1_gamepad_button_back))
or (gamepad_button_check(global.player2_slot, global.player2_gamepad_button_back))
or (gamepad_button_check(global.player3_slot, global.player2_gamepad_button_back))
or (gamepad_button_check(global.player4_slot, global.player2_gamepad_button_back))

or (menu == "back_open_folder_text")
and (keyboard_check_pressed(ord("Z")))
or (menu == "back_open_folder_text")
and (keyboard_check_pressed(vk_space))
or (menu == "back_open_folder_text")
and (keyboard_check_pressed(vk_enter))
or (menu == "back_open_folder_text")
and (gamepad_button_check(global.player1_slot, global.player1_gamepad_button_accept))
or (menu == "back_open_folder_text")
and (gamepad_button_check(global.player2_slot, global.player2_gamepad_button_accept))
or (menu == "back_open_folder_text")
and (gamepad_button_check(global.player3_slot, global.player3_gamepad_button_accept))
or (menu == "back_open_folder_text")
and (gamepad_button_check(global.player4_slot, global.player4_gamepad_button_accept))

or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 42 + 39 + 42))
and (global.controls_used_for_menu_navigation == "mouse")
and (mouse_check_button_pressed(mb_left))
{
	close = true;
}
#endregion /* Close the open folder text by pressing any button END */

if (close == true)
{
	image_alpha = lerp(image_alpha, 0, 0.3);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
else
{
	image_alpha = lerp(image_alpha, 1, 0.3);
}

#region /* Make it so you can't click on any other button while open folder text exists */
if (instance_exists(obj_title))
{
	obj_title.menu_delay = 10;
}
if (instance_exists(obj_pause))
{
	obj_pause.menu_delay = 10;
}
if (instance_exists(obj_leveleditor))
{
	obj_leveleditor.menu_delay = 10;
}
#endregion /* Make it so you can't click on any other button while open folder text exists END */

scr_draw_cursor_mouse();