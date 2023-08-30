extends Node

class_name Spawner

var slot_scene = preload("res://Scenes/slot.tscn")
@onready var timer = $Timer

var current_number = 3

var max_step = 10

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
	
	var new_calc = get_next_number()
	slot.set_calculations_label_number(new_calc.calc)
	
	set_results(new_calc.result, slot)

func set_results(result, slot):
	match randi_range(1,3):
		1:
			slot.set_answers(result, randi_range(0,100), randi_range(0,100), 1)
		2:
			slot.set_answers(result, randi_range(0,100), randi_range(0,100), 1)
		3:
			slot.set_answers(result, randi_range(0,100), randi_range(0,100), 1)

func start_spawning_slots():
	timer.start()


func get_next_number():
	
	var calc = ""
	var result = 0
	
	if (randi_range(0, 100) > current_number):
		# PLUS
		var range = 100 - current_number
		var summand = randi_range(0, min(range, max_step))
		result = current_number + summand
		current_number = result
		calc = "+" + str(summand)
		
	else:
		# MINUS
		var range = current_number
		var summand = randi_range(0, min(range, max_step))
		result = current_number - summand
		current_number = result
		calc = "-" + str(summand)
		
		max_step = max_step + 1
	return { "calc": calc, "result": result}
