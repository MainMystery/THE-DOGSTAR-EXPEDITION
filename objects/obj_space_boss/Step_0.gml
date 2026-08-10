//morrer
if (vida <= 0)
{
	obj_dogstar.evento = ""
	
	alpha_bar = lerp(alpha_bar,0,0.1)
	
	olhar = lerp(olhar,20,0.1)
	
	if (delay_effect_die > 0) delay_effect_die --
	else if (delay_effect_die <= 0)
	{
		brilho = choose(0,1)
		tamx = random_range(-7,7)
		tamy = random_range(-7,7)
		
		delay_effect_die = 10
	}
	
	if (!morrendo)
	{
		tentaculo_1.morto = true
		tentaculo_2.morto = true
	}
	
	image_angle += 0.1
	y += 0.05
	x -= 0.07
	
	if (delay_acabar > 0) delay_acabar--
	else if (delay_acabar <= 0)
	{
		instance_destroy(self)
	}
	
	morrendo = true
	
	exit
}

x = lerp(x,32,0.1)

alpha_bar = lerp(alpha_bar,1,0.1)

olhar = point_direction(x,y,obj_dogstar.x,obj_dogstar.y)

var dif = angle_difference(olhar, 0)

dif = clamp(dif, -20, 20)

olhar = dif

var tiro = instance_place(x,y,obj_tiro_nave)

tamx = lerp(tamx,tam,0.1)
tamy = lerp(tamy,tam,0.1)

//sumir brilho
brilho = lerp(brilho,0,0.1)

if (i_frame > 0) i_frame --

//tomar dano
if (tiro != noone && i_frame <= 0)
{
	//critico
	var crit = irandom(100)
	
	if (crit > 2)
	{
		var dano_tomado = irandom_range(3,10)
		
		i_frame = 5
		instance_destroy(tiro)
		brilho = 1
		vida -= dano_tomado
		tamx = random_range(5,7)
		tamy = random_range(5,7)
		
		indicar_dano(dano_tomado, 1, c_white)
	}
	else if (crit <= 2)
	{
		var dano_tomado = irandom_range(20,50)
		
		i_frame = 5
		instance_destroy(tiro)
		brilho = 1
		vida -= dano_tomado
		tamx = random_range(5,9)
		tamy = random_range(5,7)
		
		indicar_dano(dano_tomado, 3, c_yellow)
	}
}