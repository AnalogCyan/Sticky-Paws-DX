if (die == false)
{
	#region /* Push out of the solid object */
	if (position_meeting(x, bbox_bottom + 1, other))
	or (position_meeting(x, bbox_bottom + 2, other))
	or (position_meeting(x, bbox_bottom + 3, other))
	or (position_meeting(x, bbox_bottom + 4, other))
	
	or (position_meeting(bbox_left, bbox_bottom + 1, other))
	or (position_meeting(bbox_left, bbox_bottom + 2, other))
	or (position_meeting(bbox_left, bbox_bottom + 3, other))
	or (position_meeting(bbox_left, bbox_bottom + 4, other))
	
	or (position_meeting(bbox_right, bbox_bottom + 1, other))
	or (position_meeting(bbox_right, bbox_bottom + 2, other))
	or (position_meeting(bbox_right, bbox_bottom + 3, other))
	or (position_meeting(bbox_right, bbox_bottom + 4, other))
	{
		y -= 1;
	}
	#endregion /* Push out of the solid object END */

	#region /* Landing on solid object */
	if (position_meeting(x, bbox_bottom + 1, other))
	and (vspeed > 0)
	or (position_meeting(bbox_left, bbox_bottom + 1, other))
	and (vspeed > 0)
	or (position_meeting(bbox_right, bbox_bottom + 1, other))
	and (vspeed > 0)
	{
		if (vspeed > 2)
		{
			if (instance_exists(obj_foreground_secret))
			and (place_meeting(x, y, obj_foreground_secret))
			and (obj_foreground_secret.image_alpha < 0.5)
			or (instance_exists(obj_foreground_secret))
			and (!place_meeting(x, y, obj_foreground_secret))
			{
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				and (obj_camera.iris_xscale > 1)
				{
					effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x - 16 - 8,bbox_bottom- 8, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
					effect_create_above(ef_smoke, x + 16 + 8,bbox_bottom- 8, 0, c_white);
				}
			}
			draw_xscale = 1.25;
			draw_yscale = 0.75;
		}
		vspeed = 0;
		gravity = 0;
	}
}
#endregion /* Landing on solid object END */