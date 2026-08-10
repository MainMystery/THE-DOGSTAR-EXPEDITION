if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

depth = -9999

image_xscale = lerp(image_xscale,8,0.1)
image_yscale = lerp(image_yscale,8,0.2)

if (delay > 0) delay --
else if (delay <= 0)
{
	image_alpha = lerp(image_alpha,0,0.1)
	
	if (image_alpha <= 0) instance_destroy(self)
}