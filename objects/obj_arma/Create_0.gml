tiro = false
delay_tiro = 20

dir = 0

atira = 0 

alvo = obj_player

pode_usar = true


dano_a_mais = 0
recshot = true

tam = 1.5

image_xscale = tam
image_yscale = tam


arma_random = 0

arma = 1

aliados = false

select_arma = false

//dano de arma branca
dano = 0


time_explodir = 1
dano_tiro = 0
velocidade = 0
cor_tiro = c_white
cor_disparo = c_white
cor_impact = c_white
tamanho_tiro = 0
intensidade_brilho = 1
tempo = 0.01
tipy = 0
delay_tiro_tempo = 10
qtd_orb = 20



ind = 0

delay_melle = 0.3 * 60

mellee = false

time = 0

tamanho_add = 0
tamanho_addy = 0

delay_adicional = 0

criou_luz = false
visivel = false

luz = instance_create_depth(x,y,depth,obj_light)
luz.image_blend = cor_impact
luz.image_alpha = 0.5
luz.image_xscale = 1.5
luz.image_yscale = 0.5
luz.alvo = -10