velh = 0
velv = 0

vel = 3

puss = 0

//luz
luz = instance_create_depth(x,y,depth - 10,obj_light)
luz.image_blend = c_aqua
luz.image_alpha = 0.5
luz.image_xscale = 0.5
luz.image_yscale = 0.5
luz.alvo = -10


//tiros
delay_tiro = 0.2 * 60
delay = 0

tamanho = 0.8

image_xscale = tamanho
image_yscale = tamanho

brilho = 0

delay_inicial = 3 * 60

//coisas dos eventos
evento = choose("meteoro","meteoro","black")

meteoro_delay = 1 * 60
dificuldade_meteoro = random_range(0,2)

vamos_ter2_eventos = false

var two = irandom(100)

if (two <= 45) vamos_ter2_eventos = true

//caixas e recurso
delay_recurso = irandom_range(8,12) * 60
ganhou_col = c_white
ganhou_alpha = 0
ganhou = 0


next_evento = ""

pontuacao_atual = 0
pontuacao_necesaria = irandom_range(1000,3000)

venceu = false

i_frame = 0

delay_brilho = 0

dir = 0
tamx = tamanho
tamy = tamanho

colision = [obj_parede,obj_space_boss]

//vai ser dificil?
var difi = irandom(100)

if (difi <= 10) dificuldade_meteoro = random_range(1,4)

rot_bar = 200
cor_bar = c_aqua
tamx2 = 15
tamy2 = 0
frame = irandom_range(1,10)
life_y = 0


tela_escura = 2

som = false

//movimentação
moviment = function()
{
	var up,down,left,right
	
	right = keyboard_check(ord("D")) || keyboard_check(vk_right)
	left = keyboard_check(ord("A")) || keyboard_check(vk_left)
	up = keyboard_check(ord("W")) || keyboard_check(vk_up)
	down = keyboard_check(ord("S")) || keyboard_check(vk_down)
	
	velh = (right - left) * vel
	velv = (down - up) * vel
}

//tiros
atirar = function()
{
	var tiro = mouse_check_button(mb_left)
	
	if (delay > 0) delay --
	
	if (tiro && delay <= 0)
	{
		tocar_som(snd_tiro_2)
		delay = delay_tiro
		instance_create_depth(x - 40,y,depth + 1,obj_tiro_nave)
	}
}

//2 eventoss
if (vamos_ter2_eventos)
{
	var boss = irandom(100)
	
	next_evento = choose("meteoro","black")
	
	if (boss <= 30) next_evento = "boss"
}

//eventos
event = function()
{
	if (delay_inicial > 0) delay_inicial--
	
	
	
	if (delay_inicial <= 0)
	{
		//meteoros
		if (evento = "meteoro")
		{
			if (meteoro_delay > 0) meteoro_delay -= 1 + dificuldade_meteoro
	
			//criar meteoro
			if (meteoro_delay <= 0)
			{
				var meteoro = instance_create_layer(-96,y + irandom_range(-80,80),"evento",obj_meteoro)
		
				meteoro.vel = random_range(0.5,0.8) + dificuldade_meteoro
				meteoro.tam =  random_range(0.5,1.3) + dificuldade_meteoro
		
				meteoro_delay = irandom_range(1,4) * 60
			}
		}
	
		//black hole
		if (evento = "black")
		{
			if (!instance_exists(obj_black_hole))
			{
				instance_create_depth(x,y,depth,obj_black_hole)
			}
		}
	
		//boss
		if (evento = "boss")
		{
			if (!instance_exists(obj_space_boss))
			{
				instance_create_depth(x,y,depth,obj_space_boss)
			}
		}
	
		//caixas
		if (delay_recurso > 0) delay_recurso--
		else if (delay_recurso <= 0)
		{
			delay_recurso = irandom_range(8,12) * 60
		
			var caixa_ch = irandom(100)
		
			var caixa = instance_create_layer(-96,y + irandom_range(-80,80),"evento",obj_recursor)
		
			if (caixa_ch <= 25) caixa.caixa = true
		
		}
	
	}
}

