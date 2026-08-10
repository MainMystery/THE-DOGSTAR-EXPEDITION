var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

draw_set_font(fon_game)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if (global.pause)
{
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
	
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text_transformed(xx + 450,yy,"PAUSADO",3,3,0)
	
	exit
}

if (alpha_damage > 0) draw_sprite_ext(spr_damage_tela,0,xx,yy,13,13,0,c_white,alpha_damage)

//HUD
if (vida > 0 && room = rm_planeta)
{
	var yy2 = yy - 420 + 100
	var xx1 = xx + 450
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text_transformed(xx1,yy2,global.soldados_qtd,2,2,0)
	draw_sprite_ext(spr_dog_2,0,xx1 - (string_width(global.soldados_qtd) - 100),yy2,1,1,0,c_white,1)

	draw_sprite_ext(spr_sistema,0,xx - 450,yy -320,8,8,0,c_aqua,0.5)
	draw_text_transformed(xx - 450 ,yy - 320,vida,2,2,0)
	
	
	if (!obj_controlador_fase.BOSS) draw_text_transformed(xx  ,yy - 320,inimigos,2,2,0)
}