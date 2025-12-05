///@description Move and swap cards
if (mouse_check_button_pressed(mb_left))
{
    dragged = collision_point(mouse_x,mouse_y, obj_card,0,0);
	if (dragged != noone) with (dragged)
	{
	    dx = x - mouse_x;
		dy = y - mouse_y;
	}
}

if (mouse_check_button_released(mb_left)) 
{
	with (dragged)
	{
		//if object is clicked and not moved
	    if (x == last_x && y == last_y)
		{
		    //cycle through index 
			col_index ++;
			if (col_index > 4) col_index = 1;
			
			//runs code switch to set card colour
			alarm[0] = 1; 
		}
		
		var _t = collision_point(mouse_x,mouse_y, obj_card,0,true);
		if (_t != noone) //if on top of other card
		{
		    other.target = _t;
			//place in target's position
			x = _t.x;
			y = _t.y;			
			
			//send target to dragged card's prior position
			_t.x = last_x;
			_t.y = last_y;
			
			//store new positions
			_t.last_x = _t.x;
			_t.last_y = _t.y;
			last_x = x;
			last_y = y;
			
		}
		else //if no target is found
		{
			//send to previous position
		    x = last_x;
			y = last_y;
		}
	}
	dragged = noone;
}


if (dragged != noone) with (dragged)
{	
	x = mouse_x + dx;
	y = mouse_y + dy;
}

//right click on cards
if (mouse_check_button_released(mb_right)) 
{
    var _inst = collision_point(mouse_x,mouse_y, obj_card,0,0);
	_inst.col_index = 0; //set to white
	_inst.alarm[0] = 1;
}

//sw = display_get_gui_width()/columns;
//sh = display_get_gui_height()/rows;

