if (!instance_exists(obj_player))
and (count > 49)
and (last_player == true)
{
	if (iris_zoom == 0)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.1);
		iris_yscale = lerp(iris_yscale, 1, 0.1);
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.1);
		iris_yscale = lerp(iris_yscale, 0, 0.1);
	}
	if (iris_xscale <= 1.1)
	{
		iris_zoom = 1;
	}
	if (asset_get_type("obj_player_lose") == asset_object)
	and (instance_exists(obj_player_lose))
	{
		if (iris_xscale < 16)
		and (global.enable_transitions == true)
		{
			if (asset_get_type("spr_iris_dead") == asset_sprite)
			{
				draw_sprite_ext(spr_iris_dead, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
			}
			else
			if (asset_get_type("spr_iris") == asset_sprite)
			{
				draw_sprite_ext(spr_iris, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
			}
			draw_rectangle_color(0, 0, room_width * 3, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, xx - iris_xscale * 128, room_height * 3, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(xx + iris_xscale * 128, 0, room_width * 3, room_height * 3, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, yy + iris_yscale * 128, room_width * 3, room_height * 3, c_black, c_black, c_black, c_black, false);
		}
	}
}
if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * default_xscale, image_yscale * default_yscale, image_angle, image_blend, image_alpha);
}

#region /* Bubble */
if (bubble == true)
{
	
	#region /* Bubble */
	draw_self();
	draw_circle_color(x, y, 52, c_black, c_black, true);
	draw_circle_color(x, y, 53, c_white, c_white, true);
	draw_circle_color(x, y, 54, c_white, c_white, true);
	draw_circle_color(x, y, 55, c_white, c_white, true);
	draw_circle_color(x, y, 56, c_black, c_black, true);
	#endregion /* Bubble END */
	
}
#endregion /* Bubble END */

#region /* Display Player Number and Name */
if (global.playergame > 0)
and (y < room_height)
and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (player == 1)
	{
		if (global.player1_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P1", global.default_text_size, c_black, global.player1_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player1_name), global.default_text_size, c_black, global.player1_color, 1);
		}
	}
	if (player == 2)
	{
		if (global.player2_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P2", global.default_text_size, c_black, global.player2_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player2_name), global.default_text_size, c_black, global.player2_color, 1);
		}
	}
	if (player == 3)
	{
		if (global.player3_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P3", global.default_text_size, c_black, global.player3_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player3_name), global.default_text_size, c_black, global.player3_color, 1);
		}
	}
	if (player == 4)
	{
		if (global.player4_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P4", global.default_text_size, c_black, global.player4_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player4_name), global.default_text_size, c_black, global.player4_color, 1);
		}
	}
}
#endregion /* Display Player Number and Name END */