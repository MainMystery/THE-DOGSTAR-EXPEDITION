if (global.pause)
{
	image_speed = 0
	exit
}

pulo = lerp(pulo,0,0.1)

depth = -bbox_top

image_xscale = lerp(image_xscale,tam,0.1)
image_yscale = lerp(image_yscale,tam,0.2)

//pulando
if (delay_pulo > 0)
{
	delay_pulo -= 1
	y -= pulo
	if (pulo_dir = true)
	{
		x += 2
		image_angle -= 1
	}
	else 
	{
		x -= 2
		image_angle += 1
	}
}
else if (delay_pulo <= 0)
{
	if (delay_queda > 0)
	{
		grav += 0.1
			
		y += grav 
		if (pulo_dir = true)
		{
			x += 1
			image_angle -= 0.5
		}
		else 
		{
			x -= 1
			image_angle += 0.5
		}
		
		delay_queda --
			
		image_yscale += 0.1
	}
	else if (delay_queda <= 0)
	{
		if (!caiu)
		{
			image_xscale = 2
			caiu = true
		}
	}
}

if (place_meeting(x,y,obj_tiro))caiu = true

if (!caiu) image_alpha = lerp(image_alpha,1,0.3)
//acido
else 
{
	delay_pulo = 0
	delay_queda = 0
	if (!adic)
	{
		image_angle = irandom_range(0,360)
		adic = true
		tam = random_range(1,5)
		sprite_index = spr_acido_chao
		image_index = irandom_range(1,10)
	}
	
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
	
	image_alpha = lerp(image_alpha,0,0.01)
	if (image_alpha <= 0) instance_destroy(self)
}