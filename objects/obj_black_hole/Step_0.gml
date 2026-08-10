if (!morri)
{
	image_xscale = lerp(image_xscale,5,0.25)
	image_yscale = lerp(image_yscale,5,0.05)
}
else
{
	image_xscale = lerp(image_xscale,0,0.25)
	image_yscale = lerp(image_yscale,0,0.05)
	
	if (image_xscale <= 0) instance_destroy(self)
}

//morrer
if (obj_dogstar.evento != "black")
{
	morri = true
}