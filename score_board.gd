extends CanvasLayer

func _ready():
	RenderingServer.set_default_clear_color(Color("222426"))
	$HTTPRequest.request("https://aqnudvdkeendtezupjpz.supabase.co/rest/v1/high-scores?select=*", ["apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbnVkdmRrZWVuZHRlenVwanB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNDU4MTIsImV4cCI6MTk5NDkyMTgxMn0.I9Su9EDEicuACbQLZf2SfKo9gYGuJKXTeRsMe7g5nvA", "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbnVkdmRrZWVuZHRlenVwanB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNDU4MTIsImV4cCI6MTk5NDkyMTgxMn0.I9Su9EDEicuACbQLZf2SfKo9gYGuJKXTeRsMe7g5nvA"])


func _on_http_request_request_completed(result, response_code, headers, body):
	print(JSON.parse_string(body.get_string_from_utf8()))
