extends Node2D


var enemy: Resource
var timer: float
var time_to_spawn: float = 1

func _ready():
	RenderingServer.set_default_clear_color(Color("222426"))
	enemy = preload("res://enemy.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= time_to_spawn:
		timer -= time_to_spawn
		time_to_spawn /= 1.002
		var enemy_instance: CharacterBody2D = enemy.instantiate()
		enemy_instance.position.x = randi_range(-250, 250)
		enemy_instance.position.y = randi_range(-250, 250)
		if enemy_instance.position.distance_to($Player.position) > 100:
			add_child(enemy_instance)

