var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

draw_set_color(c_black)
draw_set_alpha(escuro)
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)

draw_sprite_ext(sprite_index,0,xx,yy,image_xscale,image_yscale,0,c_white,alpha)
