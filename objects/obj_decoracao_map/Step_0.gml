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

	if (ini != noone && ini.i_frame <= 0)
	{
		ini.brilho = 1
		ini.vida -= irandom_range(5,5 + 8)
			
		ini.i_frame = 15
			
		with (ini)
		{
			boing(random_range(0.5,3),random_range(0.5,3))
		}
	}

}
else depth = -y