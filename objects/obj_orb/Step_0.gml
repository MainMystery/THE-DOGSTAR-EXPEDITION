if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

depth = -y

with (obj_tiro)
{
	if (place_meeting(x,y,other.id))
	{
		if (other.poder != 1)
		{
			instance_destroy()
			other.explode = true
		}
		if (other.poder = 1)
		{
			var fum = instance_create_depth(x,y,depth - 2,obj_fumaca)
			fum.image_blend = other.cor
			fum.image_xscale = 5
			fum.image_yscale = 5
			create_light(other.x - 15,other.y,other.cor,8,10,10,-10,0.1)
			instance_destroy()
			instance_destroy(other)
		}
	}
}

image_xscale = lerp(image_xscale,tam_atual,0.2)
image_yscale = lerp(image_yscale,tam_atual,0.1)

image_blend = cor

//andar um pouco
velocidade = lerp(velocidade,0,0.1)

x += lengthdir_x(velocidade,direcao)
y += lengthdir_y(velocidade,direcao)

if (!criou_luz)
{
	create_light(x,y,cor,0.5,5,5,id,0)
	criou_luz = true
}

if (poder = 1)
{
	tam_atual = random_range(0.2,tam + 5)
}

//tempo pra explodir
if (pode_explodir)
{
	if (delay_explodir > 0)
	{
		delay_explodir--
		
		if (poder = 2)
		{
			if (delay_aumenta_qtd > 0) delay_aumenta_qtd --
			else if (delay_aumenta_qtd <= 0)
			{
				qtd += 5
				delay_aumenta_qtd = 20
				velocidade_tiro += 1
				dano_tiro += 5
			}
		}
	}
	else if (delay_explodir <= 0) explode = true
	
	//tempo baixo ele fica doido
	if (delay_explodir <= 30) tam_atual = random_range(0.2,tam + 5)
	else
	{
		if (poder != 1) tam_atual = tam
	}
}

if (explode)
{	
	var angulo = 360 / qtd
	
	for (var i = 0; i < qtd; i++)
	{
		create_bullet(x,y,i * angulo,timee,cor,2,cor,0.8,2,velocidade_tiro,dano_tiro,tempo_vida_tiros)
		
		instance_destroy(self)
	}
}