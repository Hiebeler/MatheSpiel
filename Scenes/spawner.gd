extends Node

class_name Spawner

var slot_scene = preload("res://slot.tscn")
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(spawn_slot)
	start_spawning_slots()
	
func spawn_slot():
	var slot = slot_scene.instantiate() as Slot
	add_child(slot)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	
	var half_height = viewport_rect.size.y / 2
	slot.position.x = viewport_rect.end.x / 2
	slot.position.y = viewport_rect.end.y * 0.15 - half_height

func start_spawning_slots():
	timer.start()
