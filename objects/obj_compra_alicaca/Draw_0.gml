draw_self()

draw_set_font(fon_game)

if (compra)
{
	draw_set_color(c_black)
	draw_set_alpha(alpha - 0.5)
	var rec = "DAR " + string(preco) + string(" RECURSOS PARA FORMAR ALIANÇA")
	draw_text_transformed(386,y - 82,rec,1.5,1.5,0)

	draw_set_color(c_white)
	draw_set_alpha(alpha)
	draw_text_transformed(384,y - 80,rec,1.5,1.5,0)
}

