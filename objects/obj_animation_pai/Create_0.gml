sprite_corpo = noone
sprite_pe = noone
image_frame_pe = 0

x_pe1 = x
y_pe1 = y
x_pe2 = x
y_pe2 = y
dir = 0

walk_cycle = 0

imagex = 0
imagey = 1

tamanhox_dir = 1


//SPRITES DOS CACHORROS
// -------------------- SPRITE CACHORRO -------------------- \\
#region
skin = irandom_range(1,11)

if (skin = 1)
{
	sprite_corpo = spr_dog_1
	image_frame_pe = 0
}
if (skin = 2)
{
	sprite_corpo = spr_dog_2
	image_frame_pe = 0
}
if (skin = 3)
{
	sprite_corpo = spr_dog_3
	image_frame_pe = 3
}
if (skin = 4)
{
	sprite_corpo = spr_dog_4
	image_frame_pe = 0
}
if (skin = 5)
{
	sprite_corpo = spr_dog_5
	image_frame_pe = 0
}
if (skin = 6)
{
	sprite_corpo = spr_dog_6
	image_frame_pe = 4
}
if (skin = 7)
{
	sprite_corpo = spr_dog_7
	image_frame_pe = 0
}
if (skin = 8)
{
	sprite_corpo = spr_dog_8
	image_frame_pe = 5
}
if (skin = 9)
{
	sprite_corpo = spr_dog_9
	image_frame_pe = 6
}
if (skin = 10)
{
	sprite_corpo = spr_dog_10
	image_frame_pe = 1
}
if (skin = 11)
{
	sprite_corpo = spr_dog_11
	image_frame_pe = 2
}

#endregion

walk_anim = function()
{
	var vel = point_distance(0,0,velh,velv)

	if (instance_exists(obj_player))
	{
		if (id = obj_player.id)
		{	
			if (!rolando)
			{
				if (vel > 0)
				{
				    walk_cycle += vel * 0.1
		
					if (walk_cycle >= 6) walk_cycle = 0
		
					var distancia = 10
		
					x_pe1 = lerp(x_pe1, x - distancia, 0.3) + max(0,sin(walk_cycle)) + 5
					x_pe2 = lerp(x_pe2, x + distancia, 0.3) + floor(max(0,sin(walk_cycle) + pi) - 8)
				}
				else
				{
				    walk_cycle = lerp(walk_cycle,0,0.2)
					var distancia = 10
		
					x_pe1 = lerp(x_pe1, x - distancia, 0.15)
					x_pe2 = lerp(x_pe2, x + distancia, 0.15)
		
				}
	
				var altura = 10
	

				y_pe1 = y + 35 - max(0,sin(walk_cycle)) * altura
				y_pe2 = y + 35 - max(0,sin(walk_cycle + pi)) * altura
			}
			else
			{
				var altura = 15
	
				var distancia = 5
		
				x_pe1 = lerp(x_pe1, x - distancia, 0.3) 
				x_pe2 = lerp(x_pe2, x + distancia, 0.3)

				y_pe1 = y + 35  * altura
				y_pe2 = y + 35  * altura
			}
		}
		else
		{
			if (vel > 0)
			{
				walk_cycle += vel * 0.1
		
				if (walk_cycle >= 6) walk_cycle = 0
		
				var distancia = 10
		
				x_pe1 = lerp(x_pe1, x - distancia, 0.3) + max(0,sin(walk_cycle)) + 5
				x_pe2 = lerp(x_pe2, x + distancia, 0.3) + floor(max(0,sin(walk_cycle) + pi) - 8)
			}
			else
			{
				walk_cycle = lerp(walk_cycle,0,0.2)
				var distancia = 10
		
				x_pe1 = lerp(x_pe1, x - distancia, 0.15)
				x_pe2 = lerp(x_pe2, x + distancia, 0.15)
		
			}
	
			var altura = 10
	

			y_pe1 = y + 35 - max(0,sin(walk_cycle)) * altura
			y_pe2 = y + 35 - max(0,sin(walk_cycle + pi)) * altura
		}
	}
	else
	{
		if (vel > 0)
		{
			walk_cycle += vel * 0.1
		
			if (walk_cycle >= 6) walk_cycle = 0
		
			var distancia = 10
		
			x_pe1 = lerp(x_pe1, x - distancia, 0.3) + max(0,sin(walk_cycle)) + 5
			x_pe2 = lerp(x_pe2, x + distancia, 0.3) + floor(max(0,sin(walk_cycle) + pi) - 8)
		}
		else
		{
			walk_cycle = lerp(walk_cycle,0,0.2)
			var distancia = 10
		
			x_pe1 = lerp(x_pe1, x - distancia, 0.15)
			x_pe2 = lerp(x_pe2, x + distancia, 0.15)
		
		}
	
		var altura = 10
	

		y_pe1 = y + 35 - max(0,sin(walk_cycle)) * altura
		y_pe2 = y + 35 - max(0,sin(walk_cycle + pi)) * altura
	}
}

