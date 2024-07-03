extends Label

var score = 0;
var running = true

func _process(delta):
	if running:
		score += 0.02
		self.text = str(round(score * pow(10.0, 0)) / pow(10.0, 0)) + "m"

func _stop():
	running = false
