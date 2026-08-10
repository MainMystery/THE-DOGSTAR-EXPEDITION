if (room != rm_tutorial)
{
	if (global.pause)
	{
		image_speed = 0
		exit
	}
	else image_speed = 1

	if (qtd_inimigos > 0)
	{
		if (delay_surgir > 0 && obj_player.pode_se_mover) delay_surgir --
		else if (delay_surgir <= 0)
		{
			var xx = obj_player.x + irandom_range(-1300,1300)
			var yy = obj_player.y + choose(irandom_range(-2000,-1300),irandom_range(1300,2000))
		
			instance_create_depth(xx,yy,depth,obj_inimigos)
			qtd_inimigos --
			delay_surgir = random_range(0.1,1) * 60
		}
	}

	//acabar fase
	else if (qtd_inimigos <= 0)
	{
		//não é boss
		if (BOSS = false)
		{
			if (instance_exists(obj_inimigos))
			{
				if (instance_number(obj_inimigos) = 1)
				{
					if (obj_inimigos.vida <= 0 && obj_inimigos.imagex <= 0.3)
					{
						if (!acabar)
						{
							if (item_ganho != 0)
							{
								var new_item = instance_create_depth(obj_inimigos.x,obj_inimigos.y,obj_inimigos.depth,obj_item_novo)
								new_item.recompensa = item_ganho
							}
							else
							{
								instance_create_depth(x,y,depth,obj_transicao)
							}
							acabar = true
						}
					}
				}
			}
		}
		else
		{
			if (instance_exists(obj_boss))
			{
				if (!acabar)
				{
					if (obj_boss.vida <= 0 && obj_boss.imagex <= 0.3)
					{
						if (item_ganho != 0)
						{
							var new_item = instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth,obj_item_novo)
							new_item.recompensa = item_ganho
						}
						else
						{
							instance_create_depth(x,y,depth,obj_transicao)
						}
						acabar = true
					}
				}
			}
		}
	}


	//dominar aréa
	if (acabar)
	{
		if (!domini_a)
		{
			if (global.area_destino = 1)
			{
				global.karma += 10
			
				if (global.destino = 1)
				{
					global.planet1_A1 = true
					global.guerra_planeta1 += 25
				
				}
		
				if (global.destino = 2)
				{
					global.planet2_A1 = true
					global.guerra_planeta2 += 25
				}
		
				if (global.destino = 3)
				{
					global.planet3_A1 = true
					global.guerra_planeta3 += 25
				}
		
				if (global.destino = 4)
				{
					global.planet4_A1 = true
					global.guerra_planeta4 += 25
				}
		
				if (global.destino = 5)
				{
					global.planet5_A1 = true
					global.guerra_planeta5 += 25
				}
			}
			if (global.area_destino = 2)
			{
				global.karma += 10
			
				if (global.destino = 1)
				{
					global.planet1_A2 = true
					global.guerra_planeta1 += 25
				}
		
				if (global.destino = 2)
				{
					global.planet2_A2 = true
					global.guerra_planeta2 += 25
				}
		
				if (global.destino = 3)
				{
					global.planet3_A2 = true
					global.guerra_planeta3 += 25
				}
		
				if (global.destino = 4)
				{
					global.planet4_A2 = true
					global.guerra_planeta4 += 25
				}
		
				if (global.destino = 5)
				{
					global.planet5_A2 = true
					global.guerra_planeta5 += 25
				}
			}
			if (global.area_destino = 3)
			{
				global.karma += 10
			
				if (global.destino = 1)
				{
					global.planet1_A3 = true
					global.guerra_planeta1 += 25
				}
		
				if (global.destino = 2)
				{
					global.planet2_A3 = true
					global.guerra_planeta2 += 25
				}
		
				if (global.destino = 3)
				{
					global.planet3_A3 = true
					global.guerra_planeta3 += 25
				}
		
				if (global.destino = 4)
				{
					global.planet4_A3 = true
					global.guerra_planeta4 += 25
				}
		
				if (global.destino = 5)
				{
					global.planet5_A3 = true
					global.guerra_planeta5 += 25
				}
			}
			if (global.area_destino = 4)
			{
				global.karma += 10
			
				if (global.destino = 1)
				{
					global.planet1_A4 = true
					global.guerra_planeta1 += 25
				}
		
				if (global.destino = 2)
				{
					global.planet2_A4 = true
					global.guerra_planeta2 += 25
				}
		
				if (global.destino = 3)
				{
					global.planet3_A4 = true
					global.guerra_planeta3 += 25
				}
		
				if (global.destino = 4)
				{
					global.planet4_A4 = true
					global.guerra_planeta4 += 25
				}
		
				if (global.destino = 5)
				{
					global.planet5_A4 = true
					global.guerra_planeta5 += 25
				}
			}
		
			//fez paz com aquele planeta
			if (global.area_destino = 5)
			{
				if (global.destino = 1)
				{
					global.planet1_A1 = true
					global.planet1_A2 = true
					global.planet1_A3 = true
					global.planet1_A4 = true
					global.paz_planeta1 = 100
				}
		
				if (global.destino = 2)
				{
					global.planet2_A1 = true
					global.planet2_A2 = true
					global.planet2_A3 = true
					global.planet2_A4 = true
					global.paz_planeta2 = 100
				}
		
				if (global.destino = 3)
				{
					global.planet3_A1 = true
					global.planet3_A2 = true
					global.planet3_A3 = true
					global.planet3_A4 = true
					global.paz_planeta3 = 100
				}
		
				if (global.destino = 4)
				{
					global.planet4_A1 = true
					global.planet4_A2 = true
					global.planet4_A3 = true
					global.planet4_A4 = true
					global.paz_planeta4 = 100
				}
		
				if (global.destino = 5)
				{
					global.planet5_A1 = true
					global.planet5_A2 = true
					global.planet5_A3 = true
					global.planet5_A4 = true
					global.paz_planeta5 = 100
				}
			
				global.karma -= 20
				global.qtd_radianita += irandom_range(45,250)
				global.player_item_escolha = true
			}
		
		
			if (global.destino = 1) global.qtd_radianita += irandom_range(45,250)
			if (global.destino = 2) global.qtd_radianita += irandom_range(350,1250)
			if (global.destino = 3) global.qtd_radianita += irandom_range(200,450)
			if (global.destino = 4) global.qtd_radianita += irandom_range(125,500)
			if (global.destino = 5) global.qtd_radianita += irandom_range(450,800)
		
			domini_a = true
		}
	}

	//tem boss
	if (instance_exists(obj_boss)) 
	{
		if (!BOSS)
		{
			qtd_inimigos = 0
			BOSS = true
		}
	}


	//posicionar aliados
	if (qtd_aliados > 0 && global.trop_position = true)
	{
		tamx = lerp(tamx,1,0.1)
		tamy = lerp(tamy,1,0.2)

		posx = ceil(mouse_x div 32) * 32
		posy = ceil(mouse_y div 32) * 32

		obj_player.pode_se_mover = false

		dir = lerp(dir,0,0.3)

		//colocou tropa
		if (mouse_check_button_pressed(mb_left))
		{
			tamx = random_range(0.5,3)
			tamy = random_range(0.5,3)
			dir = irandom_range(-5,5)
		
			qtd_aliados --
			instance_create_depth(posx,posy,depth,obj_aliados)
		}
	}
	else if (qtd_aliados <= 0)
	{
		if (global.trop_position)
		{
			obj_player.pode_se_mover = true
			global.trop_position = false
		}
	}

	// Máximo de aliados em campo
	var faltando = 10 - instance_number(obj_aliados)


	// Cria apenas o necessário
	if (faltando > 0 && !global.trop_position)
	{
		if (qtd_aliados_total > 0)
		{
		    instance_create_depth(obj_player.x, obj_player.y, depth, obj_aliados)
		    faltando--
			qtd_aliados_total --
		}
	}

}
else 
{
	if (keyboard_check_pressed(vk_tab))
	{
		if (!instance_exists(obj_transicao))
		{
			instance_create_depth(x,y,depth,obj_transicao)
		}
	}
}