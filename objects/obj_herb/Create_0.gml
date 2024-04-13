/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

image_xscale = choose(1, -1);

summon_herring = function()
{
	if(not obj_control.summoned_herring)
	{
		 obj_control.summoned_herring = not obj_control.summoned_herring;
		 var _herring = instance_create_layer(x,y,layer,obj_red_herring);
		 _herring.friction = 0.025;
		 _herring.speed = 1;
		 _herring.direction = 270+irandom(20)-10;
	}
}

teleport_callback = summon_herring 