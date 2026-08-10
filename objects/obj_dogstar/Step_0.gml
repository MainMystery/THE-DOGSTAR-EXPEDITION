//sumir brilho
brilho = lerp(brilho,0,0.1)

//tamanho e direção
dir = lerp(dir,0,0.3)
tamx = lerp(tamx,tamanho,0.1)
tamy = lerp(tamy,tamanho,0.2)

ganhou_alpha = lerp(ganhou_alpha,0,0.1)

rot_bar = lerp(rot_bar,0,0.1)
tamx2 = lerp(tamx2,15,0.1)
tamy2 = lerp(tamy2,15,0.2)

if (rot_bar > 5 || rot_bar < -5) life_y = lerp(life_y,0,0.5)
if (rot_bar > -5 && rot_bar < 5)
{
	life_y = lerp(life_y,4,0.2)
}



//venceu
if (venceu)
{
	puss += 0.1
	
	x -= puss
	
	velh = 0
	velv = 0
	
	if (x <= -96)
	{
		tela_escura = lerp(tela_escura,1,0.1)
		
		if (tela_escura >= 1) 
		{
			//ir para o planeta ou só uma viajem
			if (global.destino != 0)
			{
				if (global.destino = 1)
				{
					if (global.paz_planeta1 = 0 && global.guerra_planeta1 = 0) room_goto(rm_negociacao)
					else room_goto(rm_planeta)
				}
				if (global.destino = 2)
				{
					if (global.paz_planeta2 = 0 && global.guerra_planeta2 = 0) room_goto(rm_negociacao)
					else room_goto(rm_planeta)
				}
				if (global.destino = 3)
				{
					if (global.paz_planeta3 = 0 && global.guerra_planeta3 = 0) room_goto(rm_negociacao)
					else room_goto(rm_planeta)
				}
				if (global.destino = 4)
				{
					if (global.paz_planeta4 = 0 && global.guerra_planeta4 = 0) room_goto(rm_negociacao)
					else room_goto(rm_planeta)
				}
				if (global.destino = 5)
				{
					if (global.paz_planeta5 = 0 && global.guerra_planeta5 = 0) room_goto(rm_negociacao)
					else room_goto(rm_planeta)
				}
			}
			else room_goto(rm_principal)
		}
	}
	
	exit
}

//morrer
if (global.vida_nave <= 0)
{
	if (instance_exists(luz))
	{
		instance_destroy(luz)
		tocar_som(snd_boom)
	}
	
	if (sprite_index != spr_explosion)
	{
		sprite_index = spr_explosion
		image_index = 0
	}
	
	if (image_index >= sprite_get_number(sprite_index) - 1)
	{
		image_speed = 0
		image_index = sprite_get_number(sprite_index) - 1
		tela_escura = lerp(tela_escura,1,0.1)
	}

	velh = 0
	velv = 0
	
	if (tela_escura >= 1) room_goto(rm_game_over)

	exit
}

tela_escura = lerp(tela_escura,0,0.1)

//chegando ao final
if (pontuacao_atual < pontuacao_necesaria)
{
	//se for boss acaba tudo já
	if (evento = "boss")
	{
		pontuacao_atual = pontuacao_necesaria - 120
	}
	else 
	{
		pontuacao_atual += 1
	}
	
}
else if (pontuacao_atual >= pontuacao_necesaria)
{
	//evento de boss
	if (evento != "boss")
	{
		//o proximo evento é o final
		if (next_evento = "")
		{
			evento = ""
			pontuacao_atual = pontuacao_necesaria
			if (!instance_exists(obj_meteoro)) venceu = true
		}
		else
		{
			evento = next_evento
			pontuacao_atual = 0
			next_evento = ""
			pontuacao_necesaria = irandom_range(1000,2000)
		}
	}
}


if (i_frame > 0) 
{
	i_frame--
	
	if (delay_brilho > 0) delay_brilho --
	else if (delay_brilho <= 0)
	{
		brilho = choose(0,1,0.5)
		delay_brilho = 20
		vel = irandom_range(1,2)
		cor_bar = choose(c_aqua,c_red)
	}
}
else if (i_frame <= 0) 
{
	vel = 3
	cor_bar = c_aqua
}

moviment()
atirar()
event()

//buraco negro
if (instance_exists(obj_black_hole))
{
	var dir_ = point_direction(x,y,obj_black_hole.x,obj_black_hole.y)
	var dist = point_distance(x,y,obj_black_hole.x,obj_black_hole.y)
	
	puss += 0.01
	
	if (keyboard_check_pressed(vk_space)) puss -= random_range(0.3,0.7)
	
	puss = clamp(puss,0,10)
	
	x += lengthdir_x(puss,dir_)
	y += lengthdir_y(puss,dir_)
	
	if (dist <= 200) puss += 0.02
	
	if (place_meeting(x,y,obj_black_hole) && i_frame <= 0)
	{
		tamx = random_range(0.3,2)
		tamy = random_range(0.3,2)
		dir = irandom_range(-50,50)
	
		tamx2 = random_range(13,17)
		tamy2 = random_range(13,17)
		rot_bar = irandom_range(-200,200)
	
		i_frame = 5
		
		tocar_som(snd_hit2)
		
		global.vida_nave -= 1
		obj_camera.shake_force = 2
		obj_camera.shake_time = 30
	}
}


luz.x = x + 20
luz.y = y

move_and_collide(velh,0,colision,12)
move_and_collide(0,velv,colision,12)