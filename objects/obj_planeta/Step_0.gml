if (planeta = 1)
{
	//terminou em paz
	if (global.paz_planeta1 >= global.guerra_planeta1) sprite_bandeira = spr_planeta_band_whit
	//em guerra
	else sprite_bandeira = spr_planeta_band_dog
	
	if (global.planet1_A1 != 0 && global.planet1_A2 != 0 && global.planet1_A3 != 0 && global.planet1_A4 != 0)
	completo = true
}
if (planeta = 2)
{
	//terminou em paz
	if (global.paz_planeta2 >= global.guerra_planeta2) sprite_bandeira = spr_planeta_band_whit
	//em guerra
	else sprite_bandeira = spr_planeta_band_dog
	
	if (global.planet2_A1 != 0 && global.planet2_A2 != 0 && global.planet2_A3 != 0 && global.planet2_A4 != 0)
	completo = true
}
if (planeta = 3)
{
	//terminou em paz
	if (global.paz_planeta3 >= global.guerra_planeta3) sprite_bandeira = spr_planeta_band_whit
	//em guerra
	else sprite_bandeira = spr_planeta_band_dog
	
	if (global.planet3_A1 != 0 && global.planet3_A2 != 0 && global.planet3_A3 != 0 && global.planet3_A4 != 0)
	completo = true
}
if (planeta = 4)
{
	//terminou em paz
	if (global.paz_planeta4 >= global.guerra_planeta4) sprite_bandeira = spr_planeta_band_whit
	//em guerra
	else sprite_bandeira = spr_planeta_band_dog
	
	if (global.planet4_A1 != 0 && global.planet4_A2 != 0 && global.planet4_A3 != 0 && global.planet4_A4 != 0)
	completo = true
}
if (planeta = 5)
{
	//terminou em paz
	if (global.paz_planeta5 >= global.guerra_planeta5) sprite_bandeira = spr_planeta_band_whit
	//em guerra
	else sprite_bandeira = spr_planeta_band_dog
	
	if (global.planet5_A1 != 0 && global.planet5_A2 != 0 && global.planet5_A3 != 0 && global.planet5_A4 != 0)
	completo = true
}


if (set = false)
{
	if (planeta = 1) 
	{
		sprite_index = spr_planeta1
	
		if (global.planet1_A1 = false) qtd = 30
		else if (global.planet1_A2 = false) qtd = 45
		else if (global.planet1_A3 = false) qtd = 65
		else if (global.planet1_A4 = false) qtd = 5
	}
	if (planeta = 2)
	{
		sprite_index = spr_planeta2
		if (global.planet2_A1 = false) qtd = 90
		else if (global.planet2_A2 = false) qtd = 120
		else if (global.planet2_A3 = false) qtd = 150
		else if (global.planet2_A4 = false) qtd = 1
	}
	if (planeta = 3) 
	{
		sprite_index = spr_planeta3
		if (global.planet3_A1 = false) qtd = 50
		else if (global.planet3_A2 = false) qtd = 75
		else if (global.planet3_A3 = false) qtd = 95
		else if (global.planet3_A4 = false) qtd = 15
	}
	if (planeta = 4) 
	{
		sprite_index = spr_planeta4
		if (global.planet4_A1 = false) qtd = 40
		else if (global.planet4_A2 = false) qtd = 65
		else if (global.planet4_A3 = false) qtd = 80
		else if (global.planet4_A4 = false) qtd = 1
	}
	if (planeta = 5)
	{
		sprite_index = spr_planeta5
		if (global.planet5_A1 = false) qtd = 20
		else if (global.planet5_A2 = false) qtd = 40
		else if (global.planet5_A3 = false) qtd = 75
		else if (global.planet5_A4 = false) qtd = 1
	}
	
	set = true
}

image_angle += vel

	
if (frame < sprite_get_number(spr_planeta_band_dog) - 1)
{
	frame += 0.1
}
else if (frame >= sprite_get_number(spr_planeta_band_dog) - 1)
{
	frame = 0
}
	
if (completo)
{
	if (planeta = 1)
	{
		if (!global.animacao_pl1)
		{
			//primeira vez vendo
			//animação
			y_bandeira = lerp(y_bandeira,-15,0.03)
			alpha_bandeira = lerp(alpha_bandeira,1,0.2)
			
			obj_camera.shake_force = 2
			obj_camera.shake_time = 10
			
			if (y_bandeira <= -14.5)
			{
				y_bandeira = -15
				if (planeta = 1) global.animacao_pl1 = true
			}

			if (effect_delay > 0) effect_delay --
			else if (effect_delay <= 0)
			{
				effect_delay = 10
				instance_create_depth(x + irandom_range(-10,10),y + irandom_range(-32,-5),depth -1,obj_fumaca)
			}
		}
		else
		{
			y_bandeira = -15
			alpha_bandeira = 1
		}
	}
	
	if (planeta = 2)
	{
		if (!global.animacao_pl2)
		{
			obj_camera.shake_force = 2
			obj_camera.shake_time = 10
			//primeira vez vendo
			//animação
			y_bandeira = lerp(y_bandeira,-15,0.03)
			alpha_bandeira = lerp(alpha_bandeira,1,0.2)

			if (y_bandeira <= -14.5)
			{
				y_bandeira = -15
				if (planeta = 1) global.animacao_pl2 = true
			}

			if (effect_delay > 0) effect_delay --
			else if (effect_delay <= 0)
			{
				effect_delay = 10
				instance_create_depth(x + irandom_range(-10,10),y + irandom_range(-32,-5),depth -1,obj_fumaca)
			}
		}
		else
		{
			y_bandeira = -15
			alpha_bandeira = 1
		}
	}
	
	if (planeta = 3)
	{
		if (!global.animacao_pl3)
		{
			obj_camera.shake_force = 2
			obj_camera.shake_time = 10
			
			//primeira vez vendo
			//animação
			y_bandeira = lerp(y_bandeira,-15,0.03)
			alpha_bandeira = lerp(alpha_bandeira,1,0.2)

			if (y_bandeira <= -14.5)
			{
				y_bandeira = -15
				if (planeta = 1) global.animacao_pl3 = true
			}

			if (effect_delay > 0) effect_delay --
			else if (effect_delay <= 0)
			{
				effect_delay = 10
				instance_create_depth(x + irandom_range(-10,10),y + irandom_range(-32,-5),depth -1,obj_fumaca)
			}
		}
		else
		{
			y_bandeira = -15
			alpha_bandeira = 1
		}
	}
	
	if (planeta = 4)
	{
		if (!global.animacao_pl4)
		{
			obj_camera.shake_force = 2
			obj_camera.shake_time = 10
			//primeira vez vendo
			//animação
			y_bandeira = lerp(y_bandeira,-15,0.03)
			alpha_bandeira = lerp(alpha_bandeira,1,0.2)

			if (y_bandeira <= -14.5)
			{
				y_bandeira = -15
				if (planeta = 1) global.animacao_pl4 = true
			}

			if (effect_delay > 0) effect_delay --
			else if (effect_delay <= 0)
			{
				effect_delay = 10
				instance_create_depth(x + irandom_range(-10,10),y + irandom_range(-32,-5),depth -1,obj_fumaca)
			}
		}
		else
		{
			y_bandeira = -15
			alpha_bandeira = 1
		}
	}
	
	if (planeta = 5)
	{
		if (!global.animacao_pl5)
		{
			obj_camera.shake_force = 2
			obj_camera.shake_time = 10
			
			//primeira vez vendo
			//animação
			y_bandeira = lerp(y_bandeira,-15,0.03)
			alpha_bandeira = lerp(alpha_bandeira,1,0.2)

			if (y_bandeira <= -14.5)
			{
				y_bandeira = -15
				if (planeta = 1) global.animacao_pl5 = true
			}

			if (effect_delay > 0) effect_delay --
			else if (effect_delay <= 0)
			{
				effect_delay = 10
				instance_create_depth(x + irandom_range(-10,10),y + irandom_range(-32,-5),depth -1,obj_fumaca)
			}
		}
		else
		{
			y_bandeira = -15
			alpha_bandeira = 1
		}
	}
}