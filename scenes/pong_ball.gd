extends CharacterBody2D
class_name PongBall

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var _bounce:Bounce = $Bounce

var direction_x = [360]
var direction_y = [31.415, -31.415]


func _ready():
	#direction.shuffle()
	var vector = {
		'x':direction_x.pick_random(),
		'y':direction_y.pick_random()
	}
	
	set_velocity(Vector2(vector.x,vector.y))

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		audio_stream_player_2d.play()
		velocity = _bounce.bounce(collision_info, velocity)
		if velocity.x < 200 and velocity.x > -200:
			velocity.x *= 1.25
		if velocity.y < 200 and velocity.y > -200:
			velocity.y *= 1.25

