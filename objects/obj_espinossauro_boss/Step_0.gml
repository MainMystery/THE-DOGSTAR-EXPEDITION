if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (global.trop_position) exit

//o alvo é o mais proximo
var alvo_player = instance_nearest(x, y, obj_player)
var alvo_aliados = instance_nearest(x, y, obj_aliados)
var dist_player = 999999
var dist_aliados = 999999

if (instance_exists(alvo_player))  dist_player = point_distance(x, y, alvo_player.x, alvo_player.y)
   

if (instance_exists(alvo_aliados)) dist_aliados = point_distance(x, y, alvo_aliados.x, alvo_aliados.y)
    

if (dist_player < dist_aliados) alvo = alvo_player   
else alvo = alvo_aliados


image_xscale = imagex * tamanhox_dir
image_yscale = imagey

andar_ik()
damage()

depth = (-bbox_bottom)
if (depth > 320) depth = 320

//morreu
if (vivo = false)
{
	sprite_index = spr_espinossauro_roar
	exit
}



brilho = lerp(brilho,0,0.1)
imagex = lerp(imagex,1,0.1)
imagey = lerp(imagey,1,0.2)

//alvo não existe
if (!instance_exists(alvo) || !alvo.vivo)
{
	alvo = noone
	velh = 0
	velv = 0
	image_angle = lerp(image_angle,0,0.1)
	
	estado = ""
	sprite_index = spr_espinossauro_padrao
	
	exit
}


moviment()


move_and_collide(velh,0,obj_render_light,12)
move_and_collide(0,velv,obj_render_light,12)