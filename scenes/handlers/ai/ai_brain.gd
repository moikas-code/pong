class_name AIBrain
extends Node2D

@export var floor_check_left:RayCast2D = null
@export var floor_check_right:RayCast2D = null
@export var wall_check_left:RayCast2D = null
@export var wall_check_right:RayCast2D = null
@export var movement_handler:MovementHandler = null

# Entity State
enum {
	MOVE_LEFT,MOVE_RIGHT,WANDER,AGGROED,PASSIVE
}

var ai_state = MOVE_LEFT

func handle_state(character_body:CharacterBody2D,delta:float)->void:
	check_state()
	match ai_state:
		MOVE_LEFT:
			movement_handler.movement_handler(character_body,Vector2.LEFT,delta)
		MOVE_RIGHT:
			movement_handler.movement_handler(character_body,Vector2.RIGHT,delta)
		WANDER:
			pass

func check_state():
	if floor_check_left.is_colliding() == false or wall_check_left.is_colliding():
		ai_state = MOVE_RIGHT
	if floor_check_right.is_colliding() ==false or wall_check_right.is_colliding():
		ai_state  = MOVE_LEFT
