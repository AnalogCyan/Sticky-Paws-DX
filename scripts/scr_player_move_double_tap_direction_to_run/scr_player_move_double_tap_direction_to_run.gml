function scr_player_move_double_tap_direction_to_run()
{
	
	#region /* Double-tap direction to run */
	if (double_tap_to_run == true)
	{
		if (!key_sprint)
		{
		
			#region /* Double tap left direction to run */
			if (key_left_hold)
			{
				if (double_tap_left == false)
				{
					double_tap_left = true;
					double_tap_right = false;
					double_tap_run_timer = 15;
				}
				else
				if (double_tap_left == 2)
				{
					double_tap_left = 3;
					double_tap_run_timer = 15;
				}
				else
				{
					double_tap_run_timer = 15;
				}
			}
			#endregion /* Double tap left direction to run END */
		
			else
		
			#region /* Double tap right direction to run */
			if (key_right_hold)
			{
				if (double_tap_right = false)
				{
					double_tap_right = true;
					double_tap_left = false;
					double_tap_run_timer = 15;
				}
				else
				if (double_tap_right = 2)
				{
					double_tap_right = 3;
					double_tap_run_timer = 15;
				}
				else
				{
					double_tap_run_timer = 15;
				}
			}
			#endregion /* Double tap right direction to run END */
		
			else
			if (!key_left_hold)
			and (!key_right_hold)
			{
				if (double_tap_left == true)
				and (double_tap_run_timer <= 28)
				{
					double_tap_left = 2;
				}
				else
				if (double_tap_right == true)
				and (double_tap_run_timer <= 28)
				{
					double_tap_right = 2;
				}
				double_tap_run_timer -= 1;
			}
		}
		else
		{
			double_tap_left = false;
			double_tap_right = false;
			double_tap_run_timer = 0;
		}
	}
	if (double_tap_run_timer <= 0)
	{
		double_tap_run_timer = 0;
		double_tap_left = false;
		double_tap_right = false;
	}
	#endregion /* Double-tap direction to run END */
	
}