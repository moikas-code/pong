class_name Physics
extends Node2D
 
#region World Variables
@export_category("World Variables")
@export var gravity:float = 600.0
#endregions

func apply_gravity(character_body:CharacterBody2D,delta:float)->void:
	if character_body == null:
		return 
		
	if not character_body.is_on_floor():
		character_body.velocity.y += gravity * delta
