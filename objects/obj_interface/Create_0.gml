funciona_em_qual_parte = 0

xx_pos_ini = x
yy_pos_ini = y

xx_pos = x
yy_pos = y

carregar_chips = false

usando_chip = false

sprite_arma2 = spr_arma_block

chip_num = 0

//posição chips
chip1x = 48
chipy = 112
chip2x = 96
chip3x = 144

y_final = 550

chip_desbloqueado = false

passar_mouse_muda = false

detalhes_chip = false
texto = ""

off_set_armax = 0
off_set_army = 0

rot = 0

tamx_com = 0
tamy_com = 0

frame = 0

//qual botão é
if (botao = 0) 
{
	sprite_index = spr_interface1
	funciona_em_qual_parte = 0
}
if (botao = 1)
{
	sprite_index = spr_interface1_1
	funciona_em_qual_parte = 0
	passar_mouse_muda = true
}
if (botao = 2)
{
	sprite_index = spr_interface1_2
	funciona_em_qual_parte = 0
	passar_mouse_muda = true
}
if (botao = 3) 
{
	sprite_index = spr_interface1_3
	funciona_em_qual_parte = 0
	passar_mouse_muda = true
}
if (botao = 4) 
{
	sprite_index = spr_interface2
	funciona_em_qual_parte = 1
	passar_mouse_muda = false
}

//chips
#region

if (botao = 6) 
{
	sprite_index = spr_chips
	image_index = 0
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 1
	texto = "Seus tiros e de seus aliados te dam vida"
}
if (botao = 7) 
{
	sprite_index = spr_chips
	image_index = 1
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 2
	texto = "Seu valor total de vida é multiplicado por 3"
}
if (botao = 8) 
{
	sprite_index = spr_chips
	image_index = 2
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	texto = "Ganha 50 de vida a mais"
	chip_num = 3
}
if (botao = 9) 
{
	sprite_index = spr_chips
	image_index = 5
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 4
	texto = "Vida extra ao morrer você volta"
}
if (botao = 10) 
{
	sprite_index = spr_chips
	image_index = 7
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 5
	texto = "Ao ser derrotado você faz uma grande explosão"
}
if (botao = 11) 
{
	sprite_index = spr_chips
	image_index = 6
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 6
	texto = "Ao tomar dano tem uma pequena chance do tiro se revoltar mais forte contra quema atirou"
}
if (botao = 12) 
{
	texto = "Seus tiros causam mais dano"
	sprite_index = spr_chips
	image_index = 4
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 7
}
if (botao = 13) 
{
	texto = "Sua chances de acertar crítico são multiplicadas"
	sprite_index = spr_chips
	image_index = 3
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 8
}
if (botao = 14) 
{
	texto = "Ao sofrer dano tem chance de sumonar 2 clones que te ajudam por um tempo"
	sprite_index = spr_chips
	image_index = 8
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 9
}
if (botao = 15) 
{
	sprite_index = spr_chips
	image_index = 9
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
	chip_num = 10
	texto = "Seus tiros tem mais vida e ricocheteiam pelo mapa"
}

#endregion


if (botao = 16) 
{
	sprite_index = spr_interface3
	image_index = irandom_range(0,3)
	funciona_em_qual_parte = 1
	passar_mouse_muda = false
}
if (botao = 17) 
{
	sprite_index = spr_interface3
	funciona_em_qual_parte = 1
	passar_mouse_muda = false
	image_index = irandom_range(0,3)
}
if (botao = 18) 
{
	sprite_index = spr_interface3
	funciona_em_qual_parte = 1
	passar_mouse_muda = false
	image_index = irandom_range(0,3)
}
if (botao = 19) 
{
	sprite_index = spr_close
	funciona_em_qual_parte = 1
	passar_mouse_muda = true
}
if (botao = 20) 
{
	sprite_index = spr_interface2
	funciona_em_qual_parte = 2
	passar_mouse_muda = false
}
if (botao = 21) 
{
	sprite_index = spr_interface4
	funciona_em_qual_parte = 2
	passar_mouse_muda = true
}
if (botao = 22) 
{
	sprite_index = spr_interface4
	funciona_em_qual_parte = 2
	passar_mouse_muda = true
}
if (botao = 23)
{
	sprite_index = spr_close
	funciona_em_qual_parte = 2
	passar_mouse_muda = true
}
#region //armas

if (botao >= 24 && botao <= 31)
{
	sprite_index = spr_white
	funciona_em_qual_parte = 2
	passar_mouse_muda = true
	off_set_armax = 0
	off_set_army = 0
	image_blend = make_color_rgb(25,25,48)
	sprite_arma2 = spr_arma_block
	
	off_set_armax = 25
	off_set_army  =  15
	
	if (botao = 24) 
	{
		frame = 0
		tamx_com = 1
		tamy_com = 1
	}
	if (botao = 25)
	{
		frame = 1
		tamx_com = 1.5
		tamy_com = 1.5
	}
	if (botao = 26) 
	{
		frame = 6
		tamx_com = 1.5
		tamy_com = 1.5
	}
	if (botao = 27) 
	{
		frame = 3
		tamx_com = 2
		tamy_com = 2
		rot = 90
		off_set_armax = 25
		off_set_army  = 65
	}
	if (botao = 28)
	{
		frame = 4
		tamx_com = 1.5
		tamy_com = 1.5
		off_set_armax = 40
		off_set_army  =  15
	}
	if (botao = 29)
	{
		frame = 7
		tamx_com = 1.5
		tamy_com = 1.5
		off_set_armax = 13
		off_set_army  =  11
	}
	if (botao = 30)
	{
		frame = 5
		tamx_com = 1.5
		tamy_com = 1.5
		off_set_armax = 25
		off_set_army  =  10
	}
	if (botao = 31)
	{
		frame = 2
		tamx_com = 1.5
		tamy_com = 1.5
		off_set_armax = 40
		off_set_army  =  20
	}
}

#endregion
if (botao = 32)
{
	sprite_index = spr_interface2
	funciona_em_qual_parte = 3
	passar_mouse_muda = false
}
if (botao = 33)
{
	sprite_index = spr_close
	funciona_em_qual_parte = 3
	passar_mouse_muda = true
}
if (botao = 34)
{
	sprite_index = spr_interface5
	funciona_em_qual_parte = 3
	passar_mouse_muda = true
	image_index = 0
}
if (botao = 35)
{
	sprite_index = spr_interface5
	funciona_em_qual_parte = 3
	passar_mouse_muda = true
	image_index = 1
}
if (botao = 36)
{
	sprite_index = spr_interface5
	funciona_em_qual_parte = 3
	passar_mouse_muda = true
	image_index = 2
}
if (botao = 37)
{
	sprite_index = spr_white
	funciona_em_qual_parte = 5
	passar_mouse_muda = false
	image_blend = make_color_rgb(81,231,255)
	image_alpha = 0.6
}
if (botao = 38)
{
	sprite_index = spr_white
	funciona_em_qual_parte = 5
	passar_mouse_muda = false
	image_blend = make_color_rgb(81,231,255)
	image_alpha = 0.6
}
if (botao = 39)
{
	sprite_index = spr_button_go
	funciona_em_qual_parte = 5
	passar_mouse_muda = true
}

tolerant = 20

esc_sair = false

global.arma_selecionada = false

arma_desbloqueada = false

tamx_com_ini = tamx_com
tamy_com_ini = tamy_com

tamx_com_mais = tamx_com + 0.2
tamy_com_mais = tamy_com + 0.2

delay_virar = 20
y_compra = y


sprite_arma = spr_arma_1
tamanho_arma = 1
off_set = 0

if (global.interface != funciona_em_qual_parte && botao != 0)
{
	y = y_final
}

tamx = image_xscale
tamy = image_yscale

tam_atualx = tamx
tam_atualy = tamy
