if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

//o alvo é o mais proximo
//o alvo é o mais proximo
var alvo_ini = instance_nearest(x, y, obj_inimigos)
var alvo_boss = instance_nearest(x, y, obj_boss)
var dist_ini = 999999
var dist_boss = 999999

if (instance_exists(alvo_ini))  dist_ini = point_distance(x, y, alvo_ini.x, alvo_ini.y)
if (instance_exists(alvo_boss)) dist_boss = point_distance(x, y, alvo_boss.x, alvo_boss.y)

if (dist_ini < dist_boss) alvo = alvo_ini    
else  
{
	alvo = alvo_boss
	
	if (instance_exists(obj_gato_schrodinger))
	{
		if (alvo = obj_gato_schrodinger.id)
		{
			if (alvo.proxima_caixa) alvo = noone
		}
	}
}

//limitar vida
if (vida < 0) vida = 0
if (vida > vida_max) vida = vida_max

walk_anim()

brilho = lerp(brilho,0,0.15)

with (obj_aliados)
{
	var dirrl = point_direction(x,y,other.x,other.y)
	
	if (place_meeting(x,y,other))
	{
		x -= lengthdir_x(5,dirrl)
		y -= lengthdir_y(5,dirrl)
	}
}

//alvo não existe
//só faz isso em boss fight

if (!instance_exists(alvo) || alvo = noone)
{
	alvo = noone
	velh = 0
	velv = 0
	dir = lerp(dir,0,0.1)
	
	imagex = lerp(imagex,1,0.1)
	imagey = lerp(imagey,1,0.2)
	
	if (instance_exists(arma)) arma.atira = false
	
	exit
}
else if (instance_exists(alvo))
{
	if (!alvo.vida > 0)
	{
		alvo = noone
		velh = 0
		velv = 0
		dir = lerp(dir,0,0.1)
	
		imagex = lerp(imagex,1,0.1)
		imagey = lerp(imagey,1,0.2)
	
		if (instance_exists(arma)) arma.atira = false
	
		exit
	}
}


//sou um clone
if (clone)
{
	image_blend = c_dkgray
	if (delay_clone > 0) delay_clone--
	else if (delay_clone <= 0)
	{
		vida -= 5
		delay_clone = 10
	}
}

depth = (-bbox_bottom)
if (depth > 320) depth = 320


//alvo não existe
if (!instance_exists(alvo))
{
	alvo = noone
	
	velh = 0
	velv = 0
	
	dir = lerp(dir,0,0.1)
}


if (!global.trop_position)
{
	movimento()
	atirar()
}

damage()


if (vivo) event_inherited()


move_and_collide(velh,0,colision,12)
move_and_collide(0,velv,colision,12)
