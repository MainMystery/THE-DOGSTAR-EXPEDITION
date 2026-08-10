// Inherit the parent event
event_inherited()

boss = "SCHRÖDINGER"
vida_max = 1500 
vida = vida_max

i_frame = 0

chance_crit = 3
vivo = true

brilho = 0

imagex = 1
imagey = 0

sprite = "normal"

proxima_caixa = true
delay_next_box = 0

caixa = noone

tempo_muda_caixa = irandom_range(5,8) * 60

delay_tolerance = 0
delay_acidi = 0

decidido = false
caixa_acido = noone
caixa_acido2 = noone
caixa_acido3 = noone
caixa_escolhida = noone

acido_ini = true

luz2 = noone

time_to_die = 3 * 60
delay_die = 0

delay_help = irandom_range(10,20) * 60

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
		if (sprite = "normal") sprite_index = spr_cat_normal_dano
		if (sprite = "die") sprite_index = spr_cat_die_dano
	}
	else if (i_frame <= 0)
	{
		if (sprite = "normal") sprite_index = spr_cat_normal
		if (sprite = "die") sprite_index = spr_cat_die
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

caixas = function()
{
	//tempo
	if (tempo_muda_caixa > 0) tempo_muda_caixa--
	else if (tempo_muda_caixa <= 0)
	{
		proxima_caixa = true
		tempo_muda_caixa = irandom_range(7,12) * 60
	}
	
	if (!proxima_caixa)
	{
		imagey = lerp(imagey,1,0.2)
		delay_next_box = random_range(1.2,3) * 60
		delay_tolerance = random_range(1,2.5) * 60
		delay_acidi = random_range(0.3,1) * 60
	}
	else
	{
		if (caixa != noone) caixa.dono = noone
		i_frame = 20
		imagey = lerp(imagey,0,0.2)
		
		if (delay_next_box > 0) delay_next_box--
		else if (delay_next_box <= 0)
		{
			if (!decidido)
			{
				caixa_escolhida = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
				if (acido_ini = false)
				{
					caixa_acido = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
					
					//mais acido
					if (vida <= vida_max - 500)
					{
						caixa_acido2 = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
					}
					
					if (vida <= vida_max div 3)
					{
	
						caixa_acido3 = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
					}
				
				}
				
				caixa = caixa_escolhida
				
				decidido = true
				sprite = choose("normal","die")
			}
			
			//achando outra caixa
			if (acido_ini = false)
			{
				if (caixa_acido = caixa_escolhida) caixa_acido = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
				else caixa_acido.mexer = true
				
				if (caixa_acido2 != noone)
				{
					if (caixa_acido = caixa_acido2 || caixa_acido = caixa_acido3) caixa_acido2 = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
					else caixa_acido2.mexer = true
				}
				
				if (caixa_acido3 != noone)
				{
					if (caixa_acido = caixa_acido3 || caixa_acido = caixa_acido2) caixa_acido3 = instance_find(obj_caixa, irandom(instance_number(obj_caixa) - 1))
					else caixa_acido3.mexer = true
				}
			}
			
			if (caixa != noone) caixa.mexer = true
			
			if (delay_tolerance > 0) delay_tolerance--
			else if (delay_tolerance <= 0)
			{
				caixa.dono = id
				proxima_caixa = false
				decidido = false
				if (acido_ini) acido_ini = false
			}
			
			//acido
			if (delay_acidi > 0) delay_acidi--
			else if (delay_acidi <= 0)
			{
				if (caixa_acido != noone) caixa_acido.acido = true
				if (caixa_acido2 != noone)caixa_acido2.acido = true
				if (caixa_acido3 != noone)caixa_acido3.acido = true
				
				delay_acidi = 5 * 60
			}
			
		}
	}
	
	//ajuda
	if (delay_help > 0) delay_help--
	else if (delay_help <= 0)
	{
		delay_help = irandom_range(10,20) * 60
		obj_controlador_fase.qtd_inimigos += irandom_range(3,5)
	}
}
