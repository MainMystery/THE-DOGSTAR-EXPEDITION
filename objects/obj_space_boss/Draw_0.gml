draw_set_font(fon_game)

shader_set(sh_brilho)

	var uni = shader_get_uniform(sh_brilho, "u_brilho")
	shader_set_uniform_f(uni, brilho)

	draw_sprite_ext(sprite_index,image_index,x,y,tamx,tamy,image_angle,c_white,1)
	draw_sprite_ext(spr_kraken_eye,0,x + 45,y - 35,tamx,tamy,olhar,c_white,1)

shader_reset()

