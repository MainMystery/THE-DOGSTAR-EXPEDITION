causa_dano = false
tam = random_range(0.5,4)

if (global.destino = 1)
{
	sprite_index = spr_tree
	image_index = irandom_range(0,10)
	if (image_index > 3) tam = random_range(0.5,1.2)
}

if (global.destino = 2)
{
	var die = irandom_range(1,10)
	
	if (die = 5) instance_destroy(self)
	
	sprite_index = spr_predio
	image_index = irandom_range(0,10)
	if (image_index > 3) tam = random_range(0.5,1.2)
}

if (global.destino = 3)
{
	sprite_index = spr_tree_3
	image_index = irandom_range(0,10)
	tam = random_range(0.5,1.2)
}

if (global.destino = 4)
{
	sprite_index = choose(spr_tree_2,spr_rock)
	image_index = irandom_range(0,10)
	tam = random_range(0.5,1.2)
}

if (global.destino = 5)
{
	sprite_index = choose(spr_lava1,spr_lava2,spr_lava3,spr_lava4)
	
	image_alpha = irandom_range(1,360)
	
	causa_dano = true
}



image_xscale = choose(tam,-tam)
image_yscale = tam
