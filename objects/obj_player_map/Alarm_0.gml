#region /* Initialize Custom Character */

/* The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y */

#region /* Play as Custom Character */

if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini"))
or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini");
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini");
	}
	
	#region /* Default Xscale */
	if (ini_key_exists("values", "default_xscale"))
	{
		default_xscale = ini_read_real("values", "default_xscale", 1);
	}
	else
	{
		default_xscale = 1;
	}
	#endregion /* Default Xscale END */
	
	#region /* Default Yscale */
	if (ini_key_exists("values", "default_yscale"))
	{
		default_yscale = ini_read_real("values", "default_yscale", 1);
	}
	else
	{
		default_yscale = 1;
	}
	#endregion /* Default Yscale END */
	
}

#region /* Sprite variables */

sprite_map = scr_initialize_custom_character_sprite("map", sprite_map);
sprite_map_enter_level = scr_initialize_custom_character_sprite("map_enter_level", sprite_map_enter_level);
sprite_map_enter_level = scr_initialize_custom_character_sprite("map_enter", sprite_map_enter_level);
sprite_stand = scr_initialize_custom_character_sprite("idle", sprite_stand);
sprite_stand = scr_initialize_custom_character_sprite("stand", sprite_stand);
sprite_walk = scr_initialize_custom_character_sprite("walk", sprite_walk);

#endregion /* Sprite variables END */

#endregion /* Play as Custom Character END */

if (sprite_map > noone)
{
	sprite_index = sprite_map;
}
else
if (sprite_stand > noone)
{
	sprite_index = sprite_stand;
}
else
if (sprite_walk > noone)
{
	sprite_index = sprite_walk;
}
#endregion /* Initialize Custom Character END */

#region /* Make sure you spawn on top of a level one last time before playing */
if (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level))
and (!position_meeting(x, y, obj_level))
{
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
	xx = instance_nearest(x, y, obj_level).x;
	yy = instance_nearest(x, y, obj_level).y;
}
#endregion /* Make sure you spawn on top of a level one last time before playing END */
