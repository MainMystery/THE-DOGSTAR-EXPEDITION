if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

//o alvo é o mais proximo
var alvo_player = instance_nearest(x, y, obj_player)
var alvo_aliados = instance_nearest(x, y, obj_aliados)
var dist_player = 999999
var dist_aliados = 999999

if (instance_exists(alvo_player))  dist_player = point_distance(x, y, alvo_player.x, alvo_player.y)
   

if (instance_exists(alvo_aliados)) dist_aliados = point_distance(x, y, alvo_aliados.x, alvo_aliados.y)
    

if (dist_player < dist_aliados) alvo = alvo_player
    
else  alvo = alvo_aliados
   


walk_anim()

brilho = lerp(brilho,0,0.2)

if (vivo) event_inherited()

damage()

//alvo não existe
if (!instance_exists(alvo) || !alvo.vivo)
{
	alvo = noone
	velh = 0
	velv = 0
	dir = lerp(dir,0,0.1)
	
	imagex = lerp(imagex,1,0.1)
	imagey = lerp(imagey,1,0.2)
	
	if (instance_exists(arma)) arma.atira = false
	
	exit
}


with (obj_inimigos)
{
	var dirrl = point_direction(x,y,other.x,other.y)
	
	if (place_meeting(x,y,other))
	{
		x -= lengthdir_x(5,dirrl)
		y -= lengthdir_y(5,dirrl)
	}
}

atirar()
movimento()

move_and_collide(velh,0,colision,12)
move_and_collide(0,velv,colision,12)
