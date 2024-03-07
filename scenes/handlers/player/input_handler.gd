class_name InputHandler
extends Node2D


func movement_input()-> Vector2:
	var movement_direction : Vector2 = Vector2.ZERO
	movement_direction.y = Input.get_axis("up", "down")
	return movement_direction
