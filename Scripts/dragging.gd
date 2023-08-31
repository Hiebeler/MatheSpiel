extends CharacterBody2D

var mousepositoion

func _physics_process(delta):
	var target_position = get_global_mouse_position()

		# Calculate the motion vector to the target
	var motion = target_position - global_position

	# Perform collision check and update position
	var result = move_and_collide(motion)
	if result != null:
		global_position = result.position
		print("collision");
