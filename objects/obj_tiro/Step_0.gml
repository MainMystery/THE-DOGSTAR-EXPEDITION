if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

depth = -y

if (time = 1)
{
	//chip de cura
	if (global.chip_1 = 1 || global.chip_2 = 1 || global.chip_3 = 1)
	{
		cor = c_lime
	}
}

if (lanca)
{
	sprite_index = spr_lanca
	time_left = 0.01

	tam_final = 1

	vel = 5

	time = 2

	dano = 12

}

x += lengthdir_x(vel,dir)
y += lengthdir_y(vel,dir)

image_blend = cor

image_angle = dir

image_xscale = lerp(image_xscale,tam_final,0.1)
image_yscale = lerp(image_yscale,tam_final,0.2)

if (image_alpha <= 0.1)
{
	image_alpha = lerp(image_alpha,0,0.05)
	
	if (image_alpha <= 0) instance_destroy(self)
}
else 
{
	if (delay > 0) delay --
	else if (delay <= 0) image_alpha = lerp(image_alpha,0,time_left)
}

if (requichotear)
{
	var dx = lengthdir_x(vel, dir)
	var dy = lengthdir_y(vel, dir)

	var bate_x = place_meeting(x + dx, y, obj_parede)
	var bate_y = place_meeting(x, y + dy, obj_parede)

	if (bate_x)
	{
	    dir = 180 - dir
		vel += 1
	}

	if (bate_y)
	{
	    dir = -dir
		vel += 1
	}

}


//muito longe
var dist = point_distance(x,y,obj_player.x,obj_player.y)

if (dist > 12000) instance_destroy(self)