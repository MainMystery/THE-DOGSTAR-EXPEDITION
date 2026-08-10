function create_light(_x, _y, _color, _intensity, _xscale, _yscale, _alvo = -10,_life_time = 0)
{
	var luz = instance_create_depth(_x,_y,depth,obj_light)
	luz.image_blend = _color
	luz.image_alpha = _intensity
	luz.image_xscale = _xscale
	luz.image_yscale = _yscale
	luz.alvo = _alvo
	luz.life = _life_time
}

function tocar_som(_som_id)
{
	audio_play_sound(_som_id,0,0,0.5,0,random_range(0.9,1.1))
}

//tiros
function create_bullet(_x,_y,_dir,_time = 0,_color,_tamanho,color_light = -1,_intesity_bullet,_tam_bullet,_velocit = 4,_damage,_tempo = 0.001,_rechot = false)
{
	var bullet = instance_create_layer(_x,_y,"tiros",obj_tiro)
	bullet.tam_final = _tamanho
	bullet.dir = _dir
	bullet.time = _time
	bullet.vel = _velocit
	bullet.dano = _damage
	bullet.time_left = _tempo
	bullet.cor = _color
	bullet.requichotear = _rechot
	
	if (color_light != -1)
	{
		create_light(bullet.x,bullet.y,color_light,_intesity_bullet,_tam_bullet,_tam_bullet,bullet,bullet.time_left)
	}
}

//orbes
function create_orb(_x,_y,_dir,_vel,_quantidade,_color,_tamanho,_explode = false,tempo_explodir = 0,_velocidade_tiros,dano_tiros,_time = 0,tm_life = 0.01,_poder = 0)
{
	var orb = instance_create_layer(_x,_y,"tiros",obj_orb)
	
	orb.direcao = _dir
	orb.qtd = _quantidade
	orb.pode_explodir = _explode
	orb.delay_explodir = tempo_explodir
	orb.dano_tiro = dano_tiros
	orb.velocidade_tiro = _velocidade_tiros
	orb.velocidade = _vel
	orb.cor = _color
	orb.timee = _time
	orb.tam = _tamanho
	orb.tempo_vida_tiros = tm_life
	orb.poder = _poder
}

//effect boing
function boing(_imagex = 2, _imagey = 6)
{
	imagex = _imagex
	imagey = _imagey
}

//indicar dano
function indicar_dano(_dano_levado, _tamanho, _cor = c_white)
{
	var dano_ = instance_create_depth(x,y,depth,obj_indicador_de_dano)
	dano_.dano_levado = _dano_levado
	dano_.dano_image_alpha = 8
	dano_.dano_color = _cor
	dano_.dano_x = x + irandom_range(-20,20)
	dano_.dano_y = y + irandom_range(-20,5)
	dano_.dano_tamanho = irandom_range(_tamanho - 0.5, _tamanho)
	dano_.dano_tamx = random_range(0.5,2)
	dano_.dano_tamy = random_range(0.5,2)
	
	dano_.dano_tamanho = clamp(dano_.dano_tamanho,0.1,10)
}


randomize()