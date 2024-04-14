/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(instance_number(obj_skeleton) < 1000)
repeat 2
{
	var _horizontal = irandom(1);
	var _xx = irandom(room_width)*(_horizontal) + (1-_horizontal)*room_width*irandom(1)
	var _yy = irandom(room_height)*(1-_horizontal) + (_horizontal)*room_height*irandom(1)

	var _skeleton = instance_create_layer(_xx,_yy,layer,obj_skeleton);
}

