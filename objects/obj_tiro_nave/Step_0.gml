x -= vel

//distnacia do player
var dist = point_distance(x,y,obj_dogstar.x,obj_dogstar.y)

if (dist >= 800) instance_destroy(self)

//buraco negro
if (instance_exists(obj_black_hole))
{
	var dir_ = point_direction(x,y,obj_black_hole.x,obj_black_hole.y)
	var dist2 = point_distance(x,y,obj_black_hole.x,obj_black_hole.y)
	
	puss += 0.1
	
	if (place_meeting(x,y,obj_black_hole)) instance_destroy(self)
	
	x += lengthdir_x(puss,dir_)
	y += lengthdir_y(puss,dir_)
	
	if (dist2 <= 300)
	{
		image_xscale = lerp(image_xscale,0,0.03)
		image_yscale = lerp(image_yscale,0,0.03)
	}
	
	if (dist2 <= 200) puss += 0.02
}