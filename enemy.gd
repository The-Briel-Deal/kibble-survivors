extends CharacterBody2D

var youch_timeout = 1
var curr_health = 1
var player: CharacterBody2D
@export var speed: float
func _ready():
	player = get_tree().get_first_node_in_group("player")
	get_node("AnimatedSprite2D").play()


func _physics_process(delta):
	youch_timeout -= delta
	if curr_health <= 0:
		queue_free()
	velocity = global_position.direction_to(player.global_position) *delta*speed
	move_and_slide()
	for i in get_slide_collision_count():
		var collider = get_slide_collision(i).get_collider()
		if collider.is_in_group("player"):
			collider.take_damage(25)

func take_damage(damage: int):
	if youch_timeout <= 0:
		youch_timeout = 1
		curr_health-=damage
		var youch_stream_player: AudioStreamPlayer = AudioStreamPlayer.new()
		youch_stream_player.stream = load("res://Assets/youch.mp3")
		youch_stream_player.volume_db -= 30
		youch_stream_player.pitch_scale += .5
		get_tree().get_root().add_child(youch_stream_player)
		youch_stream_player.play()
