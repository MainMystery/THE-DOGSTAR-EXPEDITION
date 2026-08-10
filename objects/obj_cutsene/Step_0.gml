camera_set_view_pos(camera,0 ,0)
camera_set_view_size(camera,tamanhox,tamanhoy)

if (room = rm_cutsene)
{
	if (texto_num < 7)
	{
		if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any))
		{
			if (texto_caracteres >= string_length(texto))
			{
				texto_num += 1
				texto_caracteres = 0
				texto_timer = 0
			}
			else if (texto_caracteres < string_length(texto)) texto_caracteres = string_length(texto)
		
		}
	}
	
	if (texto_num = 1)
	{
		image_index = 0
		texto = "Planeta Terra, ano de 2087. A tecnologia evoluiu drasticamente ao longo dos anos, fazendo com que os humanos não tivessem mais a necessidade de trabalhar ou realizar tarefas. Alguns também se transformaram em ciborgues. O planeta está MUITO poluído, mas eles continuam sem fazer nada."
	}
	if (texto_num = 2)
	{
		image_index = 1
		texto = "Junto com essa alta tecnologia, os seres vivos do planeta também evoluíram, fazendo com que animais domésticos e outras criaturas conseguissem aprender coisas que antes achávamos impossíveis."
	}
	if (texto_num = 3)
	{
		image_index = 2
		texto = "Mas os humanos não queriam mais ter o trabalho de cuidar dos animais domésticos, então acabaram deixando-os de lado. Porém, graças à nova inteligência desses animais..." 
	}
	if (texto_num = 4)
	{
		image_index = 3
		texto = "Eles decidiram pegar uma nave espacial chamada 'Dogstar' e abandonar a Terra, vagando pelo espaço sem fim."
	}
	if (texto_num = 5)
	{
		image_index = 4
		texto = "Agora VOCÊ deve comandar essa missão com suas escolhas, decidindo se vai se aliar aos planetas ou dominá-los por completo. Suas decisões importam e mudarão o seu destino."
	}
	if (texto_num = 6)
	{
		image_index = 4
		texto = "agora VOCÊ deve comandar essa missão com suas escolhas, decidindo se vai se aliar aos planetas, ou dominar eles por completo, suas decisões importam e mudaram seu destino"
	}
	if (texto_num >= 7)
	{
		texto = ""
		escuro = lerp(escuro,1,0.1)
		
		if (escuro >= 1) room_goto(rm_tutorial)
	}
	
	
	// Máquina de escrever
	if (texto_caracteres < string_length(texto)) texto_timer += 1 
	
	if (texto_timer >= texto_delay) 
	{ 
		texto_timer = 0 
		
		if (texto_caracteres < string_length(texto)) 
		{ 
			texto_caracteres += texto_velocidade 
		} 
	}
	
}
else
{
	if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any))
	{
		if (texto_caracteres >= string_length(texto))
		{
			if (texto_num = 2) game_end()
			texto_num += 1
			texto_caracteres = 0
			texto_timer = 0
		}
		else if (texto_caracteres < string_length(texto)) texto_caracteres = string_length(texto)
		
	}
	
	if (texto_num = 1)
	{
	if (global.karma <= 0)
	{
	    image_index = 1
	    texto = "Os cachorros foram muito bons com todos, ajudando e espalhando sua espécie pelos planetas, fazendo ótimas alianças e conquistando muitos amigos."
	}
	else if (global.karma > 0)
	{
	    image_index = 0
	    texto = "Os cachorros dominaram TODO ESTE SISTEMA SOLAR. Não sobrou nada para nenhum dos planetas. Agora, tudo é DELES."
	}
	}
	else
	{
		texto = "FIM"
	}
	
	// Máquina de escrever
	if (texto_caracteres < string_length(texto)) texto_timer += 1 
	
	if (texto_timer >= texto_delay) 
	{ 
		texto_timer = 0 
		
		if (texto_caracteres < string_length(texto)) 
		{ 
			texto_caracteres += texto_velocidade 
		} 
	}
	
}