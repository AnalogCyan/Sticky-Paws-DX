/// @desc scr_make_color_hsv_transition(variable_min, variable_max, hue_min, hue_max, saturation_min, saturation_max, value_min, value_max)
/// @arg variable_min
/// @arg variable_max
/// @arg hue_min
/// @arg hue_max
/// @arg saturation_min
/// @arg saturation_max
/// @arg value_min
/// @arg value_max

function scr_make_color_hsv_transition(variable_min, variable_max, hue_min = 0, hue_max = 100, saturation_min = 255, saturation_max = 255, value_min = 255, value_max = 255)
{
	var color = make_color_hsv(clamp(hue_max / variable_max * variable_min, hue_min, hue_max), clamp(saturation_max / variable_max * variable_min, saturation_min, saturation_max), clamp(value_max / variable_max * variable_min, value_min, value_max));
	return color;
}