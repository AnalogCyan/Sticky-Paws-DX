if (water_level_change_speed = 0)
{
	sprite_index = spr_water_level_change_slow;
}
else
if (water_level_change_speed = 1)
{
	sprite_index = spr_water_level_change_fast;
}
else
if (water_level_change_speed = 2)
{
	sprite_index = spr_water_level_change_faster;
}

if (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_water_level") == asset_object)
and (asset_get_type("obj_water_level_change") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(obj_water_level))
and (instance_exists(obj_water_level_change))
and (place_meeting(x, y, obj_player))
{
	with (obj_water_level)
	{
		water_level_change_speed = instance_nearest(obj_player.x, obj_player.y, obj_water_level_change).water_level_change_speed;
		water_level_change_new_y = instance_nearest(obj_player.x, obj_player.y, obj_water_level_change).angle_y;
	}
}