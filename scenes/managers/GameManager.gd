extends GameCore
class_name GameManager

@export var max_score:int = 21

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_game_manager_end.connect(on_game_over)

func on_game_over(menu) ->void:
	match menu:
		"WIN":
			get_tree().change_scene_to_packed(preload("res://scenes/levels/win.tscn"))
		"LOSE":
			get_tree().change_scene_to_packed(preload("res://scenes/levels/lose.tscn"))
