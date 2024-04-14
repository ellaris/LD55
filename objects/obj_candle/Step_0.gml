/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

if(instance_place(x,y,obj_fireplace))
	instance_destroy();

if(lit)
	if(irandom(20) == 0 )
		part_particles_create(obj_control.part_sys,x+irandom(sprite_width/2)-sprite_width/4,y,obj_control.part_type_fire,1);
