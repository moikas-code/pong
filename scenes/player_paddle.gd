extends CharacterBody2D
class_name Player

@onready var player_paddle = $"."
@onready var input_handler = $InputHandler
@onready var movement_handler = $MovementHandler


func _physics_process(delta):
	movement_handler.movement_handler(self,input_handler.movement_input(),delta)
	move_and_slide()
