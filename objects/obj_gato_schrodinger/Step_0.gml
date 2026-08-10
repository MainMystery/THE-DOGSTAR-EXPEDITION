if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (global.trop_position) exit


damage()

if (!vivo)
{
	sprite = "die"
	
	exit
}

caixas()



if (caixa != noone)
{
	x = caixa.x
	y = caixa.y + 10
	
	depth = caixa.depth - 1
}

imagex = lerp(imagex,1,0.1)
brilho = lerp(brilho,0,0.1)




