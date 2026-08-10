x += lengthdir_x(vel,dir)
y += lengthdir_y(vel,dir)

//buraco negro
if (instance_exists(obj_black_hole))
{
	var dir_ = point_direction(x,y,obj_black_hole.x,obj_black_hole.y)
	var dist = point_distance(x,y,obj_black_hole.x,obj_black_hole.y)
	
	puss += 0.1
	
	if (place_meeting(x,y,obj_black_hole)) instance_destroy(self)
	
	x += lengthdir_x(puss,dir_)
	y += lengthdir_y(puss,dir_)
	
	if (dist <= 300)
	{
		tam = lerp(tam,0,0.03)
		image_xscale = tam
		image_yscale = tam
	}
	
	if (dist <= 200) puss += 0.02
	
}

image_angle += 5

image_alpha = lerp(image_alpha,0,0.05)

if (image_alpha <= 0) instance_destroy(self)