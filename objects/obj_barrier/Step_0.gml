if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

//usando x
var dist = point_distance(x,y,obj_player.x,obj_player.y)
	


if (dist > 500) image_alpha = lerp(image_alpha,0.3,0.1)
if (dist <= 480) image_alpha = lerp(image_alpha,0,0.2)
