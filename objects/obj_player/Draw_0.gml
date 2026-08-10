shader_set(sh_brilho)

var uni = shader_get_uniform(sh_brilho, "u_brilho")
shader_set_uniform_f(uni, brilho)

event_inherited()



shader_reset()