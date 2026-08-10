//planeta mais proximo
with (obj_planeta)
{
	var dist1 = point_distance(x,y,other.x,other.y)
	
	if (dist1 <= 110 && completo = false) other.planet = id
}

x = mouse_x
y = mouse_y

if (planet = noone) exit

var dist = point_distance(x,y,planet.x,planet.y)

if (ultimo_destino != global.destino)
{
	y_info = 0
	ultimo_destino = global.destino
}

//planeta infos
#region

if (global.destino = 1)
{
	frame = 7
}
if (global.destino = 2)
{
	frame = 3
}
if (global.destino = 3)
{
	frame = 0
}
if (global.destino = 4)
{
	frame = 4
}
if (global.destino = 5)
{
	frame = 1
}


#endregion

if (!obj_nave.ir && global.interface = 0)
{
	if (delay > 0) delay --
	else if (delay <= 0)
	{
		if (dist <= 100)
		{
			y_info = lerp(y_info,1.3,0.1)
			xx = planet.x
			yy = planet.y
			image_alpha = lerp(image_alpha,1,0.1)
			dir = lerp(dir,0,0.2)
			global.destino = planet.planeta
			global.quantidade_inimigos = planet.qtd
			
			if (global.destino = 5) x_info = -100
			if (global.destino = 1) x_info = 100
			
			image_xscale = planet.image_xscale
			image_yscale = planet.image_yscale
	
	
			//abrir planeta
			if (mouse_check_button_pressed(mb_left))
			{
				// fazer nave ir até o planeta
				global.interface = 5
				tocar_som(snd_select_2)
			}
		}
		else if (dist > 100)
		{
			image_alpha = lerp(image_alpha,0,0.3)
			dir = lerp(dir,150,0.2)
		}
	}
}
else
{
	delay = 20
	image_alpha = lerp(image_alpha,0,0.3)
	dir = lerp(dir,150,0.2)
}