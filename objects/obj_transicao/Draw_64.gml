for (var i = 0; i < lins; i++)
{
	for (var j = 0; j < cols; j++)
	{
		
		//garantindo que a animação vai ser do primeiro
		var _img =  min(max(0, img - j), img_num)
		
		
		
		draw_sprite_ext(spr_transisao, _img, j * tamanho, i * tamanho, 1, 1, 0, c_black, 1)
	}
}
