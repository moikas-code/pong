extends Control
class_name WinLose

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/start_button
@onready var menu = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Menu



# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.pressed.connect(_start_game)
	start_button.pressed.connect(_to_menu)

func _start_game():
	get_tree().change_scene_to_packed(preload('res://scenes/levels/main.tscn'))

func _to_menu():
	get_tree().change_scene_to_packed(preload('res://scenes/levels/menu.tscn'))
