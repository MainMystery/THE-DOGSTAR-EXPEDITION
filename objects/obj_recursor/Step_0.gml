x += vel

if (x > 608) instance_destroy(self)


if (dir_escol)  image_angle += vel_gir
else			image_angle -= vel_gir

//buraco negro
if (instance_exists(obj_black_hole))
{
	var dir_ = point_direction(x,y,obj_black_hole.x,obj_black_hole.y)
	var dist = point_distance(x,y,obj_black_hole.x,obj_black_hole.y)
	
	puss += 0.01
	
	if (place_meeting(x,y,obj_black_hole)) instance_destroy(self)
	
	x += lengthdir_x(puss,dir_)
	y += lengthdir_y(puss,dir_)
	
	if (dist <= 150)
	{
		image_xscale = lerp(image_xscale,0,0.03)
		image_yscale = lerp(image_yscale,0,0.03)
	}
	
	if (dist <= 200) puss += 0.02
	
}

// player pegou
if (place_meeting(x,y,obj_dogstar))
{
	//pegou uma caixa
	if (caixa) 
	{
		ganho = irandom_range(20,55)
		obj_dogstar.ganhou_col = c_yellow
	}
	else 
	{
		ganho = irandom_range(5,8)
		obj_dogstar.ganhou_col = c_white
	}

	obj_dogstar.dir = irandom_range(-30,30)
	obj_dogstar.tamx = random_range(0.5,3)
	obj_dogstar.tamy = random_range(0.5,3)
	obj_dogstar.ganhou = ganho
	obj_dogstar.ganhou_alpha = 10
	
	global.qtd_radianita += ganho
	
	tocar_som(snd_money)
	
	instance_destroy(self)
}