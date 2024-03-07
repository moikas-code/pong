extends Node2D
class_name Main
@onready var player = $AudioStreamPlayer2D

func _ready():
	player.connect("finished", Callable(self,"_on_loop_sound").bind(player))
	player.play()	

func _on_loop_sound():
	player.stream_paused = false
	player.play()	
