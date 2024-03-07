extends Area2D
class_name ScoreZone

@export_enum("Player","Enemy") var zone_type = "Player"
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _on_body_entered(body):
	if body == null:
		return

	if body.is_in_group("ball"):
		match zone_type:
			"Player":
				SignalBus.emit_on_player_scored()
			"Enemy":
				SignalBus.emit_on_ai_scored()
		SignalBus.emit_on_ball_enter_score_zone()
		body.queue_free()
		audio_stream_player_2d.play()
