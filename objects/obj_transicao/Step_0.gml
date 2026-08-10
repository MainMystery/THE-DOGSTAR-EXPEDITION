depth = -9999

//animando
img += img_vel

//check se terminou
if (img - img_num > cols + 1)
{
	global.pause = false
	room_goto(rm_principal)
}

