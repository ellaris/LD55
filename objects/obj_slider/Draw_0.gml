/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


draw_text(x,y+8,label+" "+string(round(value*100))+"%")

draw_set_color(c_black);

draw_rectangle(x,y,x+width,y+3,false);

draw_set_color(c_aqua);
draw_rectangle(x+width*value-2,y-3,x+width*value+2,y+6,false);
if(mouse_check_button(mb_left) and point_in_rectangle(mouse_x,mouse_y, x,y-3,x+width,y+6))
{
	value = (mouse_x-x)/width
	if(action)
		script_execute(action);
	
}
draw_set_color(c_white);

