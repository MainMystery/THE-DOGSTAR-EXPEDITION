if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (recompensa != 0)
{
	//pulando
	if (delay_pulo > 0)
	{
		delay_pulo -= 1
		y -= pulo
		if (pulo_dir = true) x += 2
		else x -= 2
	}
	else if (delay_pulo <= 0)
	{
		if (delay_queda > 0)
		{
			grav += 0.1
			
			y += grav 
			if (pulo_dir = true) x += 1
			else x -= 1
			delay_queda --
			
			image_yscale += 0.1
		}
		else if (delay_queda <= 0)
		{
			if (!caiu)
			{
				image_xscale = 2
				caiu = true
			}
		}
	}
}

//que recopensa é
#region
if (recompensa = 1) // chip dano = vida
{
	sprite_index = spr_chips
	image_index = 0
}
if (recompensa = 2) // chip vidax3
{
	sprite_index = spr_chips
	image_index = 1
}
if (recompensa = 3) // chip vida + 50
{
	sprite_index = spr_chips
	image_index = 2
}
if (recompensa = 4) // chip x2 critic
{
	sprite_index = spr_chips
	image_index = 3
}
if (recompensa = 5) // chip mais dano
{
	sprite_index = spr_chips
	image_index = 4
}
if (recompensa = 6) // chip vida ++
{
	sprite_index = spr_chips
	image_index = 5
}
if (recompensa = 7) // chip tiro repel
{
	sprite_index = spr_chips
	image_index = 6
}
if (recompensa = 8) // chip explosion
{
	sprite_index = spr_chips
	image_index = 7
}
if (recompensa = 9) // chip clone
{
	sprite_index = spr_chips
	image_index = 8
}
if (recompensa = 10) // chip rechotear
{
	sprite_index = spr_chips
	image_index = 9
}

if (recompensa = 11) // arma laser 2
{
	sprite_index = spr_arma_2
}
if (recompensa = 12) // arma laser 3
{
	sprite_index = spr_arma_3
}
if (recompensa = 13) // arma laser 4
{
	sprite_index = spr_arma_4
}
if (recompensa = 14) // arma laser 5
{
	sprite_index = spr_arma_5
}
if (recompensa = 15) // arma laser 6
{
	sprite_index = spr_arma_6
}
if (recompensa = 16) // arma laser 7
{
	sprite_index = spr_arma_7
}
if (recompensa = 17) // arma laser 8
{
	sprite_index = spr_arma_8
}
#endregion

obj_mira.alvo = id

if (!pegou)
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.2)
}
else
{
	image_xscale = lerp(image_xscale,0,0.1)
	image_yscale = lerp(image_yscale,0,0.2)
}


pulo = lerp(pulo,0,0.1)
image_alpha = lerp(image_alpha,1,0.3)
tamx = lerp(tamx,5,0.1)
tamy = lerp(tamy,5,0.2)
dir  = lerp(dir,0,0.3)

tamx2 = lerp(tamx2,15,0.1)
tamy2 = lerp(tamy2,15,0.2)
dir2 = lerp(dir2,0,0.3)

if (caiu)
{
	brilho = lerp(brilho,0,0.05)
	
	if (pegou = false) click = lerp(click,1,0.1)
}

if (pegou) 
{
	click = 0
	
	if (!fechar) 
	{
		alpha = lerp(alpha,1,0.05)
		obj_player.pode_se_mover = false
	}
	else
	{
		alpha = lerp(alpha,0,0.1)
	}
	
	if (delay > 0) delay --
	else if (delay <= 0 && !fechar)
	{
		if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any))
		{
			fechar = true
			instance_create_depth(x,y,depth,obj_transicao)
		}
	}
	
	if (recompensa < 11) global.item_novo = 1
	else if (recompensa >= 11) global.item_novo = 2
	
	//o que você ganha
	#region
	if (recompensa = 1) // chip dano = vida
	{
		global.chip_dano_vida = true
	}
	if (recompensa = 2) // chip vidax3
	{
		global.chip_vidax3 = true
	}
	if (recompensa = 3) // chip vida + 50
	{
		global.chip_vida_50 = true
	}
	if (recompensa = 4) // chip x2 critic
	{
		global.chip_critic = true
	}
	if (recompensa = 5) // chip mais dano
	{
		global.chip_dano_mais = true
	}
	if (recompensa = 6) // chip vida ++
	{
		global.vida_extra = true
	}
	if (recompensa = 7) // chip tiro repel
	{
		global.tiro_ao_dano = true
	}
	if (recompensa = 8) // chip explosion
	{
		global.explodir = true
	}
	if (recompensa = 9) // chip clone
	{
		global.clones = true
	}
	if (recompensa = 10) // chip rechotear
	{
		global.requichiote = true
	}

	if (recompensa = 11) // arma laser 2
	{
		global.arma_2 = true
	}
	if (recompensa = 12) // arma laser 3
	{
		global.arma_3 = true
	}
	if (recompensa = 13) // arma laser 4
	{
		global.arma_4 = true
	}
	if (recompensa = 14) // arma laser 5
	{
		global.arma_5 = true
	}
	if (recompensa = 15) // arma laser 6
	{
		global.arma_6 = true
	}
	if (recompensa = 16) // arma laser 7
	{
		global.arma_7 = true
	}
	if (recompensa = 17) // arma laser 8
	{
		global.arma_8 = true
	}
	#endregion
}

with (obj_arma)
{
	pode_usar = false
}

//player pegou
var pegar = place_meeting(x,y,obj_player)
var mouse_sobre = position_meeting(mouse_x,mouse_y,id)  
var mouse_click = mouse_check_button_pressed(mb_left)

if (mouse_sobre && mouse_click) 
{
	pegar = true
}

if (pegar && brilho <= 0.3)
{
	if (!pegou)
	{
		tamx = 0
		tamy = 0
		dir = random_range(-80,80)
		image_xscale = 5
		image_yscale = 5
		pegou = true
		tamx2 = 0
		tamy2 = 0
		dir2 = random_range(-180,180)
		
	}
}

