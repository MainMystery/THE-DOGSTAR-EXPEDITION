if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1



if (causa_dano)
{
	depth = 20
	
	var ini = instance_place(x,y,[obj_player,obj_aliados])

	if (ini != noone && ali.i_frame <= 0)
	{
		ali.brilho = 1
		ali.vida -= irandom_range(5,5 + 8)
			
		ali.i_frame = 15
			
		with (ini)
		{
			boing(random_range(0.5,3),random_range(0.5,3))
		}
	}

}
else depth = -y