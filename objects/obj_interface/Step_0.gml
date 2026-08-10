//sair da tela quando não for sua vez de funcionar
if (global.interface != funciona_em_qual_parte)
{
	y = lerp(y,y_final,0.1)
	esc_sair = lerp(esc_sair,0,0.1)
	tolerant = 20
}
else
{
	x = lerp(x,xx_pos,0.25)
	y = lerp(y,yy_pos,0.1)
	
	if (botao = 37) esc_sair = lerp(esc_sair,1,0.1)
	
	if (botao = 38)
	{
		var _mouse_tot	 = position_meeting(mouse_x,mouse_y,id)
		var _mouse_click = mouse_check_button_pressed(mb_left)
		
		var cima = keyboard_check(vk_up) || keyboard_check(ord("W"))
		var baixo = keyboard_check(vk_down) || keyboard_check(ord("S"))

		if (cima || baixo)
		{
			if (tolerant > 0)
			{
				tolerant --
				cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
				baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
			}
		}
		else
		{
			tolerant = 10
		}


		if (_mouse_tot && _mouse_click)
		{
			if (mouse_y <= y + 200)
			{
				if (mouse_y >= y + 90) baixo = true
				if (mouse_y <= y + 90) cima = true
			}
		}
		if (cima)
		{
			if (global.soldados_qtd_total > 0)
			{
				global.soldados_qtd += 1
				global.soldados_qtd_total -= 1
			}
		}
		
		if (baixo)
		{
			if (global.soldados_qtd > 0)
			{
				global.soldados_qtd -= 1
				global.soldados_qtd_total += 1
			}
		}
	}
}

if (botao = 0) exit


if (botao = 1)
{
	if (global.item_novo = 0) image_index = 0
	else if (global.item_novo = 1) image_index = 1
}
if (botao = 3)
{
	if (global.item_novo = 0) image_index = 0
	else if (global.item_novo = 2) image_index = 1
}

//armas
#region

if (botao = 21)
{
	if (global.arma_player = 1)
	{
		sprite_arma = spr_arma_1
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_player = 2)
	{
		sprite_arma = spr_arma_2
		tamanho_arma = 2
		off_set = 5
	}
	if (global.arma_player = 3)
	{
		sprite_arma = spr_arma_3
		tamanho_arma = 1.5
		off_set = 5
	}
	if (global.arma_player = 4)
	{
		sprite_arma = spr_arma_4
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_player = 5)
	{
		sprite_arma = spr_arma_5
		tamanho_arma = 1.5
		off_set = 10
	}
	if (global.arma_player = 6)
	{
		sprite_arma = spr_arma_6
		tamanho_arma = 2
		off_set = 0
	}
	if (global.arma_player = 7)
	{
		sprite_arma = spr_arma_7
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_player = 8)
	{
		sprite_arma = spr_arma_8
		tamanho_arma = 2
		off_set = 10
	}
}
if (botao = 22)
{
	if (global.arma_aliados = 1)
	{
		sprite_arma = spr_arma_1
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_aliados = 2)
	{
		sprite_arma = spr_arma_2
		tamanho_arma = 2
		off_set = 5
	}
	if (global.arma_aliados = 3)
	{
		sprite_arma = spr_arma_3
		tamanho_arma = 1.5
		off_set = 5
	}
	if (global.arma_aliados = 4)
	{
		sprite_arma = spr_arma_4
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_aliados = 5)
	{
		sprite_arma = spr_arma_5
		tamanho_arma = 1.5
		off_set = 10
	}
	if (global.arma_aliados = 6)
	{
		sprite_arma = spr_arma_6
		tamanho_arma = 2
		off_set = 0
	}
	if (global.arma_aliados = 7)
	{
		sprite_arma = spr_arma_7
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_aliados = 8)
	{
		sprite_arma = spr_arma_8
		tamanho_arma = 2
		off_set = 10
	}
	if (global.arma_aliados = 9)
	{
		sprite_arma = noone
	}

}

#endregion

//carregar chips os chips colocados
if (!carregar_chips && botao >= 6 && botao <= 15)
{
	if (global.chip_1 = chip_num)
	{
		xx_pos = chip1x
		yy_pos = chipy
		global.chip_1 = chip_num
		usando_chip = true
		tamx = 2
		tamy = 2
	}
						
	else if (global.chip_2 = chip_num)
	{
		xx_pos = chip2x
		yy_pos = chipy
		global.chip_2 = chip_num
		usando_chip = true
		tamx = 2
		tamy = 2
	}
						
	else if (global.chip_3 = chip_num)
	{
		xx_pos = chip3x
		yy_pos = chipy
		global.chip_3 = chip_num
		usando_chip = true
		tamx = 2
		tamy = 2
	}	
	
	carregar_chips = true
}

//passar o mouse
var _mouse_tot	 = position_meeting(mouse_x,mouse_y,id)
var _mouse_click = mouse_check_button_pressed(mb_left)
var _mouse_click2 = mouse_check_button_pressed(mb_right)

image_xscale = tam_atualx
image_yscale = tam_atualy


#region // desbloquear os chips

if (botao = 6) 
{
	if (!global.chip_dano_vida)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 7) 
{
	if (!global.chip_vidax3)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 8) 
{
	if (!global.chip_vida_50)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 9) 
{
	if (!global.vida_extra)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 10) 
{
	if (!global.explodir)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 11) 
{
	if (!global.tiro_ao_dano)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 12) 
{
	if (!global.chip_dano_mais)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 13) 
{
	if (!global.chip_critic)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 14) 
{
	if (!global.clones)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}
if (botao = 15) 
{
	if (!global.requichiote)
	{
		image_blend = c_black
	}
	else
	{
		image_blend = c_white
		chip_desbloqueado = true
	}
}

#endregion

#region // desbloquear as armas

if (botao = 24) 
{
	if (!global.arma_1)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_1
		off_set_armax = 18
		off_set_army  =  15
		arma_desbloqueada = true
	}
}
if (botao = 25) 
{
	if (!global.arma_2)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_2
		off_set_armax = 14
		
		arma_desbloqueada = true
	}
}
if (botao = 26) 
{
	if (!global.arma_7)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_7
		off_set_armax = 14
		off_set_army  =  20
		arma_desbloqueada = true
	}
}
if (botao = 27) 
{
	if (!global.arma_4)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_4
		off_set_armax = 30
		off_set_army  = 80
		arma_desbloqueada = true
	}
}
if (botao = 28) 
{
	if (!global.arma_5)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_5
		off_set_armax = 10
		off_set_army  =  15
		arma_desbloqueada = true
	}
}
if (botao = 29) 
{
	if (!global.arma_8)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_8
		off_set_armax = 5
		off_set_army  =  11
		arma_desbloqueada = true
	}
}
if (botao = 30) 
{
	if (!global.arma_6)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_6
		off_set_armax = 15
		off_set_army  =  8
		arma_desbloqueada = true
	}
}
if (botao = 31) 
{
	if (!global.arma_3)
	{
		sprite_arma2 = spr_arma_block
	}
	else
	{
		sprite_arma2 = spr_arma_3
		off_set_armax = 20
		off_set_army  =  20
		arma_desbloqueada = true
	}
}
#endregion

if (arma_desbloqueada) image_blend = make_color_rgb(65,65,88)


// interface dos chips
if (!passar_mouse_muda) exit


if (botao = 21) 
{
	if (global.arma_selecionada) sprite_index = spr_interface4
	else sprite_index = spr_interface4_1
}
if (botao = 22) 
{
	if (!global.arma_selecionada) sprite_index = spr_interface4
	else sprite_index = spr_interface4_1
}

if (keyboard_check_pressed(vk_escape)) global.interface = 0

if (_mouse_tot && global.interface = funciona_em_qual_parte)
{
	tam_atualx = lerp(tam_atualx,tamx + 0.15,0.1)
	tam_atualy = lerp(tam_atualy,tamy + 0.15,0.2)
	
	//mudar tamanho da arma
	if (botao > 23 && botao < 32)
	{
		tamx_com = lerp(tamx_com,tamx_com_mais,0.1)
		tamy_com = lerp(tamy_com,tamy_com_mais,0.3)
	}
	
	if (_mouse_click && !detalhes_chip)
	{
		tam_atualx = random_range(tamx - 0.5,tamx + 0.5)
		tam_atualy = random_range(tamy - 0.5,tamy + 0.5)
		
		tocar_som(choose(snd_select,snd_select_2))
		
		//abrir melhorias
		if (botao = 1)
		{
			global.item_novo = 0
			global.interface = 1
		}
		
		// comprar mais tropas e arrumar nave
		if (botao = 2)
		{
			global.interface = 3
			
		}
		
		//comprar mais tropas
		if (botao = 34)
		{
			if (global.qtd_radianita >= 25)
			{
				global.qtd_radianita -= 25
				global.soldados_qtd_total += 1
			}

		}
		//arumar nave
		if (botao = 35)
		{
			if (global.qtd_radianita >= 150 && global.vida_nave <= 90)
			{
				global.qtd_radianita -= 150
				global.vida_nave += 10
			}
		}
		//ir explorar
		if (botao = 36)
		{
			obj_nave.ir = true
			global.destino = 0
		}
		
		//ir para o planeta
		if (botao = 39 && global.soldados_qtd > 0)
		{
			if (!obj_nave.ir) obj_nave.ir = true
			
			//em qual area o jogador vai
			if (global.destino = 1)
			{
				if (global.planet1_A1 = 0) global.area_destino = 1
				else if (global.planet1_A2 = 0) global.area_destino = 2
				else if (global.planet1_A3 = 0) global.area_destino = 3
				else if (global.planet1_A4 = 0) global.area_destino = 4
				
				if (global.paz_planeta1 > 0) global.area_destino = 5
			}
			if (global.destino = 2)
			{
				if (global.planet2_A1 = 0) global.area_destino = 1
				else if (global.planet2_A2 = 0) global.area_destino = 2
				else if (global.planet2_A3 = 0) global.area_destino = 3
				else if (global.planet2_A4 = 0) global.area_destino = 4
				
				if (global.paz_planeta2 > 0) global.area_destino = 5
			}
			if (global.destino = 3)
			{
				if (global.planet3_A1 = 0) global.area_destino = 1
				else if (global.planet3_A2 = 0) global.area_destino = 2
				else if (global.planet3_A3 = 0) global.area_destino = 3
				else if (global.planet3_A4 = 0) global.area_destino = 4
				
				if (global.paz_planeta3 > 0) global.area_destino = 5
			}
			if (global.destino = 4)
			{
				if (global.planet4_A1 = 0) global.area_destino = 1
				else if (global.planet4_A2 = 0) global.area_destino = 2
				else if (global.planet4_A3 = 0) global.area_destino = 3
				else if (global.planet4_A4 = 0) global.area_destino = 4
				
				if (global.paz_planeta4 > 0) global.area_destino = 5
			}
			if (global.destino = 5)
			{
				if (global.planet5_A1 = 0) global.area_destino = 1
				else if (global.planet5_A2 = 0) global.area_destino = 2
				else if (global.planet5_A3 = 0) global.area_destino = 3
				else if (global.planet5_A4 = 0) global.area_destino = 4
				
				if (global.paz_planeta5 > 0) global.area_destino = 5
			}
		}
		
		//abrir armas
		if (botao = 3)
		{
			global.interface = 2
			global.item_novo = 0
		}
		
		//fechar pagina
		if (botao = 19 || botao = 23 || botao = 33)
		{
			global.interface = 0
		}
		
		//escolher a arma do player ou aliado
		if (botao = 21) 
		{
			global.arma_selecionada = false
		}
		//alidados
		if (botao = 22) 
		{
			if (global.arma_selecionada = false) global.arma_selecionada = true
			else global.arma_aliados = 9
		}
		
		//escolher arma
		if (botao >= 24 && botao <= 31)
		{
			//arma desbloqueada
			if (arma_desbloqueada)
			{
				if (!global.arma_selecionada) global.arma_player = frame + 1
				else global.arma_aliados = frame + 1
			}
		}
		
		//colocar chip
		if (botao >= 6 && botao <= 15 && chip_desbloqueado)
		{
			//tem algum espaço pra colocar?
			if (global.chip_1 = 0 || global.chip_2 = 0 || global.chip_3 = 0)
			{
				//colocar chip
				if (!usando_chip)
				{

					if (global.chip_1 = 0)
					{
						xx_pos = chip1x
						global.chip_1 = chip_num
						usando_chip = true
					}
						
					else if (global.chip_2 = 0)
					{
						xx_pos = chip2x
						global.chip_2 = chip_num
						usando_chip = true
					}
						
					else if (global.chip_3 = 0)
					{
						xx_pos = chip3x
						global.chip_3 = chip_num
						usando_chip = true
					}	
					
					yy_pos = chipy
					tamx = 2
					tamy = 2
				}
				//tirando chip
				else
				{
					//estou aonde?
					if (xx_pos = chip3x)
					{
						global.chip_3 = 0
					}
					if (xx_pos = chip2x)
					{
						global.chip_2 = 0
					}
					if (xx_pos = chip1x) 
					{
						global.chip_1 = 0
					}
					
					tamx = 1.5
					tamy = 1.5
					usando_chip = false
					xx_pos = xx_pos_ini
					yy_pos = yy_pos_ini
				}
			}
			else
			{
				//tirando chip
				if (usando_chip)
				{
					//estou aonde?
					if (xx_pos = chip3x)
					{
						global.chip_3 = 0
						
					}
					if (xx_pos = chip2x)
					{
						global.chip_2 = 0
					}
					if (xx_pos = chip1x) 
					{
						global.chip_1 = 0
					}
					
					usando_chip = false
					xx_pos = xx_pos_ini
					yy_pos = yy_pos_ini
					tamx = 1.5
					tamy = 1.5
				}
			}
		}
	}
	
	if (_mouse_click2 && !detalhes_chip)
	{
		if (botao >= 6 && botao <= 15 && chip_desbloqueado)
		{
			detalhes_chip = true
			tamy_com = 25
			tamx_com = 25
			delay_virar = 20
		}
	}
}
else
{
	tam_atualx = lerp(tam_atualx,tamx,0.1)
	tam_atualy = lerp(tam_atualy,tamy,0.2)
	
	//mudar tamanho da arma
	if (botao > 23 && botao < 32)
	{
		tamx_com = lerp(tamx_com,tamx_com_ini,0.1)
		tamy_com = lerp(tamy_com,tamy_com_ini,0.3)
	}
}

if (botao = 2)
{
	y_compra = lerp(y_compra,y,0.1)
	tamx_com = lerp(tamx_com,0,0.2)
	tamy_com = lerp(tamy_com,0,0.3)
}

if (detalhes_chip)
{
	if (delay_virar > 0)
	{
		delay_virar --
		tamx_com = lerp(tamx_com,25,0.1)
	}
	else if (delay_virar <= 0)
	{
		tamx_com = lerp(tamx_com,-25,0.1)
		if (mouse_check_button_pressed(mb_any) || keyboard_check_pressed(vk_anykey)) 
		{
			detalhes_chip = false
		}

	}
}

