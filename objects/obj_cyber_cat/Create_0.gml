event_inherited()

velh = 0
velv = 0
vel = 5

boss = "CYBERCAT"
vida_max = 4250
vida = vida_max

i_frame = 0

vivo = true

brilho = 1

imagex = 1
imagey = 0

x_pe1 = x
y_pe1 = y
x_pe2 = x
y_pe2 = y
dir = 0

walk_cycle = 0

imagex = 0
imagey = 1

tamanhox_dir = 1
alvo = noone
alvo_dir = 0


inimigos = [obj_player,obj_aliados]

estado = "next"
arm_x = 0

delay_tiros = 0

colision = obj_parede

tamanhoy_dir = 1

tempo_voando = random_range(2,4) * 60
time_next = 3 * 60

time_atirar = 5 * 60

proximo_atack = choose("laser","misse","tiros","orbs","fly")
decidiu_next = true

walk_anim = function()
{
	var vel = point_distance(0,0,velh,velv)


	if (vel > 0)
	{
		walk_cycle += vel * 0.1
		
		if (walk_cycle >= 6) walk_cycle = 0
		
		var distancia = 10
		
		x_pe1 = lerp(x_pe1, x - distancia, 0.3) + max(0,sin(walk_cycle)) + 5
		x_pe2 = lerp(x_pe2, x + distancia, 0.3) + floor(max(0,sin(walk_cycle) + pi) - 8)
	}
	else
	{
		walk_cycle = lerp(walk_cycle,0,0.2)
		var distancia = 10
		
		x_pe1 = lerp(x_pe1, x - distancia, 0.15)
		x_pe2 = lerp(x_pe2, x + distancia, 0.15)
		
	}
	
	var altura = 5
	

	y_pe1 = y + 20 - max(0,sin(walk_cycle)) * altura
	y_pe2 = y + 20 - max(0,sin(walk_cycle + pi)) * altura
}

damage = function()
{
	//dano
	var tiro_inigo = instance_place(x,y,obj_tiro)

	//tomou dano
	if (tiro_inigo != noone && i_frame <= 0 && vivo)
	{
		//tiro do outro time
		if (tiro_inigo.time != 2) 
		{
			//chance de critico
			var critc = irandom(100)
			
			//tomou o dano
			brilho = 1.3
			
			if (critc > chance_crit)
			{
				dano_levado = irandom_range(tiro_inigo.dano,tiro_inigo.dano + 8)
				dano_tamanho = irandom_range(2,3)
				dano_color = c_white
				indicar_dano(dano_levado,dano_tamanho,dano_color)
			}
			else if (critc <= chance_crit)
			{
				dano_tamanho = irandom_range(4,5)
				dano_color = c_yellow
				
				dano_levado = irandom_range(tiro_inigo.dano + 25,tiro_inigo.dano + 45)
				indicar_dano(dano_levado,dano_tamanho,dano_color)
			}
			
			vida -= dano_levado
			
			i_frame = 8
			
			dano_x = x + irandom_range(-50,50)
			dano_y = y + irandom_range(-80,20)
			dano_tamx = random_range(0.5,3)
			dano_tamy = random_range(0.5,3)
			
			boing(random_range(0.3,2),random_range(0.3,2))
		}
	}
	
	//i frames
	if (i_frame > 0)
	{
		i_frame --
	}

	
	//morrer
	if (vida <= 0)
	{
		alpha_bar = lerp(alpha_bar,0,0.1)
		image_angle = 0
		vivo = false
		brilho = 1
		
		//matar npcs
		if (instance_exists(obj_inimigos))
		{
			obj_inimigos.vida = -99
		}
		
		if (!luz2)
		{
			create_light(x,y,c_white,5,8,8,id,0.02)
			luz2	= true
		}
		
		//effeito antes de morrer
		if (time_to_die > 0)
		{
			obj_render_light.ambient_light_next_color = c_black
			
			obj_camera.shake_force = 5
			obj_camera.shake_time = 20
			
			obj_camera.boss_die = true
			obj_camera.tamanhox = lerp(obj_camera.tamanhox,768,0.1)
			obj_camera.tamanhoy = lerp(obj_camera.tamanhoy,432,0.1)
			
			if (delay_die > 0) delay_die--
			else if (delay_die <= 0)
			{
				delay_die = 10
				imagex = random_range(0.3,2)
				imagey = random_range(0.3,2)
			}
			
			time_to_die --
			obj_mira.alvo = id
		}
		else
		{
			imagex = lerp(imagex,0,0.1)
			imagey = lerp(imagey,4,0.2)
			
			obj_render_light.ambient_light_next_color = c_white
			
			if (imagex <= 0.1) obj_mira.alvo = obj_player
			
			obj_camera.boss_die = false
		}
		
		velh = 0
		velv = 0
		
		if (imagex = 0) 
		{
			instance_destroy(self)
		}
		
	}
	else alpha_bar = lerp(alpha_bar,1,0.1)
}

estados = function()
{
	if (estado = "laser")
	{
		decidiu_next = false
		sprite_index = spr_cat_robot_hehe
		if (!instance_exists(obj_laser)) instance_create_depth(x,y,depth + 2,obj_laser)
	}
	else if (estado = "misse")
	{
		decidiu_next = false
		sprite_index = spr_cat_robot_hehe
		
		var mis1 = instance_create_depth(x,y,depth - 1,obj_missel)
		mis1.nasce = true
		instance_create_depth(x,y,depth - 1,obj_missel)
		estado = "next"
	}
	else if (estado = "tiros")
	{
		decidiu_next = false
		sprite_index = spr_cat_robot_hehe
		
		arm_x = lerp(arm_x,1,0.1)
		
		//tempo total
		if (time_atirar > 0) time_atirar--
		else if (time_atirar <= 0) estado = "next"
		
		if (delay_tiros > 0) delay_tiros--
		else if (delay_tiros <= 0)
		{
			delay_tiros = 0.1 * 60
			create_bullet(x,y,dir,2,c_yellow,2,c_yellow,1,2,7,23,0.05)
		}
	}
	else if (estado = "orbs")
	{
		decidiu_next = false
		sprite_index = spr_cat_robot_hehe
		
		create_orb(x,y,33,15,100,c_red,5,true,8 * 60,10,120,2,,1)
		create_orb(x,y,-33,15,100,c_red,5,true,8 * 60,10,120,2,,1)
		create_orb(x,y,200,15,100,c_red,5,true,8 * 60,10,120,2,,1)
		create_orb(x,y,-200,15,100,c_red,5,true,8 * 60,10,120,2,,1)
		estado = "next"
	}
	else if (estado = "fly")
	{
		decidiu_next = false
		sprite_index = spr_cat_robot_fly
		image_angle = alvo_dir
		
		vel = lerp(vel,10,0.01)
		
		velh = lengthdir_x(vel ,alvo_dir)
		velv = lengthdir_y(vel ,alvo_dir)
		pes = false
		
		tamanhox_dir = 1
		if (image_angle < 270 && image_angle > 90) tamanhoy_dir = -1
		else tamanhoy_dir = 1
		
		//tempo voando
		if (tempo_voando > 0) tempo_voando --
		else if (tempo_voando <= 0)
		{
			tempo_voando = random_range(2,4) * 60
			estado = "next"
		}
		
		//bater no alvo
		var inim = instance_place(x,y,inimigos)	
		
		//causar dano
		if (inim != noone)
		{
			if (inim.i_frame <= 0 && image_alpha > 0.5)
			{
				inim.vida -= irandom_range(75 - 5, 75 * 2)
				inim.i_frame = 45
				inim.brilho = 2
				if (inim.id = obj_player.id)
				{
					inim.alpha_damage += 45
					obj_camera.shake_force += 50
					obj_camera.shake_time += 5
				}
				
				with (inim)
				{
					boing(random_range(0.5,2),random_range(0.5,2))
				}
			}
			
			estado = "next"
		}
	}
	else if (estado = "help")
	{
		sprite_index = spr_cat_robot_hehe
		obj_controlador_fase.qtd_inimigos += 3
		estado = "next"
	}
	
	//escolhendo
	else if (estado = "next")
	{
		if (!decidiu_next)
		{
			time_atirar = 5 * 60
			proximo_atack = choose("laser","misse","tiros","orbs","fly","help")
			time_next = random_range(2,5) * 60
			decidiu_next = true
		}
		
		image_blend = c_white
		
		if (time_next > 0)
		{
			time_next--

			velh = 0
			velv = 0
			
			if (time_next > 1 * 60)
			{
				sprite_index = spr_cat_robot
				image_blend = c_white
			}
			else
			{
				if (proximo_atack = "laser")
				{
					sprite_index = spr_cat_robot_atack5
					image_blend = make_color_rgb(255,153,76)
				}
				if (proximo_atack = "misse")
				{
					sprite_index = spr_cat_robot_atack4
					image_blend = make_color_rgb(167,255,153)
				}
				if (proximo_atack = "tiros")
				{
					sprite_index = spr_cat_robot_atack3
					image_blend = make_color_rgb(241,150,255)
				}
				if (proximo_atack = "orbs")
				{
					sprite_index = spr_cat_robot_atack1
					image_blend = make_color_rgb(255,127,127)
				}
				if (proximo_atack = "fly")
				{
					sprite_index = spr_cat_robot_atack6
					image_blend = make_color_rgb(114,119,255)
				}
				if (proximo_atack = "help")
				{
					sprite_index = spr_cat_robot_atack2
					image_blend = make_color_rgb(178,252,255)
				}
			}
		}
		//decidiu
		else if (time_next <= 0)
		{
			estado = proximo_atack
		}
	}

	
	//volta ele ao normal
	if (estado != "fly")
	{
		pes = true
		tamanhoy_dir = 1
		image_angle = 0
		if (alvo.x > x) tamanhox_dir = 1
		if (alvo.x < x) tamanhox_dir = -1
		
		vel = lerp(vel,5,0.1)
	}
	if (estado != "tiros")
	{
		arm_x = lerp(arm_x,0,0.1)
	}
}