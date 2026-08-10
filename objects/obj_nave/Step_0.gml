if (ir)
{
	global.interface = 4
	y -= vel
	
	image_xscale = lerp(image_xscale,1,0.1)
	image_yscale = lerp(image_yscale,1,0.1)
	
	// dessafio até o planeta
	if (y <= -200)
	{
		tela_escura = lerp(tela_escura,1,0.25)
		if (tela_escura >= 1)
		{
			if (global.destino != meu_destino_atual) room_goto(rm_space)
			else
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
		}
	}
}


if (global.soldados_qtd_total <= 0 && global.qtd_radianita < 25)
{
	room_goto(rm_game_over)
}
