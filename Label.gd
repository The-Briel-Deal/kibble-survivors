extends Label


var time_passed: float = 0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_passed += delta
	text = "%s:%s:%s" % [int(round(time_passed))/60, int(floor(time_passed)) % 60, int(floor(fmod(time_passed, 1.0)*100))]
