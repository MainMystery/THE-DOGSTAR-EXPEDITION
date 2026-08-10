brilho = 0
tamx = 5
tamy = 5

olhar = 0

i_frame = 0

tam = 5

boss = "Kraken Space"

vida_max = 1200
vida = vida_max

alpha_bar = 0

delay_effect_die = 0

delay_acabar = 2 * 60

x = -96
y = 128

morrendo = false

image_xscale = tam
image_yscale = tam

tentaculo_1 = instance_create_depth(x,y,depth - 1,obj_tentaculo)
tentaculo_1.dono = id
tentaculo_1.tentaculo_block = true

tentaculo_2 = instance_create_depth(x,y,depth - 1,obj_tentaculo)
tentaculo_2.dono = id