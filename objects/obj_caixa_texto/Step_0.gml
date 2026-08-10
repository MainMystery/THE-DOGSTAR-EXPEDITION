alpha_text = lerp(alpha_text,1,0.05)

textBox_largura = lerp(textBox_largura,800,0.1)
textBox_altura = lerp(textBox_altura,280,0.1)


if (delay > 0 && caracter_atual >= texto_comprimento[pagina]) delay -= 1

if (voz != noone)
{
	if (caracter_atual < texto_comprimento[pagina])
	{
		if (caracter_atual != " " && caracter_atual != ".")
		{
			audio_play_sound(voz,0,0,1,0,random_range(1,1.4))
		}
	}
}

