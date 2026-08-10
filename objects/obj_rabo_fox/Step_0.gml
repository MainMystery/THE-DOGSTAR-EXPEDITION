if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (global.trop_position) exit


image_xscale = dono.imagex
image_yscale = dono.imagey

brilho = dono.brilho

inimigos = dono.inimigos

alvo = dono.alvo


if (!instance_exists(alvo)) exit

depth = dono.depth + 1

x = dono.x - 160 * image_xscale
y = dono.y - 20 * image_yscale

var inim = instance_place(x,y,inimigos)

var tiros = instance_place(x,y,obj_tiro)

var direcao_alvo = point_direction(alvo.x,alvo.y,x,y)

if (dir > 360 || dir < -360) dir = 0 

if (estado = "die")
{
	image_angle = lerp(image_angle,-72,0.1)
	image_index = 1
	image_speed = 0
}

if (estado = "") 
{
	causar_dano = false
	defi_atack1 = false
	defi_atack2 = false
	image_angle = lerp(image_angle,0,0.1)
	dir = 0
}

//mirar o rabo no alvo
if (estado = "atack1")
{
	if (defi_atack1 = false)
	{
		atack1_delay = random_range(0.8,2.3) * 60
		
		defi_atack1 = true
	}
	

	image_angle = lerp(image_angle,direcao_alvo,0.1)

	causar_dano = true
	
	if (atack1_delay > 0) atack1_delay --
	else if (atack1_delay <= 0) estado = ""
}

//girar rabo
if (estado = "atack2")
{
	if (defi_atack2 = false)
	{
		atack2_delay = irandom_range(2,4) * 60
		
		defi_atack2 = true
	}

	dir = lerp(dir,dir + 35,0.35)

	image_angle = dir

	causar_dano = true
	
	if (atack2_delay > 0) atack2_delay --
	else if (atack2_delay <= 0) estado = ""
}


if (causar_dano)
{
	//causar dano
	if (inim != noone)
	{
		if (inim.i_frame <= 0)
		{
			inim.vida -= irandom_range(dano - 5, dano * 2)
			inim.i_frame = 40 
			inim.brilho = 1
			if (inim.id = obj_player.id)
			{
				inim.alpha_damage += 10
				obj_camera.shake_force += 30
				obj_camera.shake_time += 20
			}
			
			with (inim)
			{
				boing(random_range(0.5,2),random_range(0.5,2))
			}
		}
	}
	
	if (tiros != noone)
	{
		instance_destroy(tiros)
	}
}