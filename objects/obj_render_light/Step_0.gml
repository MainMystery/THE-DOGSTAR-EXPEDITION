// Se a cor desejada mudou
if (ambient_light_next_color != ambient_light)
{
    // Começa uma nova transição
    lep = 0

    // Guarda qual é a nova cor que queremos alcançar
    ambient_light = ambient_light_next_color
}


// Aumenta o progresso da transição
lep = lerp(lep, 1, 0.01)


// Mistura a cor atual com a cor desejada
luz_atual = merge_color(luz_atual,ambient_light,lep)