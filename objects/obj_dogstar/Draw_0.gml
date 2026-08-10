draw_set_font(fon_game)

shader_set(sh_brilho)

	var uni = shader_get_uniform(sh_brilho, "u_brilho")
	shader_set_uniform_f(uni, brilho)

	draw_sprite_ext(sprite_index,image_index,x,y,tamx,tamy,dir,c_white,1)

shader_reset()


draw_set_alpha(ganhou_alpha)	
draw_set_color(ganhou_col)
var valo = "+" + string(ganhou)
draw_text_transformed(x,y - 20,valo,2,2,0)