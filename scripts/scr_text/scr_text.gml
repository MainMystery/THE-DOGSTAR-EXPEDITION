/// @param text
function scr_text(_text)
{
	text[numero_paginas] = _text
	
	numero_paginas += 1
}

/// @param VOZ
function scr_voice(_voice)
{
	voz = _voice
}

function scr_next_text(_proximo)
{
    proximo_texto = _proximo
}

/// @param option
/// @param link_id
function scr_options(_option, _link_id)
{
	option[option_number] = _option
	option_link_id[option_number] = _link_id
	
	option_number += 1
}

/// @param text_id
function create_textbox(_text_id)
{
	with ( instance_create_depth(0,0,-9999,obj_caixa_texto))
	{
		scr_game_text(_text_id)
	}
}