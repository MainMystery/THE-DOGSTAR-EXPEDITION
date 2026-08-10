shader_set(sh_brilho)

var uni = shader_get_uniform(sh_brilho, "u_brilho")
shader_set_uniform_f(uni, brilho)

draw_sprite_ext(spr_espinossauro_perna,image_index,quadril1_x,quadril1_y,image_xscale,image_yscale,point_direction(quadril1_x,quadril1_y,joelho1_x,joelho1_y),c_white,1)

draw_sprite_ext(spr_espinossauro_coxa,image_index + 1,joelho1_x,joelho1_y,image_yscale,image_xscale,point_direction(joelho1_x,joelho1_y,pe1_x,pe1_y) - 25,c_white,1)

draw_sprite_ext(spr_espinossauro_pe,image_index + 2,pe1_x,pe1_y,image_xscale,image_yscale,0,c_white,1)


draw_self()


draw_sprite_ext(spr_espinossauro_perna,image_index - 1,quadril2_x,quadril2_y,image_xscale,image_yscale,point_direction(quadril2_x,quadril2_y,joelho2_x,joelho2_y),c_white,1)

draw_sprite_ext(spr_espinossauro_coxa,image_index,joelho2_x,joelho2_y,image_yscale,image_xscale,point_direction(joelho2_x,joelho2_y,pe2_x,pe2_y) - 25,c_white,1)

draw_sprite_ext(spr_espinossauro_pe,image_index,pe2_x,pe2_y,image_xscale,image_yscale,0,c_white,1)

shader_reset()
