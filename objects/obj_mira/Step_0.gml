var x1 = alvo.x
var y1 = alvo.y

var dir = point_direction(x1,y1,mouse_x,mouse_y)
var dist = point_distance(x1,y1,mouse_x,mouse_y)

if (!global.trop_position) dist = clamp(dist,-100,100)
else dist = clamp(dist,-300,300)

var x2 = x1 + lengthdir_x(dist,dir)
var y2 = y1 + lengthdir_y(dist div 2,dir)

if (!instance_exists(obj_item_novo))
{
	x = lerp(x,x2,0.1)
	y = lerp(y,y2,0.1)
}
else
{
	if (!obj_item_novo.pegou)
	{
		x = lerp(x,x2,0.1)
		y = lerp(y,y2,0.1)
	}
}



