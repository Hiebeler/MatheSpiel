extends Node2D

var is_dragging = false
var touchpos = 0
@onready var sprite_2d = $Sprite2D

func _unhandled_input(event):
	var local_event = make_input_local(event)
	
	if local_event is InputEventScreenTouch:
		if local_event.is_pressed():
			is_dragging=true
		else:
			is_dragging=false
		
	if is_dragging:
		touchpos = local_event.position
		sprite_2d.global_position = touchpos

