if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

var shake_x = random_range(-shake_force,shake_force)
var shake_y = random_range(-shake_force,shake_force)

// ---------------- CAMERA DAS NEGOCIAÇÕES ---------------- \\
#region

if (room = rm_negociacao)
{
	tamanhox = 768
	tamanhoy = 432
	camera_set_view_size(camera,tamanhox,tamanhoy)
	camera_set_view_pos(camera,0,0)
	
	exit
}

#endregion

// ---------------- CAMERA DO TOP DOWN ---------------- \\
#region

if (alvo = obj_player)
{
	var cx = camera_get_view_x(camera)
	var cy = camera_get_view_y(camera)

	var alvo_x = obj_mira.x - tamanhox/2

	var alvo_y = obj_mira.y - tamanhoy/2

	cx = lerp(cx, alvo_x, 0.15)
	cy = lerp(cy, alvo_y, 0.15)
	
	camera_set_view_size(camera,tamanhox,tamanhoy)
	camera_set_view_pos(camera,cx + shake_x,cy + shake_y)

	//aumentar camera
	if (!boss_die)
	{
		if (obj_player.arma.atira)
		{
			delay_zoom = 2* 60
		}
		
		//está em boss
		if (!obj_controlador_fase.BOSS)
		{
			if (delay_zoom > 0)
			{
				delay_zoom -= 1
				tamanhox = lerp(tamanhox,768,0.1)
				tamanhoy = lerp(tamanhoy,432,0.1)
			}
			else
			{
				tamanhox = lerp(tamanhox,512,0.1)
				tamanhoy = lerp(tamanhoy,288,0.1)
			}
		
		}
		else
		{
			if (delay_zoom > 0)
			{
				delay_zoom -= 1
				tamanhox = lerp(tamanhox,1024,0.1)
				tamanhoy = lerp(tamanhoy,576,0.1)
			}
			else
			{
				tamanhox = lerp(tamanhox,768,0.1)
				tamanhoy = lerp(tamanhoy,432,0.1)
			}

		}
		
	}

}

#endregion

// ---------------- CAMERA DO SPACE SHOTER ---------------- \\
if (alvo = obj_dogstar)
{
	camera_set_view_size(camera,tamanhox,tamanhoy)
	camera_set_view_pos(camera,0 + shake_x,0 + shake_y)
}

// ---------------- CAMERA DA ESCOLHA ---------------- \\
if (alvo = noone)
{
	if (room != rm_game_over)
	{
		camera_set_view_size(camera,640,360)
		camera_set_view_pos(camera,0 + shake_x,0 + shake_y )
	}
	else
	{
		camera_set_view_size(camera,1280,720)
		camera_set_view_pos(camera,0 ,0 )
	}
}


//tremer
// TREMER
if (shake_time > 0) 
{
	shake_time -= 1
	
}
else if (shake_time <= 0) 
{
	shake_force = lerp(shake_force,0,0.2)

}