draw_set_alpha(1)

var widt = surface_get_width(application_surface)
var heig = surface_get_height(application_surface)

if (!surface_exists(surf_light))
{
    surf_light = surface_create(widt, heig, surface_rgba16float)
}
else
{
    if (surface_get_width(surf_light) != widt || surface_get_height(surf_light) != heig)
    {
        surface_resize(surf_light, widt, heig)
    }
}

surface_set_target(surf_light)

	draw_clear(luz_atual)
	
	camera_apply(view_camera[0])
	
	gpu_set_blendmode(bm_add)
	
	// desenhando as luzes
	
		with (obj_light)
		{
			var _int = floor(image_alpha)
			repeat(_int)
			{
				draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,1)
			}
			var _frac = frac(image_alpha)
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,_frac)
		}
	
	gpu_set_blendmode(bm_normal)
	

surface_reset_target()



