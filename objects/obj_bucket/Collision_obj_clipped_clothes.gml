if (asset_get_type("spr_bucket") == asset_sprite)
and (sprite_index = spr_bucket)
{
	if (asset_get_type("spr_bucket_clothes") == asset_sprite)
	{
		sprite_index = spr_bucket_clothes;
	}
	#region /* 1 Basic Collectible */
	if (item_inside = "none")
	{
		if (asset_get_type("obj_coin") == asset_object)
		{
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
		}
	}
	#endregion /* 1 Basic Collectible END */
	
	#region /* 8 Basic Collectibles */
	if (item_inside = "8_basic_collectibles")
	{
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			with(instance_create_depth(x - 32, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x - 24, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x - 16, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x - 8, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			with(instance_create_depth(x + 8, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 40;
			}
			with(instance_create_depth(x + 16, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 50;
			}
			with(instance_create_depth(x + 24, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 60;
			}
			with(instance_create_depth(x + 32, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 70;
			}
		}
	}
	#endregion /* 8 Basic Collectibles END */
		
		#region /* Heart Balloon */
		if (item_inside = "heart_balloon")
		{
			if (asset_get_type("obj_heart_balloon") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon))
				{
					bounce_up = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* Heart Balloon END */
		
		#region /* 1-up */
		if (item_inside = "1-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
				{
					number_of_extra_lives = 1;
					bounce_up = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 1-up END */
		
		#region /* 2-up */
		if (item_inside = "2-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
				{
					number_of_extra_lives = 2;
					bounce_up = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 2-up END */
		
		#region /* 3-up */
		if (item_inside = "3-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
				{
					number_of_extra_lives = 3;
					bounce_up = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 3-up END */
		
		#region /* Big Collectible */
		if (item_inside = "big_collectible")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 1;
					bounce_up = true;
				}
			}
		}
		#endregion /* Big Collectible END */
		
		#region /* Invincibility Powerup */
		if (item_inside = "invincibility_powerup")
		{
			if (asset_get_type("obj_invincibility_powerup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_invincibility_powerup))
				{
					bounce_up = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* Invincibility Powerup END */
	
}
with(other)
{
	instance_destroy();
}