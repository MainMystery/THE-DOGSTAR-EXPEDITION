camera = view_camera[0]

tamanhox = 1280
tamanhoy = 720

image_speed = 0
image_index = 0

texto_num = 1

texto = ""

escuro = 0

texto_velocidade = 1

texto_caracteres = 0

texto_timer = 0
texto_delay = 2

camera_set_view_pos(camera,0 ,0)
camera_set_view_size(camera,tamanhox,tamanhoy)

if (room = rm_cutsene) sprite_index = spr_cutsene
if (room = rm_final) sprite_index = spr_cutsene_2