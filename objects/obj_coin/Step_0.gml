/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();
life -= 1;

if(life <= 0)
{
	if(shadow_y != target_shadow)
	{
		var _dif = target_shadow - shadow_y;
		//_dif = clamp(_dif,-1,1);
		if(sign(target_velocity) != sign(_dif))
			target_velocity = -target_velocity/2;
		target_velocity += 0.01*sign(_dif);
		_dif = clamp(clamp(target_velocity,-abs(_dif),abs(_dif)),-3,3);
		shadow_y += _dif;
		y += -_dif;
	}
	else
	if(shadow_y == 0 and bounce)
	{
		target_shadow =	16;
		bounce = false;
		speed = 1+irandom(20)/10;
		direction = 90+20-irandom(40);
	}
	else
	if(shadow_y == 0 and roll)
	{
		speed = 1+irandom(20)/10;
		var _angle = 10;
		direction = 90+180*irandom(1)+_angle-irandom(_angle*2);
		roll = false;
	}
	else
	if(target_shadow != 0)
		target_shadow = 0;
	
	var _dist = point_distance(x,y,obj_control.pattern_sx+surface_get_width(obj_control.pattern_surface)/2,obj_control.pattern_sy+surface_get_height(obj_control.pattern_surface)/2);
	if(_dist > 64+24)
	{
		var _dir = point_direction(x,y,obj_control.pattern_sx+surface_get_width(obj_control.pattern_surface)/2,obj_control.pattern_sy+surface_get_height(obj_control.pattern_surface)/2);
		x = obj_control.pattern_sx+surface_get_width(obj_control.pattern_surface)/2 - lengthdir_x(64+24,_dir);
		y = obj_control.pattern_sx+surface_get_height(obj_control.pattern_surface)/2 - lengthdir_y(64+24,_dir);
	}
}