draw_set_alpha(1)

surface_set_target(surf_light)

gpu_set_blendmode_ext(bm_dest_color, bm_zero)

draw_surface(application_surface, 0, 0)

gpu_set_blendmode(bm_normal)

surface_reset_target()


// Desenha a iluminação ocupando a janela inteira
var _sw = surface_get_width(surf_light)
var _sh = surface_get_height(surf_light)

var _ww = window_get_width()
var _wh = window_get_height()

draw_surface_ext(
    surf_light,
    0, 0,
    _ww / _sw,
    _wh / _sh,
    0,
    c_white,
    1
)