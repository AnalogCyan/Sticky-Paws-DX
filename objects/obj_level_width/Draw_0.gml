if (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(x - 16, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	if (asset_get_type("spr_level_height") == asset_sprite)
	{
		draw_sprite_ext(spr_level_height, 0, x, y, 1, 1, 0, c_white, 1);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (x < 1920 + 16)
and (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x + 32, y, l10n_text("Width") + " : " + string(bbox_left), global.default_text_size, c_black, c_red, 1);
	scr_draw_text_outlined(x + 32, y + 32, l10n_text("Warning! Level width shorter than normal"), global.default_text_size * 0.75, c_black, c_red, 1);
}
else
if (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x + 32, y, l10n_text("Width") + " : " + string(bbox_left), global.default_text_size, c_black, c_white, 1);	
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */