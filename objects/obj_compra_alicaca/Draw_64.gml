if (compra)
{
	var xx = display_get_gui_width() / 2
	var yy = (display_get_gui_height() / 2) - 325
	
	draw_set_alpha(alpha)
	draw_set_color(c_white)
	draw_text_transformed(xx + 550,yy,global.qtd_radianita,2,2,0)
	draw_sprite_ext(spr_icon_money,0,xx + 500 - (string_width(global.qtd_radianita) - 20),yy,5,5,0,c_white,alpha)
}