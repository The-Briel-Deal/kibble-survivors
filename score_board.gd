extends CanvasLayer

func _ready():
	print(get_node("/root/Global").local_top_score)
	RenderingServer.set_default_clear_color(Color("222426"))
	get_scores()
	$Label2.text = "Submit your score of: %s" % get_node("/root/Global").local_top_score


func _on_http_request_request_completed(result, response_code, headers, body):
	var scoreboard: String = ""
	for score in JSON.parse_string(body.get_string_from_utf8()):
		scoreboard += "%s - %s\n" % [score.name, score.score]
	$RichTextLabel.text = scoreboard

func get_scores():
	$HTTPRequestGet.request("https://aqnudvdkeendtezupjpz.supabase.co/rest/v1/high-scores?select=*", ["apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbnVkdmRrZWVuZHRlenVwanB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNDU4MTIsImV4cCI6MTk5NDkyMTgxMn0.I9Su9EDEicuACbQLZf2SfKo9gYGuJKXTeRsMe7g5nvA", "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbnVkdmRrZWVuZHRlenVwanB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNDU4MTIsImV4cCI6MTk5NDkyMTgxMn0.I9Su9EDEicuACbQLZf2SfKo9gYGuJKXTeRsMe7g5nvA"])

func submit_new_score(name: String, score: float):
	$HTTPRequestPost.request("https://aqnudvdkeendtezupjpz.supabase.co/rest/v1/high-scores", ["apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbnVkdmRrZWVuZHRlenVwanB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNDU4MTIsImV4cCI6MTk5NDkyMTgxMn0.I9Su9EDEicuACbQLZf2SfKo9gYGuJKXTeRsMe7g5nvA", "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbnVkdmRrZWVuZHRlenVwanB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNDU4MTIsImV4cCI6MTk5NDkyMTgxMn0.I9Su9EDEicuACbQLZf2SfKo9gYGuJKXTeRsMe7g5nvA", "Content-Type: application/json", "Prefer: return=minimal"], HTTPClient.METHOD_POST, '{ "name": "%s", "score": %s }' % [name, score])
	

func _on_http_request_post_request_completed(result, response_code, headers, body):
	print(body.get_string_from_utf8())
	get_scores()
	


func _on_button_pressed():
	submit_new_score($TextEdit.text, get_node("/root/Global").local_top_score)
