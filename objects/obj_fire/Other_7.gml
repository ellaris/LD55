/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


var _candle = instance_place(x,y,obj_candle);
if(_candle)
{
	_candle.lit = true;
	_candle.sprite_index = spr_candle_lit;
	obj_control.recalculate_lighting();
}

instance_destroy();