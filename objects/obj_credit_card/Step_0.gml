/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

if(instance_place(x,y,obj_witch) or instance_place(x,y,obj_pouch) or instance_place(x,y,obj_fireplace))
	instance_destroy();
