extends Node3D
#
# @onready var cursor_sprite = $CursorSprite2D  # Path to the 2D cursor sprite
# @onready var flashlight_sprite = $Sprite3D  # Path to the 3D flashlight sprite
# @onready var flashlight_light = $SpotLight3D  # Path to the spotlight node (flashlight light)
#
# func _process(delta):
#   
#     var mouse_pos = get_viewport().get_mouse_position()  
#     
#   
#     cursor_sprite.position = mouse_pos  
# 
#    
#     var camera = get_viewport().get_camera_3d()  
#     
#     if camera:
#        
#         var ray_origin = camera.project_ray_origin(mouse_pos)  
#         
#        
#         var ray_direction = camera.project_ray_normal(mouse_pos)  
# 
#        
#         var intersection_point = ray_origin + ray_direction * (flashlight_light.global_position.y - ray_origin.y) / ray_direction.y  
#         
#       
#         var direction = intersection_point - flashlight_sprite.global_position  
# 
#        
#         var angle_y = direction.angle_to(Vector3.FORWARD)  
# 
#        
#         flashlight_sprite.rotation_degrees.y = angle_y  
# 
#       
#         flashlight_light.global_position = intersection_point  
