if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

//dono não existe
if (!instance_exists(dono) || dono = noone) 
{
	instance_destroy(self)
	exit
}


//arma do player
if (dono = obj_player.id)
{
	pode_usar = dono.pode_se_mover
	dir = point_direction(x,y,mouse_x,mouse_y)	
	atira = mouse_check_button(mb_left)
	delay_adicional = 0
	
	if (delay_tiro <= 1 && atira && pode_usar) tocar_som(snd_tiro_2)
	
	if(!select_arma)
	{
		select_arma = true
		arma = global.arma_player
	}
}
//arma do bot
else
{
	if (instance_exists(alvo)) dir = point_direction(x,y,alvo.x,alvo.y)
	delay_adicional = 10
	
	//aliado
	if (!select_arma)
	{
		//aliados
		if (aliados)
		{
			if (global.arma_aliados != 9) arma = global.arma_aliados
			else
			{
				//quais armas desbloqueadas você tem
				var armas = []

				if (global.arma_1) array_push(armas, 1)
				if (global.arma_2) array_push(armas, 2)
				if (global.arma_3) array_push(armas, 3)
				if (global.arma_4) array_push(armas, 4)
				if (global.arma_5) array_push(armas, 5)
				if (global.arma_6) array_push(armas, 6)
				if (global.arma_7) array_push(armas, 7)
				if (global.arma_8) array_push(armas, 8)

				if (array_length(armas) > 0)
				{
				    arma_random = armas[irandom(array_length(armas) - 1)]
				}
			
			
				arma = arma_random
				
			}
		}
		//inimigos
		else
		{
			//quais armas desbloqueadas você tem
			var armas = []

			if (global.arma_inimigo1) array_push(armas, 1)
			if (global.arma_inimigo2) array_push(armas, 2)
			if (global.arma_inimigo3) array_push(armas, 3)
			if (global.arma_inimigo4) array_push(armas, 4)
			if (global.arma_inimigo5) array_push(armas, 5)
			if (global.arma_inimigo6) array_push(armas, 6)
			if (global.arma_inimigo7) array_push(armas, 7)
			if (global.arma_inimigo8) array_push(armas, 8)
			if (global.arma_inimigo9) array_push(armas, 9)
			
			if (array_length(armas) > 0)
			{
				arma_random = armas[irandom(array_length(armas) - 1)]
			}
			
			
			arma = arma_random
		}
		
		
		select_arma = true
	}
}


//se tem luz
if (instance_exists(luz))
{
	//cor da luz da arma
	luz.image_blend = cor_impact
	luz.image_angle = image_angle
	
	if (arma = 1)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 0.5
		
		luz.image_xscale = 1
		luz.image_yscale = 0.8
		luz.x = x 
		luz.y = y
	}
	if (arma = 2)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 1
		
		luz.image_xscale = 0.8
		luz.image_yscale = 0.8
		luz.x = x + lengthdir_x(15,image_angle)
		luz.y = y + lengthdir_y(15,image_angle)
	}
	if (arma = 3)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 1
		
		luz.image_xscale = 1.5
		luz.image_yscale = 0.8
		luz.x = x + lengthdir_x(15,image_angle)
		luz.y = y + lengthdir_y(15,image_angle)
	}
	if (arma = 4)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 1
		
		luz.image_xscale = 1.5
		luz.image_yscale = 0.8
		luz.x = x + lengthdir_x(15,image_angle)
		luz.y = y + lengthdir_y(15,image_angle)
	}
	if (arma = 5)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 1
		
		luz.image_xscale = 1
		luz.image_yscale = 1
		luz.x = x + lengthdir_x(45,image_angle)
		luz.y = y + lengthdir_y(45,image_angle)
	}
	if (arma = 6)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 0.5
		
		luz.image_xscale = 0.5
		luz.image_yscale = 0.5
		luz.x = x + lengthdir_x(5,image_angle)
		luz.y = y + lengthdir_y(5,image_angle)
	}
	if (arma = 7)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 0.5
		
		luz.image_xscale = 1
		luz.image_yscale = 0.5
		luz.x = x + lengthdir_x(5,image_angle)
		luz.y = y + lengthdir_y(5,image_angle)
	}
	if (arma = 8)
	{
		//sumir a luz da arma
		if (visible = false) luz.image_alpha = 0
		else luz.image_alpha = 0.5
		
		luz.image_xscale = 1
		luz.image_yscale = 1
		luz.x = x + lengthdir_x(15,image_angle)
		luz.y = y + lengthdir_y(15,image_angle)
	}
}

depth = dono.depth - 5


//mais dano com chip
if (time = 1)
{
	if (global.chip_1 = 7 || global.chip_2 = 7 || global.chip_3 = 7)
	{
		dano_a_mais = 10
	}
}
	
#region // armas e suas customizações
	
//qual arma?
if (arma = 1)
{
	sprite_index = spr_arma_1
	dano_tiro = 5 + dano_a_mais
	velocidade = 5
	cor_tiro = c_aqua
	cor_disparo = c_aqua
	cor_impact = c_aqua
	tamanho_tiro = 3
	intensidade_brilho = 0.3
	tempo = 0.02
	tipy = 1
	delay_tiro_tempo = 10
}
if (arma = 2)
{
	sprite_index = spr_arma_2
	dano_tiro = 12 + dano_a_mais
	velocidade = 8
	cor_tiro = c_red
	cor_disparo = c_red
	cor_impact = c_red
	tamanho_tiro = 3
	intensidade_brilho = 0.3
	tempo = 0.03
	tipy = 1
	delay_tiro_tempo = 5
}
if (arma = 3)
{
	sprite_index = spr_arma_3
	dano_tiro = 40 + dano_a_mais
	velocidade = 8
	cor_tiro = c_yellow
	cor_disparo = c_yellow
	cor_impact = c_orange
	tamanho_tiro = 4
	intensidade_brilho = 1
	tempo = 0.05
	tipy = 2
	delay_tiro_tempo = 4 * 60
}
if (arma = 4)
{
	sprite_index = spr_arma_4
	dano_tiro = 80 + dano_a_mais
	velocidade = 15
	cor_tiro = c_green
	cor_disparo = c_lime
	cor_impact = c_lime
	tamanho_tiro = 6
	intensidade_brilho = 1.5
	tempo = 0.01
	tipy = 1
	delay_tiro_tempo = 200
}
if (arma = 5)
{
	sprite_index = spr_arma_5
	dano_tiro = 50 + dano_a_mais
	velocidade = 10
	cor_tiro = make_color_rgb(255,100,210)
	cor_disparo = make_color_rgb(255,100,210)
	cor_impact = c_fuchsia
	tamanho_tiro = 8
	intensidade_brilho = 1
	tempo = 0.025
	tipy = 3
	delay_tiro_tempo = 300
	qtd_orb = 20
	time_explodir = 1 * 60
}
if (arma = 6)
{
	var col = make_color_rgb(255,0,120)
	
	sprite_index = spr_arma_6
	dano_tiro = 22 + dano_a_mais
	velocidade = 10
	cor_tiro = col
	cor_disparo = col
	cor_impact = col
	tamanho_tiro = 3
	intensidade_brilho = 0.3
	tempo = 0.03
	tipy = 1
	delay_tiro_tempo = 4
}
if (arma = 7)
{
	sprite_index = spr_arma_7
	dano_tiro = 75 + dano_a_mais
	velocidade = 10
	cor_tiro = c_blue
	cor_disparo = c_blue
	cor_impact = c_blue
	tamanho_tiro = 3
	intensidade_brilho = 0.3
	tempo = 0.03
	tipy = 4
	delay_tiro_tempo = 30
}
if (arma = 8)
{
	var hue = current_time / 20 % 255
	var cor = make_color_hsv(hue, 255, 255)
	
	image_blend = cor
	sprite_index = spr_arma_8
	dano_tiro = 32 + dano_a_mais
	velocidade = 10
	cor_tiro = cor
	cor_disparo = cor
	cor_impact = cor
	tamanho_tiro = 3
	intensidade_brilho = 0.3
	tempo = 0.04
	tipy = 3
	delay_tiro_tempo = 25
	qtd_orb = 20
	time_explodir =  0.5 * 60
}
else image_blend = c_white
	
//lança
if (arma = 9)
{
	sprite_index = spr_lanca
	dano_tiro = 12
	velocidade = 8
	tamanho_tiro = 1.5
	tempo = 0.02
	tipy = 5
	delay_tiro_tempo = 2 * 60
	instance_destroy(luz)
	tam = 1
}
	
#endregion

// requechotear
if (time = 1)
{

	if (global.chip_1 = 10 || global.chip_2 = 10 || global.chip_3 = 10)
	{
		tempo = 0.01
		recshot = false
	}
}

// pode atirar
if (pode_usar)
{
	x += lengthdir_x(4,dir)
	y += lengthdir_y(4,dir)
	
	x = clamp(x, dono.x - 10, dono.x + 10)
	y = clamp(y, dono.y , dono.y + 10)
	
	//abaixar o delay para atirar
	if (delay_tiro > 0) delay_tiro --
	if (delay_tiro <= 5) tiro = false
	
	//apontar para direção
	image_angle = dir
	
		
	//tamanho
	if (image_angle > 90 && image_angle < 270) image_yscale = -tam + tamanho_addy
	else image_yscale = tam + tamanho_addy
		
	image_xscale = tam + tamanho_add
		
		
	//atirar
	if (atira && delay_tiro = 0)
	{
		delay_tiro = delay_tiro_tempo + delay_adicional
		tiro = true

		tamanho_add  = random_range(0.5,2.12)
		tamanho_addy = random_range(0.5,2.12)

		var xx = 0
		var yy = 0
		
		xx = x + lengthdir_x(20,dir)
		yy = y + lengthdir_y(20,dir)
		
		// ser sem lança
		if (tipy != 5)
		{
		
			//tiro comum
			if (tipy = 1) create_bullet(xx,yy,dir,time,cor_disparo,tamanho_tiro,cor_tiro,intensidade_brilho,tamanho_tiro,velocidade,dano_tiro,tempo,recshot = false)

			//tiro de doze
			if (tipy = 2)
			{
				create_bullet(xx,yy,dir + 15,time,cor_disparo,tamanho_tiro,cor_tiro,intensidade_brilho,tamanho_tiro,velocidade,dano_tiro,tempo,recshot = false)
				create_bullet(xx,yy,dir,time,cor_disparo,tamanho_tiro,cor_tiro,intensidade_brilho,tamanho_tiro,velocidade,dano_tiro,tempo,recshot = false)
				create_bullet(xx,yy,dir - 15,time,cor_disparo,tamanho_tiro,cor_tiro,intensidade_brilho,tamanho_tiro,velocidade,dano_tiro,tempo,recshot = false)
			}
			
			//orbe explosivo
			if (tipy = 3)
			{
				create_orb(xx,yy,dir,10,qtd_orb,cor_disparo,3,true,time_explodir,5,dano_tiro,time,tempo)
			}
			
			//aleatoria
			if (tipy = 4)
			{
				//escolher
				var esc = choose(1,1,2)
				
				if (esc = 1) create_bullet(xx,yy,dir,time,cor_disparo,tamanho_tiro,cor_tiro,intensidade_brilho,tamanho_tiro,velocidade,dano_tiro,tempo,recshot = false)
				if (esc = 2) create_orb(xx,yy,dir,15,5,c_red,3,true,2 * 60,6,dano_tiro div 2,time)
				
			}
					
			create_light(xx,yy,cor_impact,3,2,2,,0.3)
		
		}
		//lança
		else
		{
			var lac = instance_create_layer(xx,yy,"tiros",obj_tiro)
			lac.dir = dir
			lac.lanca = true
		}
	}
}




tamanho_add = lerp(tamanho_add,0,0.1)
tamanho_addy = lerp(tamanho_addy,0,0.2)

