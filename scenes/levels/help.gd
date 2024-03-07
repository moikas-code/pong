extends Control
class_name Help

@onready var menu_button = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/menu_button



# Called when the node enters the scene tree for the first time.
func _ready():
	menu_button.pressed.connect(_on_press)

func _on_press():
	get_tree().change_scene_to_packed(preload('res://scenes/levels/menu.tscn'))
