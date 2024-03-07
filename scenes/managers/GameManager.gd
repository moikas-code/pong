extends Node2D
class_name GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_game_manager_end.connect(on_game_end)

func on_game_end(value) ->void:
	match value:
		"WIN":
			get_tree().change_scene_to_packed(preload("res://scenes/levels/win.tscn"))
		"LOSE":
			get_tree().change_scene_to_packed(preload("res://scenes/levels/lose.tscn"))
