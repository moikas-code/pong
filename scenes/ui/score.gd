extends Control
class_name Score_UI
@onready var player_score = $MarginContainer/VBoxContainer/HBoxContainer/player_score
@onready var ai_score = $MarginContainer/VBoxContainer/HBoxContainer/ai_score

var max_score:int = 0;
var player_score_label:int =  0;
var ai_score_label:int =  0;
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.on_player_scored.connect(on_player_scored)
	SignalBus.on_ai_scored.connect(on_ai_scored)
	var game_manager:GameManager = get_tree().get_first_node_in_group('game_manager')
	if game_manager == null:
		return
	max_score = game_manager.max_score

func on_player_scored():
	player_score_label += 1
	player_score.text = str(player_score_label)
	if player_score_label == max_score:
		SignalBus.emit_on_game_manager_end("WIN")
	
func on_ai_scored():
	ai_score_label += 1
	ai_score.text = str(ai_score_label)
	if ai_score_label == max_score:
		SignalBus.emit_on_game_manager_end("LOSE")
