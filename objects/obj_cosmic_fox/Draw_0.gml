shader_set(sh_brilho)

	var uni = shader_get_uniform(sh_brilho, "u_brilho")
	shader_set_uniform_f(uni, brilho)

	draw_sprite_ext(spr_cosmic_fox,0,x,y,imagex,imagey,0,c_white,1)

	//olhos
	draw_sprite_ext(spr_cosmic_fox_eye,0,x_eye * imagex,y_eye * imagey,imagex,imagey2,0,color_eye,1)


shader_reset()
