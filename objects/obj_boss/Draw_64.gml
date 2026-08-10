draw_set_font(fon_game)

//centro da tela
var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

var col = make_color_rgb(0,0,100)

var larg = 600

var porcentagem = vida / vida_max
porcentagem = clamp(porcentagem, 0, 1)

draw_set_alpha(alpha_bar)
draw_set_color(col)
draw_rectangle(xx - 300,yy + 320,xx + 300,yy + 300,false)
draw_set_color(c_red)
draw_rectangle(xx - 300,yy + 320,xx - larg/2 + larg * porcentagem,yy + 300,false)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_rectangle(xx - 300,yy + 320,xx + 300,yy + 300,true)
draw_text_transformed(xx,yy + 280,boss,1,1,0)