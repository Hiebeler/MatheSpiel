extends Node2D

class_name Slot

var speed = 100

@onready var calculations_label = $Calculation
@onready var sprite_2d = $Answer1Area/Sprite2D
@onready var answer1_2d = $Answer1Area
@onready var answer2_2d = $Answer2Area
@onready var answer3_2d = $Answer3Area

@onready var answer_1_label = $Answer1
@onready var answer_2_label = $Answer2
@onready var answer_3_label = $Answer3

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y

	var scale = viewportWidth / sprite_2d.texture.get_size().x / 3
	answer1_2d.set_scale(Vector2(scale, 2))
	answer1_2d.position.x = -viewportWidth / 3
	answer_1_label.position.x = -viewportWidth / 3
	answer_2_label.position.x = 0
	answer_3_label.position.x = viewportWidth / 3
	
	answer2_2d.set_scale(Vector2(scale, 2))
	answer2_2d.position.x = 0
	
	answer3_2d.set_scale(Vector2(scale, 2))
	answer3_2d.position.x = viewportWidth / 3

func set_calculations_label_number(new_label):
	calculations_label.text = new_label

func set_answers(answer1, answer2, answer3, trueAnswer):
	answer_1_label.text = str(answer1)
	answer_2_label.text = str(answer2)
	answer_3_label.text = str(answer3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
