if (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
{
	image_index = obj_camera.image_index;
}

#region /* Bounce up */
if (bounce_up == true)
{
	if (delay >= delay_time)
	{
		if (basic_collectible_sound = false)
		{
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			basic_collectible_sound = true;
		}
		depth = - 100;
		visible = true;
		
		#region /* Set the gravity */
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		#endregion /* Set the gravity END */
		
		if (vspeed > 0)
		and (y > ystart - 32)
		or (delay >= delay_time + 60)
		{
			score += 200;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_score_timer = global.hud_hide_time * 60;
				}
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				with(instance_nearest(x, y, obj_player))
				{
					basic_collectibles += 1;
				}
			}
			global.basic_collectibles += 1;
			
			#region /* Get 1-up if you get 100 basic collectibles */
			if (global.basic_collectibles > 99) /* After the code where you collect the basic collectible, then check if you have collected 100 basic collectibles */
			{
				global.basic_collectibles = 0;
				if (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						hud_show_lives_timer = global.hud_hide_time * 60;
					}
				}
				if (asset_get_type("obj_score_up") == asset_object)
				and (asset_get_type("obj_player") == asset_object)
				and (instance_exists(obj_player))
				{
					with(instance_create_depth(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y - 16, 0, obj_score_up))
					{
						score_up = "1-up";
					}
				}
				else
				if (asset_get_type("obj_score_up") == asset_object)
				{
					with(instance_create_depth(x, y - 16, 0, obj_score_up))
					{
						score_up = "1-up";
					}
				}
			}
			#endregion /* Get 1-up if you get 100 basic collectibles END */
			
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
				}
			}
			effect_create_above(ef_ring, x, y, 0, c_white);
			instance_destroy();
		}
	}
	else
	{
		delay += 1;
		visible = false;
		y = ystart;
	}
	#region /* Don't go outside view boundary */
	if (x < camera_get_view_x(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + 32;
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32;
	}
	if (y < camera_get_view_y(view_camera[view_current]) + 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + 32;
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
	}
	#endregion /* Don't go outside view boundary END */
}
#endregion /* Bounce up END */