extends Control
class_name MainMenu

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/start_button
@onready var help = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Help



# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.pressed.connect(_start_game)
	help.pressed.connect(_help_menu)

func _start_game():
	get_tree().change_scene_to_packed(load('res://scenes/levels/main.tscn'))

func _help_menu():
	get_tree().change_scene_to_packed(load('res://scenes/levels/help.tscn'))
