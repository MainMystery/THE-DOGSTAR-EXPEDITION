if (global.destino = 1) 
{
	image_blend = make_color_rgb(95,178,78)
	sprite_index = spr_chao_2
}
if (global.destino = 2)
{
	image_blend = make_color_rgb(129,129,153)
	sprite_index = spr_chao_3
}
if (global.destino = 3) 
{
	image_blend = make_color_rgb(76,76,153)
	sprite_index = spr_chao
}
if (global.destino = 4)
{
	image_blend = make_color_rgb(195,254,76)
	sprite_index = spr_chao_2
}
if (global.destino = 5)
{
	image_blend = make_color_rgb(99,86,102)
	sprite_index = spr_chao_3
}


var lay_id = layer_get_id("Background")
var back_id = layer_background_get_id(lay_id)
layer_background_blend(back_id, image_blend)
layer_background_sprite(back_id,sprite_index)