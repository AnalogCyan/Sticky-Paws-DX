/* Collision Event with a solid object */
#region /* Push out of the solid object */
while (place_meeting(x, y, other))
{
	x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}
#endregion /* Push out of the solid object END */

#region /* Landing on solid object */
if (place_meeting(x, y + 1, other))
and (vspeed >= 0)
{
	vspeed = 0;
	gravity = 0;
}
#endregion /* Landing on solid object END */

#region /* Hitting your head on ceiling */
if (position_meeting(x, bbox_top - 1, other))
{
	vspeed += 4;
	if (abs(hspeed) < 1)
	{
		hspeed = 0;
	}
}
#endregion /* Hitting your head on ceiling END */

#region /* Hitting wall to your left */
if (position_meeting(bbox_left - 1, bbox_bottom - 8, other))
or (position_meeting(bbox_left - 1, bbox_top + 8, other))
or (position_meeting(bbox_left - 1, y, other))
{
	if (hspeed <= 0)
	{
		hspeed = 0;
	}
}
#endregion /* Hitting wall to your left END */

#region /* Hitting wall to your right */
if (position_meeting(bbox_right + 1, bbox_bottom - 8, other))
or (position_meeting(bbox_right + 1, bbox_top + 8, other))
or (position_meeting(bbox_right + 1, y, other))
{
	if (hspeed >= 0)
	{
		hspeed = 0;
	}
}
#endregion /* Hitting wall to your right END */