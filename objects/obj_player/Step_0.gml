if (keyboard_check_pressed(vk_escape)) global.pause = !global.pause

if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

depth = (-bbox_bottom)
if (depth > 320) depth = 320

if (vida_delay > 0) vida_delay--
if (vida_anterior != vida && vida_delay <= 0)
{
	tocar_som(choose(snd_dano,snd_hit2,snd_hit_3))
	vida_anterior = vida
	vida_delay = 5
}

//limitar vida
if (vida < 0) vida = 0
if (vida > vida_max) vida = vida_max



morto()

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

//MORRI
if (!vivo)
{
	exit
}


if (pode_se_mover)
{
	movimet()
	rolar()
}
else
{
	velh = 0
	velv = 0
}

walk_anim()



//tamanho é brilho
imagex = lerp(imagex,1,0.1)
imagey = lerp(imagey,1,0.2)
brilho = lerp(brilho,0,0.1)

//descer os i-frames
if (i_frame > 0) 
{
	i_frame --
	
	if (delay_i_frame > 0) delay_i_frame--
	else if (delay_i_frame <= 0)
	{
		brilho = 1
		delay_i_frame = 10
	}
}

move_and_collide(velh,0,colision,12)
move_and_collide(0,velv,colision,12)


#region // DANO

var tiro_inigo = instance_place(x,y,obj_tiro)

//dano por tiros
if (tiro_inigo != noone && i_frame <= 0)
{
	//time inimigo
	if (tiro_inigo.time != 1) 
	{
		brilho = 1
		alpha_damage += tiro_inigo.dano
		obj_camera.shake_force += 1
		obj_camera.shake_time += 5
		vida -= tiro_inigo.dano
		
		
		i_frame = 10
		
		boing(random_range(0.5,3),random_range(0.5,3))
		
		//chances criar tiros
		if (global.chip_1 = 6 || global.chip_2 = 6 || global.chip_3 = 6)
		{
			var chance_tiro = irandom(100)
			
			//criando
			if (chance_tiro <= 20)
			{
				create_bullet(x,y,tiro_inigo.dir + 150,time,c_red,2,c_red,1,2,8,10,0.01)
				create_bullet(x,y,tiro_inigo.dir + 180,time,c_red,2,c_red,1,2,8,10,0.01)
				create_bullet(x,y,tiro_inigo.dir + 210,time,c_red,2,c_red,1,2,8,10,0.01)
			}
		}
		
		//chances criar clones
		if (global.chip_1 = 9 || global.chip_2 = 9 || global.chip_3 = 9)
		{
			var chance_clone = irandom(100)
			
			//criando
			if (chance_clone <= 15)
			{
				for (var i = 0; i < 2; i ++)
				{
					var clon = instance_create_depth(x,y,depth,obj_aliados)
					clon.clone = true
				}
			}
		}
	}
	//time aliado
	else
	{
		//estou com chip de vida
		if (global.chip_1 = 1 || global.chip_2 = 1 || global.chip_3 = 1)
		{
			instance_destroy(tiro_inigo)
			i_frame += 10
			brilho = 1
			vida += 10
			boing(random_range(0.5,3),random_range(0.5,3))
		}
	}
}






alpha_damage = lerp(alpha_damage,0,0.1)

#endregion