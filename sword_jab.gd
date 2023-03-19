extends Area2D

@export var jab_speed_forward: float
var time_elapsed: float = 0
var damage: int = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(1,0).rotated(rotation) * jab_speed_forward * delta
	time_elapsed += delta
	if time_elapsed > .75:
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(damage)
