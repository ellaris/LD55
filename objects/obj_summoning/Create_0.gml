/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

event_inherited();

conjure_object_type = noone;

conjure_object = function()
{
	var _type = conjure_object_type;
	if(is_array(conjure_object_type))
		_type = array_pop(conjure_object_type);
	var _obj = instance_create_layer(-100,-100,layer,_type);
	_obj.summon(summon_x,summon_y);
	_obj.life = game_get_speed(gamespeed_fps)*_obj.summon_dificulty;
	//var _sigil = instance_create_layer(x,bbox_bottom,"Sigil",obj_summon_sigil);
	summon_delay = noone;
	
	// empty container
	if(is_array(conjure_object_type) and array_length(conjure_object_type) == 0)
		image_index = 1;
}

summon_callback = conjure_object;



