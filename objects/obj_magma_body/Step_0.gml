if (global.pause)
{
	image_speed = 0
	exit
}
else image_speed = 1

if (morto)
{
	image_alpha = lerp(image_alpha,0,0.2)
	brilho = 2
	
	if (image_alpha <= 0) instance_destroy(self)
	
	exit
}

//o pai morreu
if (!dono_principal.vivo)
{
	morto = true
}

vida = dono_principal.vida


var dist = point_distance(x,y,dono.x,dono.y)
var dir = point_direction(x,y,dono.x,dono.y)

depth = dono.depth + 15


var inim = instance_place(x,y,inimigos)	
//causar dano
if (inim != noone)
{
	if (inim.i_frame <= 0 && image_alpha > 0.5)
	{	
		inim.vida -= irandom_range(dano - 5, dano * 2)
		inim.i_frame = 30
		inim.brilho = 1
		if (inim.id = obj_player.id)
		{
			inim.alpha_damage += 20
			obj_camera.shake_force += 5
			obj_camera.shake_time += 20
		}
		
		with (inim)
		{
			boing(random_range(0.5,2),random_range(0.5,2))
		}
	}
	
	
}

//mexer o corpo
if (dist > 90)
{
	x += lengthdir_x(6,dir)
	y += lengthdir_y(6,dir)
}

//tomar dano
if (image_alpha > 0.7)
{
	#region

	//dano
	var tiro_inigo = instance_place(x,y,obj_tiro)

	//tomou dano
	if (tiro_inigo != noone && i_frame <= 0 && dono_principal.vivo)
	{
		//tiro do outro time
		if (tiro_inigo.time != 2) 
		{
			//chance de critico
			var critc = irandom(100)
			
			//tomou o dano
			brilho = 1.3
			
			if (critc > dono_principal.chance_crit)
			{
				var dano_levado = irandom_range(tiro_inigo.dano,tiro_inigo.dano + 8) div 4
				var dano_tamanho = irandom_range(2,3)
			
				indicar_dano(dano_levado,dano_tamanho,c_white)
			}
			else if (critc <= dono_principal.chance_crit)
			{	
				var dano_levado = irandom_range(tiro_inigo.dano + 25,tiro_inigo.dano + 45) div 4
				var dano_tamanho = irandom_range(4,5)
			
				indicar_dano(dano_levado,dano_tamanho,c_yellow)
			}
			
			dono_principal.vida -= dano_levado
			
			i_frame = 15
			

			
			boing(random_range(0.3,2),random_range(0.3,2))
		}
	}
	
	//i frames
	if (i_frame > 0)
	{
		i_frame --
	}

	#endregion
}

image_alpha = lerp(image_alpha,dono.image_alpha,0.1)
image_angle += angle_difference(dir , image_angle) * 0.25
brilho = lerp(brilho,dono.brilho,0.2)

brilho = lerp(brilho,0,0.2)

//sumiu vai para seu dono
if (image_alpha <= 0.05)
{
	image_alpha = 0
	x = dono.x + 50
	y = dono.y
}