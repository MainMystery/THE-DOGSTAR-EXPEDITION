var tecla_passar_pg = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)

var text_box_x = display_get_gui_width() / 2

var text_box_y = display_get_gui_height() / 2 + 200

// ------------------------- SETUP ------------------------- \\
#region
if (setup = false)
{	
	// loop olhando as páginas
	for (var p = 0; p < numero_paginas; p ++)
	{
		//vendo o tamanho do comprimento de cada texto em cada pagina
		texto_comprimento[p] = string_length(text[p])
	}
	
	setup = true
}

// Definição do tamanho do ícone baseada no alpha
tam_ico = lerp(tam_ico, alpha_text * 1.5, 0.35)

#endregion


// ------------------------- Digitando o texto ------------------------- \\
if (caracter_atual < texto_comprimento[pagina])
{
	caracter_atual += text_vel
	caracter_atual = clamp(caracter_atual,0,texto_comprimento[pagina])
}

// ------------------------- passando páginas ------------------------- \\
if (tecla_passar_pg)
{
	//terminou de escrever a pagina ele vai pra proxima
	if (caracter_atual = texto_comprimento[pagina] && delay <= 0)
	{
			//existe mais páginas posso avançar
			if (pagina < numero_paginas - 1)
			{
				pagina += 1
				tam_ico = 0.5
				caracter_atual = 0
				delay = 30
			}
			//não tem mais páginas
			else
			{
				// mas se apertar uma pergunta
				if (option_number > 0)
				{
					create_textbox(option_link_id[option_pos])
				}
				
				if (proximo_texto != "")
			    {
			        create_textbox(proximo_texto)
			    }
				
				//se destroi
				instance_destroy(self)
			}

	}
	//não terminou de digitar
	else
	{
		//pula pro final da fala
		caracter_atual = texto_comprimento[pagina]
	}
}


// ------------------------- desenhando a caixa de texto ------------------------- \\
#region

largura_sprite = sprite_get_width(sprite_caixa)
altura_sprite = sprite_get_height(sprite_caixa)

//desenhando a caixa no fundo
draw_sprite_ext(sprite_caixa,imag_frames,text_box_x,text_box_y,textBox_largura/largura_sprite , textBox_altura/altura_sprite ,0,c_white,alpha_text)

#endregion



// ------------------------- OPÇÕES ------------------------- \\
if (caracter_atual = texto_comprimento[pagina] && pagina = numero_paginas - 1)
{
	var up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
	var down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
	
	//seta de escolha
	option_pos += down - up
	option_pos = clamp(option_pos, 0, option_number -1)
	
	
	//espaço entre cada opção
	var _op_space = 50 
	var _op_borda = -12
	
	var text_box_x_op = text_box_x + 400
	var text_box_y_op = text_box_y - 150 
	
	for (var op = 0; op < option_number; op++)
	{
		var tma_text = string_length(option[op]) / 4
		
		// tamanho da caixa de texto das perguntas
		tma_text = clamp(tma_text,1.16,5.5)
		
		//desenhando as caixas de opções
		var _op_largura = string_width(option[op]) + _op_borda*2
		draw_sprite_ext(sprite_caixa2, imag_frames, text_box_x_op + 3 , (text_box_y_op - _op_space*option_number + _op_space*op) + 5, tma_text * 3, 1.5, 0, c_white,alpha_text)

		//opção selecionada seta
		if (option_pos = op)
		{
			draw_sprite_ext(spr_TEXT_BOX_seta,0,text_box_x_op  - 200,text_box_y_op - _op_space*option_number + _op_space*op,4,4	,0,c_white,1)
		}

		
		//desenhando o texto
		draw_set_alpha(alpha_text)
		draw_set_font(fon_game)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_set_color(c_white)
		draw_text_transformed(text_box_x_op , text_box_y_op - _op_space*option_number + _op_space*op + 8 , option[op], 1.5  , 1.5 , 0)
	}
	
}



// ------------------------- desenhando O TEXTO ------------------------- \\
#region

draw_set_font(fon_game)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_set_alpha(alpha_text)

var _draw_text = string_copy(text[pagina], 1, caracter_atual)
draw_text_ext_transformed(text_box_x + borda, text_box_y + borda, _draw_text, pulo_linha, linha_largura,1 ,1 ,0)


#endregion