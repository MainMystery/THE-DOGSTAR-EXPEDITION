dir = 0

velh = 0
velv = 0

vel = 3

alpha_damage = 0

i_frame = 0

pode_se_mover = true

inimigos = 0

//mira
instance_create_depth(x,y,depth,obj_mira)

arma = instance_create_depth(x,y,depth - 1,obj_arma)
arma.dono = id
arma.pode_usar = pode_se_mover
arma.time = 1

rolando = false
rolando_delay = 0
rolando_time = 0

vida_extra = false

vida_max = 150

//criar as decorações do mundo
if (room = rm_planeta)
{
	for (i = 0; i < irandom_range(10,50); i ++)
	{
		var xx = choose(irandom_range(x - 1000,x - 200),irandom_range(x + 200,x + 1000))
		var yy = choose(irandom_range(y - 1000,y - 200),irandom_range(y + 200,y + 1000))
	
		instance_create_layer(xx,yy,"deco",obj_decoracao_map)
	}
}

//chip de triplicar a vida
if (global.chip_1 = 2 || global.chip_2 = 2 || global.chip_3 = 2)
{
	vida_max *= 3
}
//chip de 50 vida a mais
if (global.chip_1 = 3 || global.chip_2 = 3 || global.chip_3 = 3)
{
	vida_max += 50
}

//vida extra com chip
if (global.chip_1 = 4 || global.chip_2 = 4 || global.chip_3 = 4)
{
	vida_extra = true
}

vida = vida_max

vida_anterior = vida
vida_delay = 0

mouse_dir = point_direction(x,y,mouse_x,mouse_y)

colision = [obj_parede]

event_inherited()

sprite_pe = spr_dog_foot

vivo = true

fim_de_game = false

instance_create_depth(x,y,depth,obj_camera)

brilho = 0

delay_i_frame = 0

time = 1

criar_orb_ao_morrer = false

movimet = function()
{
	var up,down,left,right
	
	right = keyboard_check(ord("D"))
	left = keyboard_check(ord("A"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))
	
	if (!rolando)
	{
		velh = (right - left) * vel
		velv = (down - up) * vel
		
		if (velh != 0 || velv != 0)
		{
			if (velh > 0) dir = lerp(dir,-10,0.1)
			if (velh < 0) dir = lerp(dir,10,0.1)
		}
		else 
		{
			dir = lerp(dir,0,0.1)
		}
		
		if (arma.x > x) 
		{
			tamanhox_dir = 1
		}
		if (arma.x < x) 
		{
			tamanhox_dir = -1
		}
	}
}

rolar = function()
{	
	//colocar o rolamento ir pra direção dos controles (W, A, S, D)
	
	if (rolando)
	{
		dir += -25 * tamanhox_dir
		
		if (dir > 360 || dir < -360) dir = 0
		
		if (rolando_time <= 0) rolando_time = 0.7 * 60
		
		
		image_index = 1
		
		velh = lengthdir_x(vel + 5,mouse_dir)
		velv = lengthdir_y(vel + 5,mouse_dir)
		
		if (rolando_delay > 0) rolando_delay --
		else if (rolando_delay <= 0) rolando = false
	}
	else
	{
		image_index = 0
		
		if (rolando_time > 0) rolando_time --
		
		rolando_delay = 0.5 * 60
		
		var roll = keyboard_check_pressed(vk_space) 
		
		//direção
		var up,down,left,right
	
		right = keyboard_check(ord("D"))
		left = keyboard_check(ord("A"))
		up = keyboard_check(ord("W"))
		down = keyboard_check(ord("S"))
		
		var temp = 0.3
		
		var dir_x = right - left
		var dir_y = down - up

		if (dir_x != 0 || dir_y != 0)
		{
		    var target_dir = point_direction(0, 0, dir_x, dir_y)
    
		    mouse_dir = lerp(mouse_dir, target_dir, temp)
		}
		
		if (roll && rolando_time <= 0) 
		{
			rolando = true
			i_frame = 0.2 * 60
			tocar_som(snd_upp)
		}
	}
}

morto = function()
{
	//morrer
	if (vida <= 0 && !vida_extra)
	{
		dir = 0
		vivo = false
		brilho = 1
		imagex = lerp(imagex,0,0.2)
		imagey = lerp(imagey,3,0.4)
		
		//se tiver chip de explossão
		if (global.chip_1 = 5 || global.chip_2 = 5 || global.chip_3 = 5)
		{
			if (!criar_orb_ao_morrer)
			{
				create_orb(x,y,0,0,20,c_red,2,true,0,5,10,time,0.01)
				criar_orb_ao_morrer = true
			}
		}	
		
		arma.visible = false
		if (pode_se_mover)
		{
			pode_se_mover = false
			global.soldados_qtd--
		}
		
		//viar o aliado mais proximo
		if (imagex = 0)
		{
			//ainda tem aliados
			if (instance_exists(obj_aliados))
			{
				var perto = instance_nearest(x,y,obj_aliados)
				
				if (perto.vida > 0)
				{
					pode_se_mover = true
					vida = perto.vida
					vivo = true
					x = perto.x
					y = perto.y
					skin = perto.skin
					arma.arma = perto.arma.arma
					arma.delay_tiro = perto.arma.delay_tiro
					instance_destroy(perto.arma)
					instance_destroy(perto)
					criar_orb_ao_morrer = false
				}
				
				arma.visible = true
			}
			else
			{
				//FIM DE JOGO
				if (fim_de_game = false)
				{
					fim_de_game = true
					instance_create_depth(x,y,depth,obj_transicao)
				}
			}
		}
			
		
		
	}
	else if (vida <= 0 && vida_extra)
	{
		brilho = 1
		i_frame = 2 * 60
		vida = vida_max
		vida_extra = false
		obj_camera.shake_force = 10
		obj_camera.shake_time = 50
	}
}
