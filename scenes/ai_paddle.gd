extends CharacterEntity2D
class_name AIPaddle

@onready var input_handler = $InputHandler
@onready var movement_handler = $MovementHandler
@onready var ball = get_tree().get_first_node_in_group('ball')
@export_range(600,800) var aggro_range = 750
	
func _physics_process(delta):
	
	if ball == null:
		ball = get_tree().get_first_node_in_group('ball')
	else:
		if ball.global_position.x < aggro_range:
			return
		movement_handler.movement_handler(self, ball.global_position - global_position, delta)
		move_and_slide()
