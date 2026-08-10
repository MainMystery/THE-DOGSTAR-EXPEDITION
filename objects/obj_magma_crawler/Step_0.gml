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


depth = (-y)
if (depth > 320) depth = 320



alvo_dir = point_direction(x, y, alvo.x, alvo.y)


dir += angle_difference(alvo_dir, dir) * 0.1

damage()

if (!vivo)
{
	if (instance_exists(membro)) membro.vivo = false
	exit
}

//alvo não existe
if (!instance_exists(alvo) || !alvo.vivo)
{
	alvo = noone
	exit
}

move()
estados()


imagex = lerp(imagex,1,0.1)
imagey = lerp(imagey,1,0.2)
brilho = lerp(brilho,0,0.1)

move_and_collide(velh,0,obj_dogstar,12)
move_and_collide(0,velv,obj_dogstar,12)