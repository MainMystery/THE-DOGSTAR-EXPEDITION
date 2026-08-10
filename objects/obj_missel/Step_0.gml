if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (global.trop_position) exit

depth = -y

//o alvo é o mais proximo
#region
var alvo_player = instance_nearest(x, y, obj_player)
var alvo_aliados = instance_nearest(x, y, obj_aliados)
var dist_player = 999999
var dist_aliados = 999999

if (instance_exists(alvo_player))  dist_player = point_distance(x, y, alvo_player.x, alvo_player.y)
   

if (instance_exists(alvo_aliados)) dist_aliados = point_distance(x, y, alvo_aliados.x, alvo_aliados.y)
    

if (dist_player < dist_aliados) alvo = alvo_player   
else alvo = alvo_aliados

#endregion

var dir = point_direction(x,y,alvo.x,alvo.y)

if (!causar_dano)
{
	if (delay > 0) 
	{
		delay--
		image_angle = dir
		if (nasce = false) x = lerp(x,x + 10,0.1)
		else x = lerp(x,x - 10,0.1)
	}
	else if (delay <= 0)
	{
		vel = lerp(vel,4,0.1)

		if (alvo != noone)
		{
			var dist = point_distance(x,y,alvo.x,alvo.y)
	
			if (dist <= 30)
			{
				image_index = 0
				causar_dano = true
			}
	
			x += lengthdir_x(vel,dir)
			y += lengthdir_y(vel,dir)
			image_angle = dir
	
	
			if (time > 0) time--
			else if (time <= 0)
			{
				causar_dano = true
				image_index = 0
			}
			
			if (time <= 1 * 60)
			{
				if (delay_efeito > 0) delay_efeito--
				else if (delay_efeito <= 0)
				{
					delay_efeito = 10
					brilho = 1
				}
			}
		}
		
		if (place_meeting(x,y,obj_tiro)) 
		{
			image_index = 0
			causar_dano = true
		}
	}
	
	brilho = lerp(brilho,0,0.15)
}
else
{
	sprite_index = spr_explosion
	brilho = lerp(brilho,0,0.22)
	
	image_xscale = lerp(image_xscale,3,0.1)
	image_yscale = lerp(image_yscale,3,0.2)
	
	if (image_index >= sprite_get_number(spr_explosion) - 1) instance_destroy(self)
	
	var inim = instance_place(x,y,inimigos)	
	//causar dano
	if (inim != noone)
	{
		if (inim.i_frame <= 0 && image_alpha > 0.5)
		{
			inim.vida -= irandom_range(dano - 5, dano * 2)
			inim.i_frame = 20
			inim.brilho = 1
			if (inim.id = obj_player.id)
			{
				inim.alpha_damage += 20
				obj_camera.shake_force += 2
				obj_camera.shake_time += 20
			}
			with (inim)
			{
				boing(random_range(0.5,2),random_range(0.5,2))
			}
		}
	}
}