var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

var texto_visivel = string_copy(texto, 1, texto_caracteres)

draw_set_alpha(1)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(fon_game)
draw_set_alpha(1)
draw_set_color(c_white)
draw_text_ext(xx, yy + 150, texto_visivel,20,800)


//escuro
draw_set_alpha(escuro)
draw_set_color(c_black)
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
