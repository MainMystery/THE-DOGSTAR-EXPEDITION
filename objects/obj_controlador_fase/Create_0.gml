qtd_inimigos = global.quantidade_inimigos
delay_surgir = 2 * 60

qtd_aliados = global.soldados_qtd - 1
qtd_aliados_total = global.soldados_qtd - 11

item_ganho = 0

BOSS = false

acabar = false

if (qtd_aliados > 10) qtd_aliados = 10

tamx = 0
tamy = 0

posx = 0
posy = 0

if (qtd_aliados > 1) global.trop_position = true

dir = 0

domini_a = false

obj_player.inimigos = qtd_inimigos

//colocando boss
if (global.area_destino >= 4)
{
	if (global.destino = 1)
	{
		var pos = irandom_range(1,4)
		var xx = 0
		var yy = 0
		
		if (pos = 1)
		{
			xx = 1120
			yy = -512
		}
		if (pos = 2)
		{
			xx = 1120
			yy = 2016
		}
		if (pos = 3)
		{
			xx = -608
			yy = 672
		}
		if (pos = 4)
		{
			xx = 2624
			yy = 672
		}
		
		instance_create_layer(xx,yy,"player",obj_espinossauro_boss)
	}
	if (global.destino = 2) 
	{
		var xx = 1088
		var yy = 640
		
		instance_create_layer(xx,yy,"player",obj_cyber_cat)
	}
	if (global.destino = 3) 
	{
		var xx = 1120
		var yy = 608
		
		instance_create_layer(xx,yy,"player",obj_cosmic_fox)
	}
	if (global.destino = 4) 
	{
		
		instance_create_layer(928,576,"player",obj_caixa)
		instance_create_layer(1280,608,"player",obj_caixa)
		instance_create_layer(864,832,"player",obj_caixa)
		instance_create_layer(1312,832,"player",obj_caixa)
		
		var xx = 1088
		var yy = 736
		
		instance_create_layer(xx,yy,"player",obj_gato_schrodinger)
	}
	if (global.destino = 5) 
	{
		var xx = 96
		var yy = 96
		
		instance_create_layer(xx,yy,"player",obj_magma_crawler)
	}
}

//armas de cada planeta
if (global.destino = 1)
{
	global.arma_inimigo1 = 0
	global.arma_inimigo2 = 0
	global.arma_inimigo3 = 0
	global.arma_inimigo4 = 0
	global.arma_inimigo5 = 0
	global.arma_inimigo6 = 0
	global.arma_inimigo7 = 0
	global.arma_inimigo8 = 0
	global.arma_inimigo9 = 1
}
if (global.destino = 2)
{
	global.arma_inimigo1 = 1
	global.arma_inimigo2 = 1
	global.arma_inimigo3 = 1
	global.arma_inimigo4 = 1
	global.arma_inimigo5 = 0
	global.arma_inimigo6 = 0
	global.arma_inimigo7 = 0
	global.arma_inimigo8 = 1
	global.arma_inimigo9 = 0
}
if (global.destino = 3)
{
	global.arma_inimigo1 = 0
	global.arma_inimigo2 = 0
	global.arma_inimigo3 = 0
	global.arma_inimigo4 = 0
	global.arma_inimigo5 = 1
	global.arma_inimigo6 = 1
	global.arma_inimigo7 = 1
	global.arma_inimigo8 = 0
	global.arma_inimigo9 = 0
}
if (global.destino = 4)
{
	global.arma_inimigo1 = 1
	global.arma_inimigo2 = 1
	global.arma_inimigo3 = 1
	global.arma_inimigo4 = 1
	global.arma_inimigo5 = 0
	global.arma_inimigo6 = 0
	global.arma_inimigo7 = 0
	global.arma_inimigo8 = 0
	global.arma_inimigo9 = 0
}
if (global.destino = 5)
{
	global.arma_inimigo1 = 0
	global.arma_inimigo2 = 1
	global.arma_inimigo3 = 1
	global.arma_inimigo4 = 0
	global.arma_inimigo5 = 0
	global.arma_inimigo6 = 1
	global.arma_inimigo7 = 0
	global.arma_inimigo8 = 0
	global.arma_inimigo9 = 0
}

//recompensa
if (global.destino = 1)
{
	if (global.area_destino = 1) item_ganho = 3
	if (global.area_destino = 2) item_ganho = 12
	if (global.area_destino = 4) item_ganho = 5
}
if (global.destino = 2)
{
	if (global.area_destino = 1) item_ganho = 14
	if (global.area_destino = 2) item_ganho = 10
	if (global.area_destino = 3) item_ganho = 9
	if (global.area_destino = 4) item_ganho = 17
}
if (global.destino = 3)
{
	if (global.area_destino = 1) item_ganho = 13
	if (global.area_destino = 2) item_ganho = 2
	if (global.area_destino = 3) item_ganho = 8
	if (global.area_destino = 4) item_ganho = 7
}
if (global.destino = 4)
{
	if (global.area_destino = 1) item_ganho = 6
	if (global.area_destino = 2) item_ganho = 1
	if (global.area_destino = 3) item_ganho = 15
	if (global.area_destino = 4) item_ganho = 7
}
if (global.destino = 5)
{
	if (global.area_destino = 1) item_ganho = 11
	if (global.area_destino = 3) item_ganho = 16
	if (global.area_destino = 4) item_ganho = 4
}