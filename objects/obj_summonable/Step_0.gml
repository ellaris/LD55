/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(summon_delay > 0)
	summon_delay -= 1
if(summon_delay == 0)
{
	if(not is_undefined(summon_callback))
		method_call(summon_callback,[]);
}


