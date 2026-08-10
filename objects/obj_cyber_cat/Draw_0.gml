shader_set(sh_brilho)

	var uni = shader_get_uniform(sh_brilho, "u_brilho")
	shader_set_uniform_f(uni, brilho)

		//pés
		if (pes)
		{
			draw_sprite_ext(spr_cat_robot_foot,0,x_pe1,y_pe1,imagex * -tamanhox_dir,imagey,0,image_blend,1)
			draw_sprite_ext(spr_cat_robot_foot,0,x_pe2,y_pe2,imagex * tamanhox_dir,imagey,0,image_blend,1)
		}
			draw_sprite_ext(sprite_index,image_index,x,y,imagex * tamanhox_dir,imagey * tamanhoy_dir,image_angle,image_blend,1)
		
		draw_sprite_ext(spr_cat_arm_2,0,x,y,arm_x,1,dir,c_white,1)

shader_reset()