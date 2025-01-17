if (distance_to_object(obj_player) < 32)
{
	if (asset_get_type("obj_player") == asset_object)
	and (position_meeting(x, bbox_top - 1, obj_player))
	and (fall < 100)
	or (asset_get_type("obj_player") == asset_object)
	and (position_meeting(bbox_left, bbox_top - 1, obj_player))
	and (fall < 100)
	or (asset_get_type("obj_player") == asset_object)
	and (position_meeting(bbox_right, bbox_top - 1, obj_player))
	and (fall < 100)
	{
		fall += 1;
		image_blend = c_red;
		if (fall > 75)
		{
			xx = random_range(x - 2.5, x + 2.5);
			yy = random_range(y - 4, y + 4);
		}
		else
		if (fall > 50)
		{
			xx = random_range(x - 2, x + 2);
			yy = random_range(y - 3, y + 3);
		}
		else
		if (fall > 25)
		{
			xx = random_range(x - 1.5, x + 1.5);
			yy = random_range(y - 2, y + 2);
		}
		else
		{
			xx = random_range(x - 1, x + 1);
			yy = random_range(y - 1, y + 1);
		}
	}
	else
	if (fall < 100)
	{
		fall = false;
		image_blend = c_white;
		xx = x;
		yy = y;
	}
}
else
if (fall < 100)
{
	fall = false;
	image_blend = c_white;
	xx = x;
	yy = y;
}
if (fall >= 100)
{
	gravity_direction = 270;
	gravity = 0.5;
	image_blend = c_red;
	xx = random_range(x - 2.5, x + 2.5);
	yy = random_range(y - 2.5, y + 2.5);
}

if (asset_get_type("spr_falling_block") == asset_sprite)
{
	mask_index = spr_falling_block;
}

#region /* Limit the vertical speed */
if (vspeed > 16)
{
	vspeed = 16;
}
#endregion /* Limit the vertical speed END */

#region /* Falling Block falling outside of view */
if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (fall >= 100)
{
	x = xstart;
	y = camera_get_view_y(view_camera[view_current]);
	instance_activate_object(self);
	respawn_timer = 60;
	fall = false;
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	image_alpha = 0;
}
if (image_alpha < 1)
{
	instance_activate_object(self);
	gravity = 0;
	respawn_timer -= 1;
	if (respawn_timer <= 0)
	{
		x = xstart;
		y = ystart;
		image_alpha = 1;
		effect_create_above(ef_smoke, x, y, 2, c_white);
	}
}
#endregion /* Falling Block falling outside of view END */