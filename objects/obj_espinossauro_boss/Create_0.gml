velv = 0
velh = 0
vel = 4
vel_max = 10

brilho = 0

i_frame = 0

dano_levado = 0
dano_color = c_white
dano_tamanho = 0

dano_x = 0
dano_y = 0
dano_tamx = 0
dano_tamy = 0

vivo = true
imagex = 1
imagey = 1

delay_virar = 0

tamanhox_dir = 1

alvo = noone

point = 0

event_inherited()

boss = "SPINOSAURUS"

vida_max = 4500
vida = vida_max

alpha_bar = 0

inimigos = [obj_player,obj_aliados,obj_inimigos]
x_hit_box = x
y_hit_box = y

dano = 20

estado = ""

delay_mordida = 0

delay_russ = irandom_range(1,6) * 60

delay_russ_time = 0

delay_russ_end = 4 * 60

delay_grito = irandom_range(5,15) * 60

time_parar_grito = 3 * 60

delay_die = 0
time_to_die = 3 * 60

luz = false

chance_crit = 3

if (global.chip_1 = 8 || global.chip_2 = 8 || global.chip_3 = 8)
{
	chance_crit = 12
}

moviment = function()
{
	if (instance_exists(alvo))
	{	
		//distancia
		var dist = point_distance(x,y,alvo.x,alvo.y)
		
		x_hit_box = x
		y_hit_box = y
		
		//estado padrão
		if (estado = "")
		{
			//proximo
			if (dist <= 100)
			{
				velh = 0
				velv = 0
				image_angle = lerp(image_angle,0,0.1)
			
				//morder ou dar rabada
				if (alvo.x < x)
				{
					if (tamanhox_dir < 0)
					{
						if (estado != "mordida")
						{
							image_index = 0
							estado = "mordida"
							delay_mordida = 1.3 * 60
							delay_grito += 10
						}
					}
					else
					{
						if (estado != "rabada")
						{
							image_index = 0
							estado = "rabada"
							delay_mordida = 1.3 * 60
							delay_grito += 10
						}
					}
				}
				else
				{
					if (tamanhox_dir > 0)
					{
						if (estado != "mordida")
						{
							image_index = 0
							estado = "mordida"
							delay_mordida = 1.3 * 60
							delay_grito += 10
						}
					}
					else
					{
						if (estado != "rabada")
						{
							image_index = 0
							estado = "rabada"
							delay_mordida = 1.3 * 60
							delay_grito += 10
						}
					}
				}
			}
			//distante
			else
			{
				sprite_index = spr_espinossauro_padrao
				
				velh = lengthdir_x(vel,point)
				velv = lengthdir_y(vel,point)
				
				if (delay_virar > 0) delay_virar --
				if (delay_virar <= 0)
				{
					if (alvo.x > x)
					{
						tamanhox_dir = 1
						image_angle = lerp(image_angle,-10,0.1)
					}
					else
					{
						tamanhox_dir = -1
						image_angle = lerp(image_angle,10,0.1)
					}
				}
				
				//decidir correr sem parar até você
				if (delay_russ > 0) delay_russ --
				else if (delay_russ <= 0)
				{
					delay_russ_time = random_range(0.5,1) * 60
					delay_russ_end = irandom_range(1,3) * 60
					delay_russ = irandom_range(6,12) * 60
						
					estado = "russ"
						
					instance_create_depth(x + irandom_range(-200,200),y + irandom_range(-40,0),depth - 1,obj_alerta)
				}
				
				//decidir chamar reforços
				if (delay_grito > 0) delay_grito --
				else if (delay_grito <= 0)
				{
					delay_grito = irandom_range(20,30) * 60
						
					tocar_som(snd_spino_roar)
					estado = "scream"
					obj_camera.shake_force = 20
					obj_camera.shake_time = 3 * 60
					time_parar_grito = 3 * 60
				}

			}
		}
		
		//delay pra ele virar
		else
		{
			delay_virar = 20
		}
		
		// ESTADOS
		if (estado = "mordida")
		{
			if (delay_mordida > 0) delay_mordida --
			else if (delay_mordida <= 0) estado = ""
			
			sprite_index = spr_espinossauro_atack
			
			if (image_index >= sprite_get_number(spr_espinossauro_atack) - 1)
			{
				image_index = sprite_get_number(spr_espinossauro_atack) - 1
				
				var hitbox = collision_rectangle(x_hit_box - 30 * tamanhox_dir,y_hit_box - 80,x_hit_box + 200 * tamanhox_dir,y_hit_box + 120,inimigos,false,true)
			
				//causar dano
				if (hitbox != noone)
				{
					if (hitbox.i_frame <= 0)
					{
						hitbox.vida -= irandom_range(dano - 5, dano * 2)
						hitbox.i_frame = 40 
						hitbox.brilho = 1
						if (hitbox.id = obj_player.id)
						{
							hitbox.alpha_damage += 10
							obj_camera.shake_force += 30
							obj_camera.shake_time += 20
						}
					}
				}
				
				
				if (delay_mordida > 0) delay_mordida --
				else if (delay_mordida <= 0) estado = ""
			}
		}
		
		if (estado = "rabada")
		{
			if (delay_mordida > 0) delay_mordida --
			else if (delay_mordida <= 0) estado = ""
			
			sprite_index = spr_espinossauro_atack2
			
			if (delay_mordida <= 1 * 60)
			{
				var hitbox = collision_rectangle(x_hit_box + 30 * tamanhox_dir,y_hit_box - 80,x_hit_box - 200 * tamanhox_dir,y_hit_box + 120,inimigos,false,true)
			
				//causar dano
				if (hitbox != noone)
				{
					if (hitbox.i_frame <= 0)
					{
						hitbox.vida -= irandom_range(dano - 10, dano)
						hitbox.i_frame = 30 
						hitbox.brilho = 1
						if (hitbox.id = obj_player.id)
						{
							hitbox.alpha_damage += 10
							obj_camera.shake_force += 30
							obj_camera.shake_time += 20
						}
					}
				}
			
			}
				
			if (delay_mordida > 0) delay_mordida --
			else if (delay_mordida <= 0) estado = ""
		}
		
		//russ
		if (estado = "russ")
		{
			sprite_index = spr_espinossauro_padrao
				
			if (delay_russ_time > 0)
			{
				delay_russ_time--
				velh = 0
				velv = 0
				
			}
			else if (delay_russ_time <= 0)
			{
				var hitbox = collision_rectangle(x_hit_box + 200 * tamanhox_dir,y_hit_box - 50,x_hit_box - 200 * tamanhox_dir,y_hit_box + 120,inimigos,false,true)
				
				//causar dano
				if (hitbox != noone)
				{
					if (hitbox.i_frame <= 0)
					{
						hitbox.vida -= irandom_range(dano - 10, dano * 2)
						hitbox.i_frame = 30 
						hitbox.brilho = 1
						if (hitbox.id = obj_player.id)
						{
							hitbox.alpha_damage += 10
							obj_camera.shake_force += 35
							obj_camera.shake_time += 20
						}
					}
				}
				
				velh = lengthdir_x(vel_max,point)
				velv = lengthdir_y(vel_max,point)
				
				if (delay_russ_end > 0) delay_russ_end--
				else if (delay_russ_end <= 0) estado = ""
			}
			
		}
		else // apontar para o alvo
		{
			// apontar
			point = point_direction(x,y,alvo.x,alvo.y)
		}		
		
		//grito
		if (estado = "scream")
		{
			sprite_index = spr_espinossauro_roar
			
			velh = 0
			velv = 0
			
			if (time_parar_grito > 0) time_parar_grito -= 1
			else if (time_parar_grito <= 0)
			{
				estado = ""
				//surgir_inimigos
				obj_controlador_fase.qtd_inimigos += irandom_range(1,10)
			}
			
			if (image_xscale > 0) image_angle = lerp(image_angle,20,0.2)
			else image_angle = lerp(image_angle,-20,0.2)
		}
	}
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
			
			i_frame = 10
			
			
			dano_x = x + irandom_range(-50,50)
			dano_y = y + irandom_range(-80,20)
			dano_tamx = random_range(0.5,3)
			dano_tamy = random_range(0.5,3)
			
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
		
		if (!luz)
		{
			create_light(x,y,c_white,5,8,8,id,0.02)
			luz	= true
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

//perna não mexer
#region
//=============
// PERNA ESQUERDA
//=============

//posição do pé
pe1_x = x - 18
pe1_y = y + 80

//posição do joelho (será calculada)
joelho1_x = 0
joelho1_y = 0

//posição do quadril
quadril1_x = 0
quadril1_y = 0


//=============
// PERNA DIREITA
//=============

pe2_x = x + 18
pe2_y = y + 80

joelho2_x = 0
joelho2_y = 0

quadril2_x = 0
quadril2_y = 0


//comprimento dos ossos
coxa = 33
canela = 45


//animação
walk_cycle = 0


calcular_perna = function(qx,qy,px,py,esquerda)
{
    //------------------------------------------
    // DISTÂNCIA DO QUADRIL ATÉ O PÉ
    //------------------------------------------

    var d = point_distance(qx,qy,px,py)

    d = clamp(d,1,coxa+canela-0.1)

    //------------------------------------------
    // DIREÇÃO DO PÉ
    //------------------------------------------

    var dir = point_direction(qx,qy,px,py)

    //------------------------------------------
    // LEI DOS COSSENOS
    //------------------------------------------

    var ang = arccos(
    (
        sqr(coxa)
        +
        sqr(d)
        -
        sqr(canela)
    )
    /
    (
        2*coxa*d
    )
    )

    //------------------------------------------
    // PARA CADA LADO O JOELHO DOBRA PARA UM LADO
    //------------------------------------------

    var joelho_dir = dir + radtodeg(ang) * image_xscale
	
    //------------------------------------------
    // POSIÇÃO DO JOELHO
    //------------------------------------------

    var jx = qx + lengthdir_x(coxa,joelho_dir)
    var jy = qy + lengthdir_y(coxa,joelho_dir)

    //------------------------------------------
    // SALVA
    //------------------------------------------
	var joelho_offset = 10

	
	jx -= joelho_offset * image_xscale
	
    if (esquerda)
    {
        joelho1_x = jx
        joelho1_y = jy
    }
    else
    {
        joelho2_x = jx
        joelho2_y = jy
    }

}


andar_ik = function()
{
    //----------------------------------------------------
    // VELOCIDADE
    //----------------------------------------------------

    var vel = point_distance(0,0,velh,velv)

    //----------------------------------------------------
    // CICLO DA CAMINHADA
    //----------------------------------------------------

    if (vel > 0.1)
    {
        walk_cycle += 0.15
    }

    //----------------------------------------------------
    // POSIÇÃO DOS QUADRIS
    //----------------------------------------------------

    quadril1_x = x - 15
    quadril1_y = y + 15

    quadril2_x = x + 15
    quadril2_y = y + 15

    //----------------------------------------------------
    // DESTINO DOS PÉS
    //----------------------------------------------------

    var passo = 20 * image_xscale
    var altura = 40

    var alvo1_x = x - 20 + sin(walk_cycle) * passo
    var alvo1_y = y + 85 - max(0,sin(walk_cycle)) * altura

    var alvo2_x = x + 20 + sin(walk_cycle + pi) * passo
    var alvo2_y = y + 85 - max(0,sin(walk_cycle + pi)) * altura
	
	
    //----------------------------------------------------
    // LERP DOS PÉS
    //----------------------------------------------------
	
	if (walk_cycle > 6) walk_cycle = 0
	
	if (velh = 0 && velv = 0)
	{
		alvo1_x = x - 20
		alvo1_y = y + 85
		alvo2_x = x + 20
		alvo2_y = y + 85
		
		pe1_x = lerp(pe1_x,alvo1_x,0.1)
		pe1_y = lerp(pe1_y,alvo1_y,0.1)

		pe2_x = lerp(pe2_x,alvo2_x,0.1)
		pe2_y = lerp(pe2_y,alvo2_y,0.1)
	}
	else
	{
		pe1_x = lerp(pe1_x,alvo1_x,0.35)
		pe1_y = lerp(pe1_y,alvo1_y,0.35)

		pe2_x = lerp(pe2_x,alvo2_x,0.35)
		pe2_y = lerp(pe2_y,alvo2_y,0.35)
	}



    //----------------------------------------------------
    // CALCULA IK DA PERNA ESQUERDA
    //----------------------------------------------------

    calcular_perna(
        quadril1_x,
        quadril1_y,
        pe1_x,
        pe1_y,
        true
    )



    //----------------------------------------------------
    // CALCULA IK DA PERNA DIREITA
    //----------------------------------------------------

    calcular_perna(
        quadril2_x,
        quadril2_y,
        pe2_x,
        pe2_y,
        false
    )

}

#endregion