if (chegou)
{
	if (!mostrar_texto)
	{
		//muito soldado
		if (global.soldados_qtd >= 35)
		{
			if (global.destino = 1) create_textbox("planet1 - sold")
			if (global.destino = 2) create_textbox("planet2 - sold")
			if (global.destino = 3) create_textbox("planet3 - sold")
			if (global.destino = 4) create_textbox("planet4 - sold")
			if (global.destino = 5) create_textbox("planet5 - sold")
		}
		else
		{
			if (global.destino = 1) create_textbox("planet1 - norm")
			if (global.destino = 2) create_textbox("planet2 - norm")
			if (global.destino = 3) create_textbox("planet3 - norm")
			if (global.destino = 4) create_textbox("planet4 - norm")
			if (global.destino = 5) create_textbox("planet5 - norm")
		}
		
		//definir preço
		if (global.destino = 1) preco = 200
		if (global.destino = 2) preco = 12000
		if (global.destino = 3) preco = 3250
		if (global.destino = 4) preco = 5000
		if (global.destino = 5) preco = 9000
		
		mostrar_texto = true
	}
}

//te mandaram embora por não ter dinheiro
if (negado)
{
	escuro = lerp(escuro,1,0.1)
	
	if (escuro >= 1)
	{
		room_goto(rm_principal)
	}
}

if (comprar)
{
	obj_compra_alicaca.surgir = true
	
	comprar = false
}

//enfrentar o boss daquele lugar
if (guerra)
{
	if (!guerra_true)
	{
		if (global.destino = 1) global.guerra_planeta1 += 10
		if (global.destino = 2) global.guerra_planeta2 += 10
		if (global.destino = 3) global.guerra_planeta3 += 10
		if (global.destino = 4) global.guerra_planeta4 += 10
		
		guerra_true = true
	}
	
	escuro = lerp(escuro,1,0.1)
	
	if (escuro >= 1)
	{
		room_goto(rm_planeta)
	}
}

//enfrentar o boss daquele lugar
if (boss)
{
	escuro = lerp(escuro,1,0.1)
	
	if (escuro >= 1)
	{
		global.area_destino = 5
		room_goto(rm_planeta)
	}
	
	if (!guerra_true)
	{
		if (global.destino = 1) global.paz_planeta1 += 10
		if (global.destino = 2) global.paz_planeta2 += 10
		if (global.destino = 3) global.paz_planeta3 += 10
		if (global.destino = 4) global.paz_planeta4 += 10
		
		guerra_true = true
	}
}