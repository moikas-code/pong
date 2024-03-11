extends Node2D
class_name BallManager


@export var spawn_point : Marker2D = null
@export var ball_scene : PackedScene = null
var ball_node = null
var spawned:bool = false

func _ready():
	SignalBus.on_ball_enter_score_zone.connect(ball_despawn)
	
func _process(_delta):
	if spawned == false:
		spawn_ball()
	else:
		pass
		
func spawn_ball():
	var new_ball = ball_scene.instantiate();
	var entity_container:Node2D = NodeExtensions.get_entity_container()
	
	#print(entity_container)
	if entity_container == null:
		return
		
	entity_container.add_child(new_ball)
	new_ball.position = spawn_point.position
	spawned = true

func ball_despawn():
	spawned = false
