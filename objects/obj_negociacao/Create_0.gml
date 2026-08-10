event_inherited()

velh = 0
velv = 0

imagex = 1
imagey = 1

time = irandom_range(30,80)

yy = y

cheguei = false

qtd_time = irandom_range(3,10)
qtd_defi = false

if (volei = 1)
{
	skin = irandom_range(1,11)
	sprite_pe = spr_dog_foot
	// -------------------- SPRITE CACHORRO -------------------- \\
	#region
	
	if (skin = 1)
	{
		sprite_corpo = spr_dog_1
		image_frame_pe = 0
	}
	if (skin = 2)
	{
		sprite_corpo = spr_dog_2
		image_frame_pe = 0
	}
	if (skin = 3)
	{
		sprite_corpo = spr_dog_3
		image_frame_pe = 3
	}
	if (skin = 4)
	{
		sprite_corpo = spr_dog_4
		image_frame_pe = 0
	}
	if (skin = 5)
	{
		sprite_corpo = spr_dog_5
		image_frame_pe = 0
	}
	if (skin = 6)
	{
		sprite_corpo = spr_dog_6
		image_frame_pe = 4
	}
	if (skin = 7)
	{
		sprite_corpo = spr_dog_7
		image_frame_pe = 0
	}
	if (skin = 8)
	{
		sprite_corpo = spr_dog_8
		image_frame_pe = 5
	}
	if (skin = 9)
	{
		sprite_corpo = spr_dog_9
		image_frame_pe = 6
	}
	if (skin = 10)
	{
		sprite_corpo = spr_dog_10
		image_frame_pe = 1
	}
	if (skin = 11)
	{
		sprite_corpo = spr_dog_11
		image_frame_pe = 2
	}

	#endregion
}
if (volei = 2)
{
	//planetas
	#region

	if (global.destino = 1)
	{
		sprite_corpo = spr_alien_1
		sprite_pe = spr_dog_foot
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255))
	}
	if (global.destino = 2)
	{
		sprite_corpo = spr_bot
		sprite_pe = spr_bot_pe
		image_blend = c_white
	}
	if (global.destino = 3)
	{
		sprite_corpo = spr_alien_2
		sprite_pe = spr_dog_foot
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255))
	}
	if (global.destino = 4)
	{
		sprite_corpo = spr_cavaleiro
		sprite_pe = spr_cavaleiro_pe
		image_blend = c_white
	}
	if (global.destino = 5)
	{
		sprite_corpo = spr_golem
		sprite_pe = spr_golem_pe
		image_blend = c_white
	}

	#endregion
}