if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (instance_exists(alvo))
{
	x = alvo.x
	y = alvo.y
	
	image_alpha = lerp(image_alpha,0,life)
	
	if (image_alpha <= 0)
	{
		instance_destroy()
	}
}
else
{
	if (alvo != -10) instance_destroy()
	
	image_alpha = lerp(image_alpha,0,life)
	
	if (image_alpha <= 0 && life != 0)
	{
		instance_destroy()
	}
}