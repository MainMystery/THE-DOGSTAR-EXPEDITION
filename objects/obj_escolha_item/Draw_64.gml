var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

draw_set_font(fon_game)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_alpha(alpha)
draw_set_color(c_white)
draw_text_transformed(xx,yy - 200,"NOVO ITEM",tamx,tamy,dir)

var xx1 = xx

if (recompensa = 11)
{
	xx1 = xx - 90
}
if (recompensa = 12)
{
	xx1 = xx - 240
}
if (recompensa = 13)
{
	xx1 = xx - 130
}
if (recompensa = 14)
{
	xx1 = xx - 300
}
if (recompensa = 15)
{
	xx1 = xx - 100
}
if (recompensa = 16)
{
	xx1 = xx - 100
}
if (recompensa = 17)
{
	xx1 = xx - 100
}

draw_sprite_ext(sprite_index,image_index,xx1,yy + 50,tamx + 10,tamy + 10,dir,c_white,alpha)


if (global.pegou_item = false) 
{
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text_transformed(xx,yy - 250,"ESCOLHA 1 ITEM",2,2,0)
}