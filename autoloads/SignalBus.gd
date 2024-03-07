extends Node

signal on_player_ready(player:Player)
signal on_player_scored
signal on_ai_scored
signal on_game_manager_ready(GSM:GameManager)
signal on_game_manager_end(value:String)
signal on_ball_enter_score_zone


func emit_on_ball_enter_score_zone()->void:
	on_ball_enter_score_zone.emit()

func emit_on_game_manager_ready(GSM:GameManager) -> void:
	on_game_manager_ready.emit(GSM)

func emit_on_game_manager_end(value:String) -> void:
	on_game_manager_end.emit(value)
	
func emit_on_ai_scored()->void:
	on_ai_scored.emit()

func emit_on_player_scored()->void:
	on_player_scored.emit()

func emit_on_player_ready(player:Player)->void:
	on_player_ready.emit(player)

