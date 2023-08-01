extends Node2D

class_name Slot

var speed = 100

@onready var label = $Label
@onready var sprite_2d = $Area2D/Sprite2D
@onready var area_2d = $Area2D
@onready var area_2d_2 = $Area2D2

@onready var label_2 = $Label2
@onready var label_3 = $Label3
@onready var label_4 = $Label4


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y

	var scale = viewportWidth / sprite_2d.texture.get_size().x / 3
	area_2d.set_scale(Vector2(scale, 2))
	area_2d.position.x = -viewportWidth / 3
	label_2.position.x = -viewportWidth / 3
	label_3.position.x = 0
	label_4.position.x = viewportWidth / 3
	
	area_2d_2.set_scale(Vector2(scale, 2))
	area_2d_2.position.x = 0

func set_label_number(new_label):
	label.text = new_label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
