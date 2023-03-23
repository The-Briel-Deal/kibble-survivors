extends Label


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("/root/Global").local_top_score += delta
	text = "%s:%s:%s" % [int(round(get_node("/root/Global").local_top_score))/60, int(floor(get_node("/root/Global").local_top_score)) % 60, int(floor(fmod(get_node("/root/Global").local_top_score, 1.0)*100))]
