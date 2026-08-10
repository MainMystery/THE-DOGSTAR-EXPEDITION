sprite_index = choose(spr_meteoro_1,spr_meteoro_2,
spr_meteoro_3,spr_meteoro_4,spr_meteoro_5,spr_meteoro_6)

//chance rara de ser dinossauro
var dino = irandom(100)

if (dino <= 2) sprite_index = spr_meteoro_7

vel = irandom_range(1,3)
tam = random_range(0.7,2)

vida_max = floor(50 * tam)
vida = vida_max

tamx = tam
tamy = tam

puss = 0

image_angle = irandom_range(0,360)

vel_gir = random_range(0.5,1)
dir_escol = choose(true,false)


brilho = 0

i_frame = 0

qtd_frag = floor(irandom_range(2,4) * tam)


image_xscale = tam
image_yscale = tam