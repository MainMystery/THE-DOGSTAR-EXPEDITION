event_inherited()

boss = "COSMIC FOX"
vida_max = 2000
vida = vida_max

frame = 0

rabo = instance_create_depth(x,y,depth,obj_rabo_fox)
rabo.dono = id

vivo = true

brilho = 1

inimigos = [obj_player,obj_aliados,obj_inimigos]
x_hit_box = x
y_hit_box = y

dano = 20

estado = ""

alvo = obj_player

x_eye = x 
y_eye = y 

delay_die = 0
time_to_die = 3 * 60

luz = false

chance_crit = 3

i_frame = 0

imagex = 0
imagey = 1

imagey2 = 0
delay_abrir_olho = 0

luz2 = 0

delay_decidir_estado = irandom_range(3,5) * 60

color_eye = c_white
eye_color_delay = 0

proximo_estado = choose("rabo","purple","orbs","help")

delay_teleporte = 0
time_teleporte = irandom_range(12,25) * 60
teleporto = false
teleportando = false

delay_efeito = 0

pos_tp = 0

ultimo_tp = 0

luz = instance_create_depth(x,y,depth,obj_light)
luz.image_blend = color_eye
luz.image_alpha = imagex
luz.image_xscale = 2
luz.image_yscale = 1
luz.alvo = -10

if (global.chip_1 = 8 || global.chip_2 = 8 || global.chip_3 = 8)
{
	chance_crit = 12
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
			
			i_frame = 20
			
			
			dano_x = x + irandom_range(-50,50)
			dano_y = y + irandom_range(-80,20)
			dano_tamx = random_range(0.5,3)
			dano_tamy = random_range(0.5,3)
			
			imagey2 = 0
			delay_abrir_olho = 0.5 * 60
			
			boing(random_range(0.3,2),random_range(0.3,2))
		}
	}
	
	//i frames
	if (i_frame > 0) i_frame --
	
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
	//atacks
	if (delay_teleporte <= 0)
	{
		//decidindo
		if (delay_decidir_estado > 0)
		{
			delay_decidir_estado -= 1
		
			if (delay_decidir_estado <= 1 * 60)
			{
				if (eye_color_delay > 0)
				{
					eye_color_delay --
				
					if (eye_color_delay > 0.15 * 60) color_eye = c_white
					else
					{
						if (proximo_estado = "rabo") color_eye = c_lime
						if (proximo_estado = "orbs") color_eye = choose(c_red,c_blue)
						if (proximo_estado = "purple") color_eye = make_color_rgb(100,0,255)
						if (proximo_estado = "help") color_eye = c_yellow
					}
				}
				else if (eye_color_delay <= 0)
				{
					eye_color_delay = 0.3 * 60
				}
			}
		}
		else if (delay_decidir_estado <= 0)
		{
			//escolhendo o estado do rabo
			if (proximo_estado = "rabo")
			{
				rabo.estado = choose("atack1","atack2")
				delay_decidir_estado = irandom_range(1,3) * 60

				proximo_estado = choose("orbs","purple","help")
			}
		
			//ataques proprios
			else if (proximo_estado = "orbs")
			{
				create_orb(x,y + 25,180,25,5,c_red,12,true,4 * 60,2,35,2,0.05,2)
				create_orb(x,y + 25,0,25,5,c_blue,12,true,4 * 60,2,35,2,0.05,2)
				
				delay_decidir_estado = irandom_range(5,10) * 60
			
				proximo_estado = choose("rabo","purple","help")
			}
			else if (proximo_estado = "purple")
			{
				create_orb(x,y - 80,90,15,75,make_color_rgb(100,0,255),18,true,5 * 60,5,150,2,0.03,1)
				
				delay_decidir_estado = irandom_range(10,13) * 60
				proximo_estado = choose("rabo","orbs","help")
			}
			else if (proximo_estado = "help")
			{
				obj_controlador_fase.qtd_inimigos += irandom_range(1,10)
				delay_decidir_estado = irandom_range(6,10) * 60
				proximo_estado = choose("rabo","orbs","purple")
			}
			
			color_eye = c_white
		}
		
	}
	
	//teleportando
	if (time_teleporte > 0)
	{
		time_teleporte -= 1
	}
	else if (time_teleporte <= 0)
	{
		delay_teleporte = 50
		teleportando = true
		time_teleporte = irandom_range(12,25) * 60
	}
	
	//tp de fato
	if (teleportando)
	{
		i_frame = 15
		delay_abrir_olho = 50
		
		if (delay_teleporte > 0) 
		{
			delay_teleporte--
		
			if (delay_efeito > 0)
			{
				delay_efeito --
				brilho = 1
				imagex = random_range(0.5,2)
				imagey = random_range(0.5,2)
			}
			else if (delay_efeito <= 0) delay_efeito = 40
		
		}
		else if (delay_teleporte <= 0)
		{
			//posição do tp
			imagex = lerp(imagex,0,0.1)
			brilho = 1
			teleporto = true
			
			//teleporto
			if (imagex <= 0.1)
			{
				if (ultimo_tp = pos_tp)
				{
					//lugar
					pos_tp = irandom_range(0,7)
				}
				else
				{
					if (pos_tp = 0)
					{
						x = 1120
						y = 608
					}
					else if (pos_tp = 1)
					{
						x = 1408
						y = 800
					}
					else if (pos_tp = 2)
					{
						x = 768
						y = 832
					}
					else if (pos_tp = 3)
					{
						x = 1120
						y = 1120
					}
					else if (pos_tp = 4)
					{
						x = 736
						y = 608
					}
					else if (pos_tp = 5)
					{
						x = 1504
						y = 608
					}
					else if (pos_tp = 6)
					{
						x = 1504
						y = 1120
					}
					else if (pos_tp = 7)
					{
						x = 736
						y = 1120
					}

					ultimo_tp = pos_tp

					teleportando = false
					teleporto = false
				}
			}
		
		}
	
	}
	
	if (teleporto = false) imagex = lerp(imagex,1,0.1)
}