//centro da tela
var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

draw_set_font(fon_game)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)


if (botao = 37)
{
	draw_set_color(c_black)
	draw_set_alpha(esc_sair - 0.5)
	draw_text_transformed(xx + 8,yy + 323,"ESC para fechar",2,2,0)
	
	draw_set_alpha(esc_sair)
	draw_set_color(c_white)
	draw_text_transformed(xx,yy + 320,"ESC para fechar",2,2,0)
}

//mostrar oq o chip faz
if (detalhes_chip)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	
	draw_rectangle(0,0,display_get_gui_width(),display_get_height(),false)
	
	draw_set_alpha(1)
	draw_set_color(c_white)
	
	draw_text_transformed(xx,yy - 300,"Precione qualquer tecla para fechar",2,2,0)
	
	if (tamx_com < 0)
	{
		draw_sprite_ext(spr_interface3,0,xx,yy,tamx_com,tamy_com,0,c_white,1)
		
		//texto
		draw_set_color(c_white)
		draw_text_ext_transformed(xx - 10,yy,texto,15,180,(-tamx_com / 25) * 2,2,0)
	}
	if (tamx_com > 0) draw_sprite_ext(spr_chips,image_index,xx,yy,tamx_com,tamy_com,0,c_white,1)
	
	
}