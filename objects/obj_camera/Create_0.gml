camera = view_camera[0]

tamanhox = 512
tamanhoy = 288

shake_force = 0
shake_time = 0

boss_die = false

delay_zoom = 0

cam_x = camera_get_view_x(camera)
cam_y = camera_get_view_y(camera)

if (alvo != noone && room != rm_negociacao) camera_set_view_pos(camera,alvo.x - tamanhox/2 ,alvo.y - tamanhoy/2)