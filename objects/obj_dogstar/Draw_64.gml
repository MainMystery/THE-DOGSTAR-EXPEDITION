//centro da tela
var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fon_game)
var larg = 500

var porcentagem = pontuacao_atual / pontuacao_necesaria
porcentagem = clamp(porcentagem, 0, 1)

draw_set_alpha(1)
draw_set_color(c_white)
draw_rectangle(xx - 250,yy + 340,xx + 250,yy + 335,false)
draw_rectangle(xx - 250,yy + 345,xx - 245,yy + 330,false)
draw_rectangle(xx + 250,yy + 345,xx + 255,yy + 330,false)


draw_sprite_ext(spr_dogstar_icon,0,xx - larg/2 + larg * porcentagem,yy + 330,2,2,0,c_white,1)


var life = floor(global.vida_nave)

life = string(clamp(life,0,100)) + string("%")

//vida da nave
draw_set_alpha(1)
draw_set_color(c_white)
draw_sprite_ext(spr_sistema,frame,xx - 540,100,tamx2,tamy2,rot_bar,cor_bar,1)
draw_text_transformed(xx - 530,120,life,4,life_y,0)


//tela escura
draw_set_alpha(tela_escura)
draw_set_color(c_black)
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)