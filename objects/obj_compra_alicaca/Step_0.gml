preco = obj_status_alianca.preco

if (position_meeting(mouse_x,mouse_y,id) && surgir)
{
	if (delay_eff > 0) delay_eff--
	else if (delay_eff <= 0)
	{
		image_angle = random_range(-5,5)
		
		delay_eff = 10
	}
	
	image_xscale = lerp(image_xscale,2.5,0.1)
	image_yscale = lerp(image_yscale,2.5,0.1)
	
	//comprar
	if (mouse_check_button_pressed(mb_left))
	{
		if (compra = true)
		{
			if (global.qtd_radianita >= preco)
			{
				if (global.destino = 1) create_textbox("planet1 - money")
				if (global.destino = 2) create_textbox("planet2 - money")
				if (global.destino = 3) create_textbox("planet3 - money")
				if (global.destino = 4) create_textbox("planet4 - money")
				if (global.destino = 5) create_textbox("planet5 - money")
			}
			else 
			{
				if (global.destino = 1) create_textbox("planet1 - no_money")
				if (global.destino = 2) create_textbox("planet2 - no_money")
				if (global.destino = 3) create_textbox("planet3 - no_money")
				if (global.destino = 4) create_textbox("planet4 - no_money")
				if (global.destino = 5) create_textbox("planet5 - no_money")
			}
		}
		else 
		{
			if (global.destino = 1) create_textbox("planet1 - no_money")
			if (global.destino = 2) create_textbox("planet2 - no_money")
			if (global.destino = 3) create_textbox("planet3 - no_money")
			if (global.destino = 4) create_textbox("planet4 - no_money")
			if (global.destino = 5) create_textbox("planet5 - no_money")
		}
		
		obj_compra_alicaca.surgir = false
	}
}
else if (!position_meeting(mouse_x,mouse_y,id))
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
}

image_angle = lerp(image_angle,0,0.1)

if (surgir)
{
	y = lerp(y,y_ini,0.1)
	alpha = lerp(alpha,1,0.1)
}
else 
{
	y = lerp(y,480,0.1)
	alpha = lerp(alpha,0,0.1)
}