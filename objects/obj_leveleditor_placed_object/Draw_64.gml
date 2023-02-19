if (global.actually_play_edited_level == false)
{
	if (modify_object_menu == true)
	{
		var get_window_height = display_get_gui_height();
		var get_window_width = display_get_gui_width();
		if (object == level_object_id.id_npc)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		
			scr_draw_text_outlined(get_window_width * 0.5, 64, "Edit NPC", global.default_text_size * 1.5);
		}
		else
		{
			modify_object_menu = false;
		}
	}
}