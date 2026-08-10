if (global.pause)
{
	image_speed = 0
	exit
}


if (delay > 0) delay --
else if (delay <= 0)image_alpha = lerp(image_alpha,0,0.01)