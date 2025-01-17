function scr_player_move_sprint()
{
	
	#region /* Sprint */
	if (goal == true)
	and (global.time_countdown_bonus <= 0)
	{
		speed_max = lerp(speed_max, speed_max_run, 0.1);
	}
	else
	{
		if (crouch == true)
		and (on_ground == true)
		{
			if (allow_crawl == true)
			{
				speed_max = lerp(speed_max, speed_max_walk * 0.5, 0.05);
			}
			else
			{
				speed_max = lerp(speed_max, 0, 0.05);
				hspeed = 0;
			}
		}
		else
		if (key_sprint)
		and (allow_run == true)
		or (double_tap_left == 3)
		and (allow_run == true)
		or (double_tap_right == 3)
		and (allow_run == true)
		{
			if (key_left_hold)
			and (ground_pound == false)
			or (key_right_hold)
			and (ground_pound == false)
			{
				if (invincible_timer >= true)
				and (assist_invincible == false)
				{
					speed_max = lerp(speed_max, 10, 0.1);
				}
				else
				{
					if (speed_max < speed_max_run)
					{
						speed_max = lerp(speed_max, speed_max_run, 0.1);
					}
				}
			}
		}
		else
		{
			if (on_ground == true)
			{
				if (invincible_timer >= true)
				and (assist_invincible == false)
				{
					speed_max = lerp(speed_max, 6, 0.05);
				}
				else
				{
					speed_max = lerp(speed_max, speed_max_walk, 0.05);
				}
			}
		}
	}
	#endregion /* Sprint END */
	
}