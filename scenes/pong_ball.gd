extends ObjectEntity2D
class_name PongBall

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var bounce = $Bounce


var direction_x = [360]
var direction_y = [31.415, -31.415]


func _ready():
	super._ready()
	bounce.on_bounce.connect(on_bounce)
	var vector = {
		'x':direction_x.pick_random(),
		'y':direction_y.pick_random()
	}
	
	set_velocity(Vector2(vector.x,vector.y))
	print(entity_type)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	velocity = bounce.bounce(collision_info, velocity, delta)

func on_bounce():
	audio_stream_player_2d.play()
