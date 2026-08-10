shader_set(sh_brilho)

var uni = shader_get_uniform(sh_brilho, "u_brilho")
shader_set_uniform_f(uni, brilho)

draw_self()

shader_reset()

draw_set_font(fon_game)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_alpha(click)
draw_text_transformed(x,y - 20,"CLICK",1,1,0)