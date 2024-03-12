class_name MovementHandler
extends Node2D

@export var movement_speed:float = 0.0
@export var acceleration:float = 0.0
@export var deceleration:float = 0.0

func movement_handler(character_body:CharacterBody2D, input_dir:Vector2,_delta:float):
	if input_dir.y<0:
		character_body.velocity.y = lerp(character_body.velocity.y,  -movement_speed,acceleration * _delta)
		
		
	if input_dir.y>0:
		character_body.velocity.y = lerp(character_body.velocity.y,  movement_speed,acceleration * _delta)
		
		
	deceleration_handler(character_body,_delta)

func deceleration_handler(character_body:CharacterBody2D,_delta:float) -> void:
	character_body.velocity.y = lerp(character_body.velocity.y, 0.0,deceleration * _delta)
		
