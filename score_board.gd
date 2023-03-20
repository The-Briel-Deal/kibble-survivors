extends Control

var tapped=false

func _draw():
	var r = Rect2( Vector2(), get_size() )
	if (tapped):
		draw_rect(r, Color(1,0,0) )
	else:
		draw_rect(r, Color(0,0,1) )

func _on_gui_input(event: InputEvent):
	if (event.is_pressed() && event.keycode == MOUSE_BUTTON_LEFT):
		print("clicked")
		tapped=true
		queue_redraw()
