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
		_dif = clamp(_dif,-1,1);
		shadow_y += _dif;
		y += -_dif;
	}
	else
	if(shadow_y == 0 and bounce)
	{
		target_shadow =	16;
		bounce = false;
		speed = 1+irandom(20)/10;
		direction = irandom(360);
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
}