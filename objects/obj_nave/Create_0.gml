image_xscale = 0.5
image_yscale = 0.5

image_angle = 90

tela_escura = 0

acres2 = 0

if (global.player_item_escolha)
{
	room_goto(rm_escolha)
	global.player_item_escolha = false
}

acres = 0

global.interface = 0

ir = false
vel = 10

meu_destino_atual = -1


if (global.destino = 1)
{
	x = 64
	y = 160
	image_xscale = 0.3
	image_yscale = 0.3
	meu_destino_atual = 1
}

if (global.destino = 2)
{
	x = 352
	y = 128
	image_xscale = 0.3
	image_yscale = 0.3
	meu_destino_atual = 2
}

if (global.destino = 3)
{
	x = 224
	y = 224
	image_xscale = 0.3
	image_yscale = 0.3
	meu_destino_atual = 3
}

if (global.destino = 4)
{
	x = 480
	y = 224
	image_xscale = 0.3
	image_yscale = 0.3
	meu_destino_atual = 4
}

if (global.destino = 5)
{
	x = 576
	y = 128
	image_xscale = 0.3
	image_yscale = 0.3
	meu_destino_atual = 5
}
