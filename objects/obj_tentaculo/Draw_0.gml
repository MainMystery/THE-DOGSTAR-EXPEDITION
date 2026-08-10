shader_set(sh_brilho)

	var uni = shader_get_uniform(sh_brilho, "u_brilho")
	shader_set_uniform_f(uni, brilho)

	draw_self()

shader_reset()

if (!tentaculo_block) draw_sprite_ext(spr_alerta,0,x + 350,y,2,alerty,0,c_white,alert_alpha)
else draw_sprite_ext(spr_alerta,0,x,y + 100,2,alerty,0,c_white,alert_alpha)
