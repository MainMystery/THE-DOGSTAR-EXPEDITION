if (time > 0)
{
	alpha = lerp(alpha,1,0.1)
	image_xscale = lerp(image_xscale,5,0.1)
	image_yscale = lerp(image_yscale,5,0.2)

	
	time --
}
else if (time <= 0)
{
	alpha = lerp(alpha,0,0.1)
	image_xscale = lerp(image_xscale,0,0.1)
	image_yscale = lerp(image_yscale,0,0.2)
	escuro = lerp(escuro,0,0.1)
}

depth = -9999