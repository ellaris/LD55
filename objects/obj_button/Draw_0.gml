/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


draw_set_color(c_blue)
draw_rectangle(x,y,x+button_width,y+button_height, false);

if(point_in_rectangle(mouse_x,mouse_y,x,y,x+button_width,y+button_height))
{
	draw_set_color(c_aqua);
	draw_rectangle(x,y,x+button_width,y+button_height, true);
	if(not is_undefined(action) and mouse_check_button_pressed(mb_left))
		script_execute(action);
}

draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + button_width/2, y + button_height/2, label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
