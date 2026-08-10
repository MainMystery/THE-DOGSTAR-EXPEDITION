event_inherited()

alpha_bar = 1

velh = 0
velv = 0
vel = 4

boss = "MAGMA CRAWLER"
vida_max = 6000
vida = vida_max

alvo = noone
alvo_dir = 0
dir = 0

inimigos = [obj_player,obj_aliados]

qtd_membros = 7

dano = 45

baixo_da_terra = false

time_estado = 3 * 60

decidiu_lugar = false

estado = "next"

global.destino = 5

tempo_parado = 0

time_speed = 0

delay_terra = 0

brilho = 1
imagex = 0
imagey = 2

var anterior = id

for (var i = 0; i < qtd_membros; i++)
{
    membro = instance_create_depth(anterior.x - 100, y, depth + 1, obj_magma_body)

    membro.dono = anterior
	membro.dono_principal = id
	
    anterior = membro
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
			
			i_frame = 22
			
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

move = function()
{
	if (baixo_da_terra = false)
	{
		//andar
		if (tempo_parado <= 0)
		{
			velh = lengthdir_x(vel,dir)
			velv = lengthdir_y(vel,dir)
		}
		else if (tempo_parado > 0)
		{
			velh = 0
			velv =0
			tempo_parado--
		}
		image_angle = lerp(image_angle,dir,0.1)
		
		image_alpha = lerp(image_alpha,1,0.1)
		
		//dar dano
		if (image_alpha > 0.5)
		{
			var inim = instance_place(x,y,inimigos)	
			//causar dano
			if (inim != noone)
			{
				time_speed = 0
				vel = 0
				
				if (inim.i_frame <= 0 && image_alpha > 0.5)
				{	
					inim.vida -= irandom_range(dano - 5, dano * 2)
					inim.i_frame = 100
					inim.brilho = 1
					if (inim.id = obj_player.id)
					{
						inim.alpha_damage += 45
						obj_camera.shake_force += 25
						obj_camera.shake_time += 60
					}
					
					with (inim)
					{
						boing(random_range(0.5,2),random_range(0.5,2))
					}
				}
			}
		}
	}
	//se esconder na terra
	else
	{
		i_frame = 20
		image_alpha = lerp(image_alpha,0,0.1) 
		
		if (image_alpha > 0.5)
		{
			//dist
			var dist = point_distance(x,y,obj_player.x,obj_player.y)
				
			if (dist <= 500)
			{
				obj_camera.shake_force = 10
				obj_camera.shake_time = 1 *60
			}
		}
		
		//ir pra outro lugar
		if (image_alpha <= 0)
		{
			//está esperando pra sair
			var xx = alvo.x
			var yy = alvo.y
		
			x = xx + random_range(-800,800)
			y = yy + random_range(-1000,1000)
			
			velh = 0
			velv = 0
			
			//sair
			if (membro.image_alpha <= 0.05)
			{
				if (delay_terra > 0)
				{
					delay_terra--
					//dist
					var dist = point_distance(x,y,obj_player.x,obj_player.y)
				
					if (dist <= 500)
					{
						obj_camera.shake_force = 10
						obj_camera.shake_time = 1 *60
					}
				}
				else if (delay_terra <= 0)
				{
					instance_create_depth(x ,y ,depth + 1,obj_burraco)
					baixo_da_terra = false
				}
			}
		}
	}
}

estados = function()
{
	if (estado = "next")
	{
		if (!baixo_da_terra)
		{
			if (time_estado > 0) time_estado--
			else if (time_estado <= 0)
			{
				estado = choose("orb","speed","cava")
			}
		}
	}
	
	else if (estado = "orb")
	{
		velh = 0
		velv = 0
		create_orb(x + lengthdir_x(5,dir),y + lengthdir_y(5,dir),dir,10,3,c_red,8,true,10 * 60,2,1,2,0.05,2)
		
		tempo_parado = 4 * 60
		time_estado = irandom_range(5,8) * 60
		estado = "next"
	}
	
	else if (estado = "speed")
	{
		time_speed = random_range(1,5) * 60
		estado = "next"
		time_estado = random_range(4,8) * 60
	}
	
	else if (estado = "cava")
	{
		baixo_da_terra = true
		instance_create_depth(x + lengthdir_x(200,dir),y + lengthdir_y(200,dir),depth + 1,obj_burraco)
		delay_terra = random_range(0.1,2) * 60
		estado = "next"
		time_estado = irandom_range(3,4) * 60
	}
	
	if (time_speed > 0)
	{
		time_speed--
		vel = lerp(vel,6,0.1)
	}
	else if (time_speed <= 0) vel = lerp(vel,4,0.1)
}