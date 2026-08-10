velh = 0
velv = 0
vel = 3

event_inherited()
sprite_corpo = sprite_index
sprite_pe = spr_dog_foot

dir = 0

brilho = 0

morto = false

alvo = obj_player

colision = [obj_inimigos,obj_aliados]

vivo = true

vida_max = 100

i_frame = 0

time = 2


arma = instance_create_depth(x,y,depth - 1,obj_arma)
arma.dono = id
arma.time = time

//indicador de dano
dano_levado = 0
dano_image_alpha = 0
dano_color = c_white
dano_x = 0
dano_y = 0
dano_tamanho = 0
dano_tamx = 0
dano_tamy = 0

chance_crit = 3

//planetas
#region

if (global.destino = 1)
{
	sprite_corpo = spr_alien_1
	sprite_pe = spr_dog_foot
	image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255))
	vida_max = 80
}
if (global.destino = 2)
{
	sprite_corpo = spr_bot
	sprite_pe = spr_bot_pe
	image_blend = c_white
	vida_max = 150
}
if (global.destino = 3)
{
	sprite_corpo = spr_alien_2
	sprite_pe = spr_dog_foot
	image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255))
	vida_max = 135
}
if (global.destino = 4)
{
	sprite_corpo = spr_cavaleiro
	sprite_pe = spr_cavaleiro_pe
	image_blend = c_white
	vida_max = 220
}
if (global.destino = 5)
{
	sprite_corpo = spr_golem
	sprite_pe = spr_golem_pe
	image_blend = c_white
	vida_max = 250
}

#endregion

vida = vida_max

imagex = 0

if (global.chip_1 = 8 || global.chip_2 = 8 || global.chip_3 = 8)
{
	chance_crit = 12
}

movimento = function()
{	
	if (vivo)
	{
		var destino = point_direction(x,y,alvo.x,alvo.y)
		var dist = point_distance(x,y,alvo.x,alvo.y)

		if (dist > 250)
		{
			velh = lengthdir_x(vel,destino)
			velv = lengthdir_y(vel,destino)
		}
		else
		{
			if (dist < 150)
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

atirar = function()
{
	var dist = point_distance(x,y,alvo.x,alvo.y)
	
	if (instance_exists(arma)) arma.alvo = alvo
	
	if (dist <= 300 && vivo = true)
	{
		if (arma.delay_tiro <= 0) arma.atira = true
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
			
			
			dano_image_alpha = 1
			dano_x = x + irandom_range(-50,50)
			dano_y = y + irandom_range(-80,20)
			dano_tamx = random_range(0.5,3)
			dano_tamy = random_range(0.5,3)
			
			boing(random_range(0.5,3),random_range(0.5,3))
		}
	}
	
	//i frames
	if (i_frame > 0) i_frame --
	
	//morrer
	if (vida <= 0)
	{
		dir = 0
		if (vivo)
		{
			vivo = false
			obj_player.inimigos --
		}
		brilho = 1
		imagex = lerp(imagex,0,0.1)
		imagey = lerp(imagey,3,0.2)
		
		instance_destroy(arma)
		
		if (imagex = 0) 
		{
			instance_destroy(self)
		}
			
		
		
	}
}