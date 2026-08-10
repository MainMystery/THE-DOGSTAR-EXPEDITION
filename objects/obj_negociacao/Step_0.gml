walk_anim()
var dir = point_direction(x,y,obj_status_alianca.x,obj_status_alianca.y)
var dist = point_distance(x,y,obj_status_alianca.x,obj_status_alianca.y)

depth = -bbox_bottom

// -------------------- SPRITE CACHORRO -------------------- \\
if (volei = 1)
{
	sprite_pe = spr_dog_foot
	image_blend = c_white
	
	if (!qtd_defi)
	{
		qtd_time = global.soldados_qtd
		qtd_defi = true
	}
	
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
	
	if (qtd_time > 10) qtd_time = 10
}

//sumonar amigos
if (qtd_time > 0 && principal)
{
	var xx = 0
	var yy = 0
	
	if (volei = 1)
	{
		yy = irandom_range(-160,-64)
	
		xx = irandom_range(-96,832)
	}
	if (volei = 2)
	{
		yy = irandom_range(256,512)
	
		if (yy > 480) xx = irandom_range(-96,832)
		else xx = choose(-96,832)
	}
	
	var aliado = instance_create_depth(xx,yy,depth,obj_negociacao)
	aliado.volei = volei
	
	qtd_time -= 1
	
}

//ir ver o centro
if (!principal)
{
	if (time > 0)
	{
		time--
		velh = lengthdir_x(3,dir)
		velv = lengthdir_y(3,dir)
	}
	else if (time <= 0)
	{
		velh = 0
		velv = 0
	}
}
else
{
	if (dist > 80)
	{
		velh = lengthdir_x(3,dir)
		velv = lengthdir_y(3,dir)
	}
	else
	{
		velh = 0
		velv = 0
		
		if (cheguei = false)
		{
			cheguei = true
			obj_status_alianca.chegou += 1
		}
	}
}



if (x > room_width div 2) tamanhox_dir = -1
else tamanhox_dir = 1

move_and_collide(velh,velv,obj_player)