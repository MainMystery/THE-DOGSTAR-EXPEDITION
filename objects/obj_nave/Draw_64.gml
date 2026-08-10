//tela escura
draw_set_alpha(tela_escura)
draw_set_color(c_black)
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)

var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//dinheiro
if (global.interface = 3)
{
	acres = lerp(acres,100,0.2)
}
else acres = lerp(acres,0,0.2)

if (global.interface = 5) 
{
	acres2 = lerp(acres2,100,0.2)
}
else acres2 = lerp(acres2,0,0.2)


var yy1 = yy - 420 + acres
draw_set_alpha(1)
draw_set_color(c_white)
draw_text_transformed(xx + 550,yy1,global.qtd_radianita,2,2,0)
draw_sprite_ext(spr_icon_money,0,xx + 500 - (string_width(global.qtd_radianita) - 20),yy1,5,5,0,c_white,1)



var yy2 = yy - 420 + acres2 + acres
draw_set_alpha(1)
draw_set_color(c_white)
draw_text_transformed(xx,yy2,global.soldados_qtd_total,2,2,0)
draw_sprite_ext(spr_dog_2,0,xx - (string_width(global.soldados_qtd_total) - 100),yy2,1,1,0,c_white,1)




var life = floor(global.vida_nave)

life = string(clamp(life,0,100)) + string("%")

//vida da nave
draw_set_alpha(1)
draw_set_color(c_white)
draw_sprite_ext(spr_sistema,1,xx - 540,-200 + acres * 3,10,10,0,c_aqua,1)
draw_text_transformed(xx - 530,-190 + acres * 3,life,3,3,0)