tam = clamp(tam,0.1,2)

x += vel

if (x > 608) instance_destroy(self)

//muda sprite de acordo com a vida
if (vida > vida_max div 2) image_index = 0
if (vida <= vida_max div 2 && vida > vida_max div 3) image_index = 1
if (vida <= vida_max div 3) image_index = 2


//quebrar
if (vida <= 0)
{
	var angulo = 360 / qtd_frag
	
	for (var i = 0; i < qtd_frag; i++)
	{
		var frag = instance_create_depth(x,y,depth,obj_fragmento_meteoro)
		frag.dir = i * angulo
		
		instance_destroy(self)
	}
	
	instance_destroy()
}

//sumir brilho
brilho = lerp(brilho,0,0.1)

//i-frames
if (i_frame > 0) i_frame--

if (dir_escol)  image_angle += vel_gir
else			image_angle -= vel_gir

var tiro = instance_place(x,y,obj_tiro_nave)

//tomar dano
if (tiro != noone && i_frame <= 0)
{
	//critico
	var crit = irandom(100)
	
	if (crit > 3)
	{
		var dano_tomado = irandom_range(3,10)
		
		i_frame = 5
		instance_destroy(tiro)
		brilho = 1
		vida -= dano_tomado
		tamx = random_range(0.3,tam + 1)
		tamy = random_range(0.3,tam + 1)
		
		indicar_dano(dano_tomado, 1, c_white)
	}
	else if (crit <= 3)
	{
		var dano_tomado = irandom_range(20,50)
		
		i_frame = 5
		instance_destroy(tiro)
		brilho = 1
		vida -= dano_tomado
		tamx = random_range(1,tam + 2)
		tamy = random_range(1,tam + 2)
		
		indicar_dano(dano_tomado, 3, c_yellow)
	}
	
	if (vida <= 20) obj_dogstar.pontuacao_atual += irandom_range(10,30)
}

tamx = lerp(tamx,tam,0.1)
tamy = lerp(tamy,tam,0.2)

//dar dano
if (place_meeting(x,y,obj_dogstar) && global.vida_nave > 0 && obj_dogstar.i_frame <= 0)
{
	vida = -99
	obj_dogstar.pontuacao_atual -= irandom_range(10,30)
	
	indicar_dano(9999, 5, c_red)

	obj_dogstar.tamx = random_range(0.3,2)
	obj_dogstar.tamy = random_range(0.3,2)
	obj_dogstar.dir = irandom_range(-50,50)
	
	tocar_som(snd_hit2)
	obj_dogstar.tamx2 = random_range(13,17)
	obj_dogstar.tamy2 = random_range(13,17)
	obj_dogstar.rot_bar = irandom_range(-200,200)
	
	global.vida_nave -= irandom_range(5,10) * tam
	obj_camera.shake_force = 2 * tam
	obj_camera.shake_time = 30
}

//buraco negro
if (instance_exists(obj_black_hole))
{
	var dir_ = point_direction(x,y,obj_black_hole.x,obj_black_hole.y)
	var dist = point_distance(x,y,obj_black_hole.x,obj_black_hole.y)
	
	puss += 0.1
	
	if (place_meeting(x,y,obj_black_hole)) instance_destroy(self)
	
	x += lengthdir_x(puss,dir_)
	y += lengthdir_y(puss,dir_)
	
	if (dist <= 300)
	{
		tam = lerp(tam,0,0.03)
		image_xscale = tam
		image_yscale = tam
	}
	
	if (dist <= 200) puss += 0.02
	
}

image_xscale = tam
image_yscale = tam