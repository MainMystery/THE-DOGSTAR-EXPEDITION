//mostrar preço de mais clones
draw_set_valign(fa_middle)
draw_set_halign(fa_center)

// mostrar barra de armas
if (botao = 20)
{
	draw_sprite_ext(sprite_index,0,x,y + 30,image_xscale,- 6,0,c_gray,1)
}

draw_self()

draw_set_color(c_black)
draw_set_alpha(1)


//textos de explicação
if (botao = 20)
{
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_text_ext_transformed(x + 120,y + 90,"Escolha uma arma, 2 clicks em aliados deixa a arma deles aleatória",30,480,0.5,0.5,0)
	draw_text_transformed(x + 63,y + 9,"Sua Arma",0.7,0.7,0)
	draw_text_transformed(x + 177,y + 9,"Aliados Arma",0.7,0.7,0)
}
if (botao = 4)
{
	draw_sprite_ext(sprite_index,0,x,y + 60,image_xscale,3.6,0,c_white,1)
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_text_ext_transformed(x + 80,y + 210,"Botão direito para ler chips desbloqueados e botão esquerdo para equipar eles",30,300,0.5,0.5,0)
}

// escolher quantidade de soldados
if (botao = 38)
{
	draw_set_halign(fa_center)
	
	draw_sprite_ext(spr_dog_2,0,(x * 3.5) - 8, y + 30,1,1,0,c_white,1)
	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_text_transformed((x * 8) - 10, y + 32,"Quantidade de Tropas \n que vai levar",0.5,0.5,0)
	draw_set_color(c_white)
	draw_set_alpha(1)
	
	draw_text_transformed((x * 8) - 8, y + 30,"Quantidade de Tropas \n que vai levar",0.5,0.5,0)
	draw_text_transformed((x * 7) - 8, y + 100,global.soldados_qtd,1,1,0)
	draw_sprite_ext(spr_seta,0,(x * 7) - 9, y + 70,2,2,0,c_white,1)
	draw_sprite_ext(spr_seta,0,(x * 7) - 9, y + 130,2,2,180,c_white,1)
	
	draw_text_transformed((x * 7) - 8, y + 180,"Use as setinhas \n cima e baixo ou W e S \n Para mudar a quantidade de \n tropas que vão com você",0.5,0.5,0)
}

//informações do planeta
if (botao = 37)
{
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_set_halign(fa_left)
	
	//somenete antes de visitar o planeta
	if (global.destino = 1)
	{
		draw_sprite_ext(spr_planeta1,0,x + 60,y + 80,2,2,0,c_aqua,1)
		draw_text_transformed(x + 75,y + 30,"NOME: \n LAK_2310",0.8,0.8,0)
		
		draw_sprite_ext(spr_line,0,x + 215,y + 50,0.7,1,0,c_white,1)
		
		if (global.guerra_planeta1 <= 0 && global.paz_planeta1 <= 0)
		{
			draw_sprite_ext(spr_planeta_info_1,2,x + 140,y + 90,1.5,1.5,0,c_white,1)
			draw_text_ext_transformed(x + 20,y + 220,"Curiosidade: Este planeta está em um período semelhante ao da Era Jurássica da Terra, onde dinossauros coexistem com um povo primitivo.",30,380,0.5,0.5,0)
			
			draw_text_transformed(x + 75,y + 68,"PERIGO:",0.8,0.8,0)
	
			draw_sprite_ext(spr_line,0,x + 215,y + 100,1,1,0,c_white,1)
	
	
			draw_text_ext_transformed(x + 20,y + 130,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
	
			draw_set_color(c_red)
			draw_text_ext_transformed(x + 20,y + 155,"Perigo significa a dificuldade de enfrentar esse planeta.",30,380,0.5,0.5,0)
		}
		else if (global.guerra_planeta1 > 0 || global.paz_planeta1 > 0)
		{
		
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_text_transformed(x + 150,y + 70,"status com o planeta",0.5,0.5,0)
			
			draw_set_halign(fa_right)
			draw_text_transformed(x + 220,y + 100,"PAZ : " + string(global.paz_planeta1) + string("%"),1,1,0)
			draw_text_transformed(x + 220,y + 120,"GUERRA : " + string(global.guerra_planeta1) + string("%"),1,1,0)
			
			var areas_dominadas = global.planet1_A1 + global.planet1_A2 + global.planet1_A3 + global.planet1_A4
			var areas_total = 4
			
			draw_text_transformed(x + 220,y + 145,"ÁREAS EXPLORADAS:" + string(areas_dominadas) + string("/") + string(areas_total),0.5,0.5,0)
			draw_text_ext_transformed(x + 220,y + 170,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
		}
	}
	if (global.destino = 2)
	{
		draw_sprite_ext(spr_planeta2,0,x + 60,y + 80,1.5,1.5,0,c_aqua,1)
		draw_text_transformed(x + 75,y + 30,"NOME: \n B12-673",0.8,0.8,0)
		
		if (global.guerra_planeta2 <= 0 && global.paz_planeta2 <= 0)
		{
			draw_sprite_ext(spr_planeta_info_1,3,x + 140,y + 90,1.5,1.5,0,c_white,1)
			draw_text_ext_transformed(x + 20,y + 220,"Curiosidade: Este planeta é dominado por robôs avançados e possui a tecnologia mais desenvolvida deste sistema solar. Todo o lixo é descartado na parte inferior do planeta.",30,380,0.5,0.5,0)
			
			draw_text_transformed(x + 75,y + 68,"PERIGO:",0.8,0.8,0)
	
			draw_sprite_ext(spr_line,0,x + 215,y + 100,1,1,0,c_white,1)
	
	
			draw_text_ext_transformed(x + 20,y + 130,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
	
			draw_set_color(c_red)
			draw_text_ext_transformed(x + 20,y + 155,"Perigo significa a dificuldade de enfrentar esse planeta.",30,380,0.5,0.5,0)
		}
		else if (global.guerra_planeta2 > 0 || global.paz_planeta2 > 0)
		{
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_text_transformed(x + 150,y + 70,"status com o planeta",0.5,0.5,0)
			
			draw_set_halign(fa_right)
			draw_text_transformed(x + 220,y + 100,"PAZ : " + string(global.paz_planeta2) + string("%"),1,1,0)
			draw_text_transformed(x + 220,y + 120,"GUERRA : " + string(global.guerra_planeta2) + string("%"),1,1,0)
			
			var areas_dominadas = global.planet2_A1 + global.planet2_A2 + global.planet2_A3 + global.planet2_A4
			var areas_total = 4
			
			draw_text_transformed(x + 220,y + 145,"ÁREAS EXPLORADAS:" + string(areas_dominadas) + string("/") + string(areas_total),0.5,0.5,0)
			draw_text_ext_transformed(x + 220,y + 170,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
		}
	}
	if (global.destino = 3)
	{
		draw_sprite_ext(spr_planeta3,0,x + 60,y + 80,1,1,-65,c_aqua,1)
		draw_text_transformed(x + 75,y + 30,"NOME: \n C4YKE-278",0.8,0.8,0)
		
		
		if (global.guerra_planeta3 <= 0 && global.paz_planeta3 <= 0)
		{
			draw_text_ext_transformed(x + 20,y + 220,"Curiosidade: Este planeta possui dois anéis formados por minérios raros, usados na fabricação de armas extremamente poderosas.",30,380,0.5,0.5,0)
			draw_sprite_ext(spr_planeta_info_1,0,x + 140,y + 90,1.5,1.5,0,c_white,1)
			
			draw_text_transformed(x + 75,y + 68,"PERIGO:",0.8,0.8,0)
	
			draw_sprite_ext(spr_line,0,x + 215,y + 100,1,1,0,c_white,1)
	
	
			draw_text_ext_transformed(x + 20,y + 130,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
	
			draw_set_color(c_red)
			draw_text_ext_transformed(x + 20,y + 155,"Perigo significa a dificuldade de enfrentar esse planeta.",30,380,0.5,0.5,0)
		}
		else if (global.guerra_planeta3 > 0 || global.paz_planeta3 > 0)
		{
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_text_transformed(x + 150,y + 70,"status com o planeta",0.5,0.5,0)
			
			draw_set_halign(fa_right)
			draw_text_transformed(x + 220,y + 100,"PAZ : " + string(global.paz_planeta3) + string("%"),1,1,0)
			draw_text_transformed(x + 220,y + 120,"GUERRA : " + string(global.guerra_planeta3) + string("%"),1,1,0)
			
			var areas_dominadas = global.planet3_A1 + global.planet3_A2 + global.planet3_A3 + global.planet3_A4
			var areas_total = 4
			
			draw_text_transformed(x + 220,y + 145,"ÁREAS EXPLORADAS:" + string(areas_dominadas) + string("/") + string(areas_total),0.5,0.5,0)
			draw_text_ext_transformed(x + 220,y + 170,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
		}
	}
	if (global.destino = 4)
	{
		draw_sprite_ext(spr_planeta4,0,x + 60,y + 80,1,1,-65,c_aqua,1)
		draw_text_transformed(x + 75,y + 30,"NOME: \n ERRA-8B4",0.8,0.8,0)
		
		if (global.guerra_planeta4 <= 0 && global.paz_planeta4 <= 0)
		{
			draw_text_ext_transformed(x + 20,y + 220,"Curiosidade: Este planeta vive uma época muito semelhante à Idade Média da Terra, mas sua tecnologia é bastante avançada para os padrões da época.",30,380,0.5,0.5,0)
			draw_sprite_ext(spr_planeta_info_1,4,x + 140,y + 90,1.5,1.5,0,c_white,1)
			
			draw_text_transformed(x + 75,y + 68,"PERIGO:",0.8,0.8,0)
	
			draw_sprite_ext(spr_line,0,x + 215,y + 100,1,1,0,c_white,1)
	
	
			draw_text_ext_transformed(x + 20,y + 130,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
	
			draw_set_color(c_red)
			draw_text_ext_transformed(x + 20,y + 155,"Perigo significa a dificuldade de enfrentar esse planeta.",30,380,0.5,0.5,0)
		}
		else if (global.guerra_planeta4 > 0 || global.paz_planeta4 > 0)
		{
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_text_transformed(x + 150,y + 70,"status com o planeta",0.5,0.5,0)
			
			draw_set_halign(fa_right)
			draw_text_transformed(x + 220,y + 100,"PAZ : " + string(global.paz_planeta4) + string("%"),1,1,0)
			draw_text_transformed(x + 220,y + 120,"GUERRA : " + string(global.guerra_planeta4) + string("%"),1,1,0)
			
			var areas_dominadas = global.planet4_A1 + global.planet4_A2 + global.planet4_A3 + global.planet4_A4
			var areas_total = 4
			
			draw_text_transformed(x + 220,y + 145,"ÁREAS EXPLORADAS:" + string(areas_dominadas) + string("/") + string(areas_total),0.5,0.5,0)
			draw_text_ext_transformed(x + 220,y + 170,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
		}
	}
	if (global.destino = 5)
	{
		draw_sprite_ext(spr_planeta5,0,x + 40,y + 80,2,2,0,c_aqua,1)
		draw_text_transformed(x + 75,y + 30,"NOME: \n F3LL4Z-08",0.8,0.8,0)
		
		if (global.guerra_planeta5 <= 0 && global.paz_planeta5 <= 0)
		{
			draw_text_ext_transformed(x + 20,y + 220,"Curiosidade: Este planeta tem vulcões e terremotos frequentes. Os vulcões parecem nunca parar de entrar em erupção.",30,380,0.5,0.5,0)
			draw_sprite_ext(spr_planeta_info_1,1,x + 140,y + 90,1.5,1.5,0,c_white,1)
			
			draw_text_transformed(x + 75,y + 68,"PERIGO:",0.8,0.8,0)
	
			draw_sprite_ext(spr_line,0,x + 215,y + 100,1,1,0,c_white,1)
	
	
			draw_text_ext_transformed(x + 20,y + 130,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
	
			draw_set_color(c_red)
			draw_text_ext_transformed(x + 20,y + 155,"Perigo significa a dificuldade de enfrentar esse planeta.",30,380,0.5,0.5,0)
		}
		else if (global.guerra_planeta5 > 0 || global.paz_planeta5 > 0)
		{
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_text_transformed(x + 150,y + 70,"status com o planeta",0.5,0.5,0)
			
			draw_set_halign(fa_right)
			draw_text_transformed(x + 220,y + 100,"PAZ : " + string(global.paz_planeta5) + string("%"),1,1,0)
			draw_text_transformed(x + 220,y + 120,"GUERRA : " + string(global.guerra_planeta5) + string("%"),1,1,0)
			
			var areas_dominadas = global.planet5_A1 + global.planet5_A2 + global.planet5_A3 + global.planet5_A4
			var areas_total = 4
			
			draw_text_transformed(x + 220,y + 145,"ÁREAS EXPLORADAS:" + string(areas_dominadas) + string("/") + string(areas_total),0.5,0.5,0)
			draw_text_ext_transformed(x + 220,y + 170,"População Da Área: " + string(global.quantidade_inimigos),30,400,0.6,0.6,0)
		}
	}
	
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
}

draw_set_halign(fa_center)

if (botao = 21 || botao = 22) 
{
	if (sprite_arma != noone)
	{
		var xx1 = x - sprite_get_width(sprite_arma) div 2
		var yy1 = y - sprite_get_height(sprite_arma) div 2
		
		draw_sprite_ext(sprite_arma,0,xx1,yy1 + off_set,tamanho_arma,tamanho_arma,0,c_black,1)
		
	}
	else draw_text_transformed(x,y,"Aleatória",0.5,0.5,0)
}

//armas
if (botao >= 24 && botao <= 31)
{
	if (!arma_desbloqueada) draw_sprite_ext(sprite_arma2,frame,x + off_set_armax,y + off_set_army,tamx_com,tamy_com,rot,c_white,1)
	else draw_sprite_ext(sprite_arma2,0,x + off_set_armax,y + off_set_army,tamx_com,tamy_com,rot,c_white,1)
}