if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1


if (time > 0)
{
	time--
	obj_cyber_cat.i_frame = 10
	
	image_xscale = lerp(image_xscale,8,0.1)
	image_yscale = lerp(image_yscale,8,0.2)

	image_alpha = lerp(image_alpha,1,0.05)

	if (delay > 0) delay--
	else if (delay <= 0) causar_dano = true

	//causar dano
	if (causar_dano)
	{
		image_angle += 1
		
		var inim = instance_place(x,y,inimigos)	
		//causar dano
		if (inim != noone)
		{
			if (inim.i_frame <= 0 && image_alpha > 0.5)
			{
				inim.vida -= irandom_range(dano - 5, dano * 2)
				inim.i_frame = 10
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

}
else if (time <= 0)
{
	image_xscale = lerp(image_xscale,0,0.1)
	image_yscale = lerp(image_yscale,0,0.15)
	image_alpha = lerp(image_alpha,0,0.1)
	
	image_angle += 2
	
	if (image_alpha <= 0)
	{
		obj_cyber_cat.estado = "next"
		instance_destroy(self)
	}
}