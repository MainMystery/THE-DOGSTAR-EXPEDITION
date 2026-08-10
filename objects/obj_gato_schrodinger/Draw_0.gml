shader_set(sh_brilho)

	var uni = shader_get_uniform(sh_brilho, "u_brilho")
	shader_set_uniform_f(uni, brilho)

	draw_sprite_ext(sprite_index,image_index,x,y,imagex,imagey,0,c_white,1)

shader_reset()
