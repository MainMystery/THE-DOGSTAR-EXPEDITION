if (instance_exists(dono)) brilho = dono.brilho

image_xscale = tamx
image_yscale = tamy

if (morto)
{
	alert_alpha = lerp(alert_alpha,0,0.1)
	alerty = lerp(alerty,2,0.1)
	
	tamx = lerp(tamx,0,0.1)
	
	if (tamx <= 0) instance_destroy(self)
	
	exit
}

//sou o tentaculo de atack
if (!tentaculo_block)
{
	alert_alpha = lerp(alert_alpha,0,0.1)
	alerty = lerp(alerty,2,0.1)
	
	//tempo para atacar
	if (delay > 0 && !atack) delay -= 1 + obj_dogstar.dificuldade_meteoro
	if (delay <= 0)
	{
		if (!atack)
		{
			tolerance = 1 * 60
			delay = irandom_range(2,8) * 60
			atack = true
			alerty = 6
			alert_alpha = 5
		}
	}
	
	//seguir player
	if (!atack)
	{
		x = -10
		if (tamx <= 2) y = lerp(y,obj_dogstar.y,0.1)
		
		tamx = lerp(tamx,0,0.1)
	}
	//atacando
	else
	{
		if (tolerance > 0) tolerance --
		if (tolerance <= 0)
		{
			tamx = lerp(tamx,8,0.2)
		}
		
		if (tamx >= 7)
		{
			if (back > 0) back --
			if (back <= 0)
			{
				atack = false
				back = irandom_range(40,200)
			}
		}
	}
	
	tamy = tam
	
}
//defender
else
{
	alert_alpha = lerp(alert_alpha,0,0.1)
	alerty = lerp(alerty,2,0.1)
	
	image_angle = -90
	
	//tempo para atacar
	if (delay > 0 && !atack) delay -= 1 + obj_dogstar.dificuldade_meteoro
	if (delay <= 0)
	{
		if (!atack)
		{
			tolerance = 1 * 60
			delay = irandom_range(2,8) * 60
			atack = true
			alerty = 6
			alert_alpha = 5
		}
	}
	
	//seguir player
	if (!atack)
	{
		y = -32
		if (tamx <= 2) x = lerp(x,obj_dogstar.x,0.1)
		
		tamx = lerp(tamx,0,0.1)
	}
	//atacando
	else
	{
		if (tolerance > 0) tolerance --
		if (tolerance <= 0)
		{
			tamx = lerp(tamx,4,0.2)
		}
		
		if (tamx >= 3)
		{
			if (back > 0) back --
			if (back <= 0)
			{
				atack = false
				back = irandom_range(40,200)
			}
		}
	}
	
	tamy = tam
	
}

//dar dano
if (place_meeting(x,y,obj_dogstar) && global.vida_nave > 0 && obj_dogstar.i_frame <= 0 && !morto)
{
	obj_dogstar.tamx = random_range(0.3,2)
	obj_dogstar.tamy = random_range(0.3,2)
	obj_dogstar.dir = irandom_range(-50,50)
	obj_dogstar.i_frame = 20
	
	tocar_som(snd_hit2)
	obj_dogstar.tamx2 = random_range(13,17)
	obj_dogstar.tamy2 = random_range(13,17)
	obj_dogstar.rot_bar = irandom_range(-200,200)
	
	global.vida_nave -= irandom_range(5,10)
	obj_camera.shake_force = 2
	obj_camera.shake_time = 30
}

var tiro = instance_place(x,y,obj_tiro_nave)

if (tiro != noone)
{
	tamx += random_range(-1,1)
	tamy += random_range(-1,1)
	instance_destroy(tiro)
}
