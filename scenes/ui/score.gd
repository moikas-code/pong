extends Control
class_name Score_UI
@onready var player_score = $MarginContainer/VBoxContainer/HBoxContainer/player_score
@onready var ai_score = $MarginContainer/VBoxContainer/HBoxContainer/ai_score
@export var max_score:int = 21

var player_score_label:int =  0;
var ai_score_label:int =  0;
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_player_scored.connect(on_player_scored)
	SignalBus.on_ai_scored.connect(on_ai_scored)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_player_scored():
	player_score_label += 1
	player_score.text = str(player_score_label)
	if player_score_label == max_score:
		print(player_score_label)
		SignalBus.emit_on_game_manager_end("WIN")
	
func on_ai_scored():
	ai_score_label += 1
	ai_score.text = str(ai_score_label)
	print(ai_score_label,max_score)
	if ai_score_label == max_score:
		print(ai_score_label)
		SignalBus.emit_on_game_manager_end("LOSE")
