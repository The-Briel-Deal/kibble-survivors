extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	max_value = get_tree().get_first_node_in_group("player").max_health
	value = get_tree().get_first_node_in_group("player").curr_health
