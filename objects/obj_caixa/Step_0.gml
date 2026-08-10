if (global.pause)
{
	image_speed = 0
	exit
}


depth = -bbox_bottom

//mexer
if (mexer)
{
	x = random_range(xx - 10,xx + 10)
	y = random_range(yy - 3,yy + 3)
	mexer = false
}


//acido
if (!acido)
{
	//abrir com gato
	if (instance_exists(obj_gato_schrodinger))
	{
		if (dono != noone) abrir_fechar = true
		else abrir_fechar = false
	}
}
else
{
	if (!abrir_fechar) abrir_fechar = true
}
//fechar
if (!abrir_fechar)
{
	if (image_index < sprite_get_number(sprite_index) - 1)
	{
		image_index += vel
	}
	else if (image_index >= sprite_get_number(sprite_index) - 1)
	{
		image_index = sprite_get_number(sprite_index) - 1
	}
}
//abrir
else
{
	if (image_index > 0)
	{
		image_index -= vel
	}
	else if (image_index <= 0)
	{
		image_index = 0
		if (acido)
		{
			var qtd = irandom_range(1,5)
			
			for (var i = 0; i < qtd; i ++)
			{
				instance_create_depth(x,y,depth,obj_acido)
			}
			
			abrir_fechar = false
			acido = false
		}
	}
}

x = lerp(x,xx,0.1)
y = lerp(y,yy,0.2)

imagex = lerp(imagex,1,0.1)
imagey = lerp(imagey,1,0.2)