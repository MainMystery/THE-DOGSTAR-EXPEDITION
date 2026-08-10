/// @param o texto
function scr_game_text(_text_id)
{
	switch (_text_id)
	{
		// ------------------------------------------------
		
		#region /cavernas
		case "planet1 - sold":

		    scr_voice(noone)

		    scr_text("uga uga, mim ver vocês, muita gente")
		    scr_text("vocês entrar nossa caverna por quê?")
		    scr_options("viemos dominar","planet1 - yes")
		    scr_options("queremos paz","planet1 - no")

		break

		case "planet1 - norm":

		    scr_voice(noone)

		    scr_text("uga uga, quem ser vocês?")
		    scr_text("o que fazer dentro nossa caverna?")

		    scr_options("viemos dominar","planet1 - yes")
		    scr_options("queremos paz","planet1 - no")

		break

		case "planet1 - yes":

		    scr_voice(noone)

		    scr_text("uhh uhh, vocês mal")
		    scr_text("briga vai ter, nós proteger nossa caverna")

		    scr_next_text("planet1 - war2")

		break

		case "planet1 - no":

		    scr_voice(noone)

		    scr_text("uhh uhh, vocês trazer recursos pra gente?")
		    scr_next_text("planet1 - no2")

		break

		case "planet1 - no2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.comprar = true

		break

		case "planet1 - no3":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.negado = true

		break

		case "planet1 - yes2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.boss = true

		break

		case "planet1 - war2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.guerra = true

		break

		case "planet1 - no_money":

		    scr_voice(noone)

		    scr_text("vocês não ter recurso suficiente, sair nossa caverna agora!")

		    scr_next_text("planet1 - no3")

		break

		case "planet1 - money":

		    scr_voice(noone)

		    scr_text("oba oba oba, recursos pra gente! vocês bem vindos nossa caverna")
		    scr_text("gente querer retribuir vocês, mas problema grande")
		    scr_text("dinossauro entrou caverna e pegou todos nossos recursos")
		    scr_text("derrotar ele você vai, recompensa grande te dar")

		    scr_next_text("planet1 - yes2")

		break

		case "planet1 - war":

		    scr_voice(noone)

		    scr_text("oba oba oba, recursos pra gente, vocês bem vindos nossa caverna")
		    scr_text("agora nós família, ajuda gente com problema?")
		    scr_text("recompensa grande te dar")

		    scr_next_text("planet1 - war2")

		break


		#endregion
		
		// ------------------------------------------------

		#region Povo Medieval

		case "planet2 - sold":

		    scr_voice(noone)

		    scr_text("Ora, vejam só... estrangeiros em nossas terras.")
		    scr_text("Digam logo o que desejam antes que percamos nosso tempo.")
		    scr_options("viemos dominar","planet2 - yes")
		    scr_options("queremos paz","planet2 - no")

		break


		case "planet2 - norm":

		    scr_voice(noone)

		    scr_text("Quem sois vós para adentrar nosso território?")
		    scr_text("Espero que tenham uma boa razão para estar aqui.")

		    scr_options("viemos dominar","planet2 - yes")
		    scr_options("queremos paz","planet2 - no")

		break


		case "planet2 - yes":

		    scr_voice(noone)

		    scr_text("Dominar nossas terras? Que ousadia desprezível.")
		    scr_text("Ergam suas armas, então. Vossa derrota será inevitável.")

		    scr_next_text("planet2 - war2")

		break


		case "planet2 - no":

		    scr_voice(noone)

		    scr_text("Paz, dizem eles... e o que tendes a oferecer em troca?")
		    scr_next_text("planet2 - no2")

		break


		case "planet2 - no2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.comprar = true

		break


		case "planet2 - no3":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.negado = true

		break


		case "planet2 - yes2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.boss = true

		break


		case "planet2 - war2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.guerra = true

		break


		case "planet2 - no_money":

		    scr_voice(noone)

		    scr_text("Não possuís recursos suficientes para negociar conosco.")
		    scr_text("Partam imediatamente de nossas terras.")

		    scr_next_text("planet2 - no3")

		break


		case "planet2 - money":

		    scr_voice(noone)

		    scr_text("Muito bem. Finalmente, uma oferta digna de nossa atenção.")
		    scr_text("Aceitaremos vossos recursos e permitiremos vossa permanência.")
		    scr_text("Contudo, temos um problema que exige vossa ajuda.")
		    scr_text("Uma terrível criatura tomou nossos recursos e se esconde em nossas terras.")
		    scr_text("Derrotai a criatura e sereis generosamente recompensados.")

		    scr_next_text("planet2 - yes2")

		break


		case "planet2 - war":

		    scr_voice(noone)

		    scr_text("Muito bem. Vossa oferta foi aceita.")
		    scr_text("A partir de agora, consideraremos vossa presença tolerável.")
		    scr_text("Há, porém, um problema que exige vossa ajuda.")
		    scr_text("Resolva-o e sereis devidamente recompensados.")

		    scr_next_text("planet2 - war2")

		break

		#endregion
		
		// ------------------------------------------------
		
		#region Povo Robótico

		case "planet3 - sold":

		    scr_voice(noone)

		    scr_text("UNIDADE DESCONHECIDA DETECTADA.")
		    scr_text("Identificação necessária. Declare suas intenções imediatamente.")
		    scr_options("viemos dominar","planet3 - yes")
		    scr_options("queremos paz","planet3 - no")

		break


		case "planet3 - norm":

		    scr_voice(noone)

		    scr_text("Analisando presença orgânica...")
		    scr_text("Resultado: múltiplas unidades desconhecidas. Qual o objetivo desta incursão?")

		    scr_options("viemos dominar","planet3 - yes")
		    scr_options("queremos paz","planet3 - no")

		break


		case "planet3 - yes":

		    scr_voice(noone)

		    scr_text("AVISO. Declaração de hostilidade confirmada.")
		    scr_text("Protocolo de defesa ativado. Neutralização das unidades invasoras autorizada.")

		    scr_next_text("planet3 - war2")

		break


		case "planet3 - no":

		    scr_voice(noone)

		    scr_text("Proposta de paz recebida.")
		    scr_text("Para prosseguir, apresente recursos ou informações de valor equivalente.")

		    scr_next_text("planet3 - no2")

		break


		case "planet3 - no2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.comprar = true

		break


		case "planet3 - no3":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.negado = true

		break


		case "planet3 - yes2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.boss = true

		break


		case "planet3 - war2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.guerra = true

		break


		case "planet3 - no_money":

		    scr_voice(noone)

		    scr_text("RECURSOS INSUFICIENTES.")
		    scr_text("Sua oferta não atende aos requisitos mínimos de negociação.")
		    scr_text("Retire-se imediatamente ou será considerado uma ameaça.")

		    scr_next_text("planet3 - no3")

		break


		case "planet3 - money":

		    scr_voice(noone)

		    scr_text("Oferta recebida. Quantidade de recursos: SATISFATÓRIA.")
		    scr_text("Negociação aprovada. Sua presença não será considerada uma ameaça.")
		    scr_text("Entretanto, uma anomalia compromete nossa operação.")
		    scr_text("Uma criatura desconhecida invadiu nosso setor de armazenamento.")
		    scr_text("Ela está utilizando nossos recursos para fins não autorizados.")
		    scr_text("Elimine a ameaça. A recompensa será proporcional ao serviço prestado.")

		    scr_next_text("planet3 - yes2")

		break


		case "planet3 - war":

		    scr_voice(noone)

		    scr_text("Recursos recebidos. Acordo temporário estabelecido.")
		    scr_text("Sua unidade será classificada como ALIADA.")
		    scr_text("Contudo, um problema requer intervenção imediata.")
		    scr_text("Elimine a ameaça e sua contribuição será devidamente registrada.")
    
		    scr_next_text("planet3 - war2")

		break

		#endregion

		// ------------------------------------------------
		
		#region Povo Golem

		case "planet4 - sold":

		    scr_voice(noone)

		    scr_text("Uga... quem são vocês?")
		    scr_text("Vocês entrar terra dos golem... não pode.")
		    scr_options("viemos dominar","planet4 - yes")
		    scr_options("queremos paz","planet4 - no")

		break


		case "planet4 - norm":

		    scr_voice(noone)

		    scr_text("Uga uga... vocês não ser pedra.")
		    scr_text("O que vocês querer aqui?")

		    scr_options("viemos dominar","planet4 - yes")
		    scr_options("queremos paz","planet4 - no")

		break


		case "planet4 - yes":

		    scr_voice(noone)

		    scr_text("Dominar?! Vocês muito loucos!")
		    scr_text("Nós ser pedra forte! Nós esmagar vocês!")

		    scr_next_text("planet4 - war2")

		break


		case "planet4 - no":

		    scr_voice(noone)

		    scr_text("Paz... bom. Paz é bom.")
		    scr_text("Mas vocês trazer coisa para nós? Nós não ter muito recurso.")

		    scr_next_text("planet4 - no2")

		break


		case "planet4 - no2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.comprar = true

		break


		case "planet4 - no3":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.negado = true

		break


		case "planet4 - yes2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.boss = true

		break


		case "planet4 - war2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.guerra = true

		break


		case "planet4 - no_money":

		    scr_voice(noone)

		    scr_text("Vocês não ter recurso...")
		    scr_text("Então não ter acordo. Vai embora agora.")

		    scr_next_text("planet4 - no3")

		break


		case "planet4 - money":

		    scr_voice(noone)

		    scr_text("OOOH! Vocês trazer recurso!")
		    scr_text("Nós gostar de vocês! Vocês ser bons!")
		    scr_text("Mas... tem problema grande.")
		    scr_text("A criatura pegou tudo...")
		    scr_text("Ela pegou comida, pedra, metal... tudo!")
		    scr_text("Nós ter medo dela. Muito medo.")
		    scr_text("Nós não conseguir lutar contra ela.")
		    scr_text("Vocês matar criatura? Nós dar tudo que ela pegou!")

		    scr_next_text("planet4 - yes2")

		break


		case "planet4 - war":

		    scr_voice(noone)

		    scr_text("Vocês ajudar nós? Bom! Muito bom!")
		    scr_text("A criatura está com todos nossos recursos.")
		    scr_text("Ela ser muito grande... muito forte...")
		    scr_text("Nós tentar lutar, mas nós correr.")
		    scr_text("Se vocês matar ela, recursos ser de vocês também.")

		    scr_next_text("planet4 - war2")

		break

		#endregion

		// ------------------------------------------------
		
		#region Povo da Raposa Cósmica

		case "planet5 - sold":

		    scr_voice(noone)

		    scr_text("Silêncio... viajantes das estrelas.")
		    scr_text("Os dois anéis observam vocês... o azul e o vermelho.")
		    scr_options("viemos dominar","planet5 - yes")
		    scr_options("queremos paz","planet5 - no")

		break


		case "planet5 - norm":

		    scr_voice(noone)

		    scr_text("Estranhos... vocês chegaram até nosso mundo.")
		    scr_text("Talvez a Raposa Cósmica tenha guiado seus passos até nós.")

		    scr_options("viemos dominar","planet5 - yes")
		    scr_options("queremos paz","planet5 - no")

		break


		case "planet5 - yes":

		    scr_voice(noone)

		    scr_text("Dominar nosso mundo?!")
		    scr_text("A Raposa Cósmica não permitirá tamanho desrespeito!")

		    scr_next_text("planet5 - war2")

		break


		case "planet5 - no":

		    scr_voice(noone)

		    scr_text("Então vocês procuram a paz...")
		    scr_text("Talvez seja vontade da Raposa que nossos caminhos se encontrem.")
		    scr_text("Mas primeiro... devemos descobrir se vocês são dignos.")

		    scr_next_text("planet5 - no2")

		break


		case "planet5 - no2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.comprar = true

		break


		case "planet5 - no3":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.negado = true

		break


		case "planet5 - yes2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.boss = true

		break


		case "planet5 - war2":

		    instance_destroy(obj_caixa_texto)

		    obj_status_alianca.guerra = true

		break


		case "planet5 - no_money":

		    scr_voice(noone)

		    scr_text("Vocês não possuem recursos suficientes.")
		    scr_text("A Raposa ainda não vê valor em sua oferta.")
		    scr_text("Voltem quando estiverem preparados.")

		    scr_next_text("planet5 - no3")

		break


		case "planet5 - money":

		    scr_voice(noone)

		    scr_text("Os recursos foram entregues...")
		    scr_text("Talvez este seja um sinal da Raposa Cósmica.")
		    scr_text("Mas recursos não são suficientes para conquistar sua bênção.")
		    scr_text("A Raposa deseja saber se vocês são realmente dignos de nossa aliança.")
		    scr_text("Ela observa este mundo através dos dois grandes anéis.")
		    scr_text("O anel azul... e o anel vermelho.")
		    scr_text("Se desejam nossa aliança, deverão provar seu valor.")
		    scr_text("Cumpram o desejo da Raposa Cósmica e então saberemos a resposta.")

		    scr_next_text("planet5 - yes2")

		break


		case "planet5 - war":

		    scr_voice(noone)

		    scr_text("A Raposa Cósmica ouviu suas palavras.")
		    scr_text("Talvez nossos povos possam caminhar juntos.")
		    scr_text("Mas a Raposa não entrega sua bênção tão facilmente.")
		    scr_text("Ela deseja testar vocês.")
		    scr_text("Provem que são dignos de nossa aliança.")
		    scr_text("Quando a prova terminar... saberemos o que a Raposa decidiu.")

		    scr_next_text("planet5 - war2")

		break

		#endregion

		// ------------------------------------------------
		
	}
}