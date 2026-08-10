if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (global.trop_position) exit


depth = (-bbox_bottom + 20)

damage()

if (vivo = false)
{
	rabo.image_speed = 0
	rabo.estado = "die"
	instance_destroy(luz)
	
	exit
}

//alvo não existe
if (!instance_exists(alvo) || !alvo.vivo)
{
	alvo = noone
	exit
}

estados()


luz.image_blend = color_eye
luz.image_alpha = imagex
luz.x = x + 80
luz.y = y - 110


var olhar = point_direction(x,y,alvo.x,alvo.y)

x_eye += lengthdir_x(1,olhar)
y_eye += lengthdir_y(1,olhar)
	
x_eye = clamp(x_eye, x - 10, x + 8)
y_eye = clamp(y_eye, y - 8 , y + 10)

if (delay_abrir_olho > 0)
{
	delay_abrir_olho --
	imagey2 = 0
}
else if (delay_abrir_olho <= 0) imagey2 = 1

brilho = lerp(brilho,0,0.1)

imagey = lerp(imagey,1,0.2)


if (frame < sprite_get_number(spr_cosmic_fox_rabo))
{
	frame += 0.12
}
else if (frame >= sprite_get_number(spr_cosmic_fox_rabo) - 1)
{
	frame = 0
}