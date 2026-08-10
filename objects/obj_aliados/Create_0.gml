velh = 0
velv = 0
vel = 4

clone = false
delay_clone = 0

event_inherited()
sprite_pe = spr_dog_foot


dir = 0

brilho = 1

morto = false

alvo = obj_inimigos

vivo = true

vida_max = 150

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

vida = vida_max

i_frame = 0

melle = false

time = 1

colision = [obj_inimigos,obj_aliados,obj_parede]

arma = instance_create_depth(x,y,depth - 1,obj_arma)
arma.dono = id
arma.mellee = melle
arma.time = time
arma.aliados = true

image_speed = 0

delay_andar = 1 * 60


cell_t = 32

cell_h = room_width div cell_t
cell_v = room_height div cell_t
criar_orb_ao_morrer = false

delay_i_frame = 0

movimento = function()
{	
	if (instance_exists(alvo))
	{
		if (vivo)
		{
			var destino = point_direction(x,y,alvo.x,alvo.y)
			var dist = point_distance(x,y,alvo.x,alvo.y)

			if (!melle)
			{
				if (dist > 400)
				{
					velh = lengthdir_x(vel,destino)
					velv = lengthdir_y(vel,destino)
				}
				else
				{
					if (dist < 300)
					{
						velh = -lengthdir_x(vel,destino)
						velv = -lengthdir_y(vel,destino)
					}
					else
					{
						velh = 0
						velv = 0
					}
				}
			}
			else
			{
				if (dist > 30)
				{
					velh = lengthdir_x(vel,destino)
					velv = lengthdir_y(vel,destino)
				}
				else
				{
					velh = 0
					velv = 0
				}
			}
	
			if (velh > 0)  dir = lerp(dir,-10,0.1)
			if (velh < 0)  dir = lerp(dir,10,0.1)

			if (velh = 0)  dir = lerp(dir,0,0.1)
			
			//direção olhando
			if (arma.x > x) tamanhox_dir = 1
			if (arma.x < x) tamanhox_dir = -1
		}
		else
		{
			velh = 0
			velv = 0
		}
	}
}

atirar = function()
{
	if (instance_exists(alvo))
	{
		if (!melle)
		{
			var dist = point_distance(x,y,alvo.x,alvo.y)
	
			if (instance_exists(arma)) arma.alvo = alvo
	
			if (dist <= 450 && vivo = true)
			{
				if (arma.delay_tiro <= 0) arma.atira = true
			}
		}
		else
		{
			var dist = point_distance(x,y,alvo.x,alvo.y)
	
			if (instance_exists(arma)) arma.alvo = alvo
	
			if (dist <= 50 && vivo = true)
			{
				if (arma.delay_tiro <= 0) arma.atira = true
			}
		}
	}
	else
	{
		if (instance_exists(arma)) arma.atira = false
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
		if (tiro_inigo.time != 1) 
		{
			brilho = 1.3
			vida -= irandom_range(tiro_inigo.dano,tiro_inigo.dano + 8)
			
			i_frame = 15
			
			boing(random_range(0.5,3),random_range(0.5,3))
			
			//chances criar tiros
			if (global.chip_1 = 6 || global.chip_2 = 6 || global.chip_3 = 6)
			{
				var chance_tiro = irandom(100)
			
				//criando
				if (chance_tiro <= 20)
				{
					create_bullet(x,y,tiro_inigo.dir + 150,time,c_red,2,c_red,1,2,8,10,0.01)
					create_bullet(x,y,tiro_inigo.dir + 180,time,c_red,2,c_red,1,2,8,10,0.01)
					create_bullet(x,y,tiro_inigo.dir + 210,time,c_red,2,c_red,1,2,8,10,0.01)
				}
			}
		}
		//time aliado
		else
		{
			//estou com chip de vida
			if (global.chip_1 = 1 || global.chip_2 = 1 || global.chip_3 = 1)
			{
				instance_destroy(tiro_inigo)
				i_frame += 10
				brilho = 1.3
				vida += 10
				boing(random_range(0.5,3),random_range(0.5,3))
			}
		}
	}
	
	//i frames
	if (i_frame > 0)
	{
		i_frame --
		
		if (delay_i_frame > 0) delay_i_frame--
		else if (delay_i_frame <= 0)
		{
			brilho = 1
			delay_i_frame = 10
		}
	}
	
	//morrer
	if (vida <= 0)
	{
		//se tiver chip de explossão
		if (global.chip_1 = 5 || global.chip_2 = 5 || global.chip_3 = 5)
		{
			if (!criar_orb_ao_morrer)
			{
				create_orb(x,y,0,0,20,c_red,2,true,0,5,10,time,0.01)
				criar_orb_ao_morrer = true
			}
		}	
		
		dir = 0
		if (vivo)
		{
			global.soldados_qtd--
			vivo = false
		}
		brilho = 1
		imagex = lerp(imagex,0,0.3)
		imagey = lerp(imagey,3,0.4)
		
		instance_destroy(arma)
	
		if (imagex = 0) instance_destroy(self)
			
		
		
	}
}