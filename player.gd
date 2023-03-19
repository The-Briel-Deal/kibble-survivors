extends CharacterBody2D

@export var speed: float
@export var jab_time: float
var curr_health: int = 100
var max_health: int = 100
var jab_time_elapsed: float
var youch_timeout = 0

var direction: Vector2 = Vector2(0,0)

var player_sprite: AnimatedSprite2D
var player_collision_polygon: CollisionPolygon2D

func _ready():
	player_sprite = get_node("PlayerSprite")
	player_collision_polygon = get_node("CollisionPolygon2D")
	player_sprite.play()
	
func _process(delta):
	jab_time_elapsed += delta
	if jab_time <= jab_time_elapsed:
		jab_time_elapsed -= jab_time
		jab_sword(direction)
	
	youch_timeout -= delta

func _physics_process(delta):
	# Get Directions From Input
	direction.x = Input.get_axis("Move Left", "Move Right")
	direction.y = Input.get_axis("Move Up", "Move Down")
	direction = direction.normalized()
	# Multiply X Direction by Speed
	if direction.x:
		player_sprite.play("default")
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	# Multiply Y Direction by Speed
	if direction.y:
		player_sprite.play("default")
		velocity.y = direction.y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	if !velocity.x && !velocity.y:
		player_sprite.stop()
		
	if velocity.x > 0:
		player_sprite.set_flip_h(false)
		player_collision_polygon.scale.x = 1
	elif velocity.x < 0:
		player_sprite.set_flip_h(true)
		player_collision_polygon.scale.x = -1
	
	move_and_slide()

func jab_sword(direction: Vector2):
	var sword_jab: Area2D = load("res://sword_jab.tscn").instantiate()
	if (direction.is_zero_approx()):
		if player_sprite.flip_h:
			direction.x = -1
		else:
			direction.x = 1
	sword_jab.rotate(direction.angle())
	sword_jab.position += (direction * 10)
	add_child(sword_jab)
	
func take_damage(damage: int):
	if youch_timeout <= 0:
		youch_timeout = 1
		curr_health-=damage
		var youch_stream_player: AudioStreamPlayer = AudioStreamPlayer.new()
		youch_stream_player.stream = load("res://Assets/youch.mp3")
		youch_stream_player.volume_db -= 30
		get_tree().get_root().add_child(youch_stream_player)
		youch_stream_player.play()
	
