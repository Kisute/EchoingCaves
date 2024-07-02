extends Node

@export var sounds: Array[AudioStreamPlayer] = []
var a = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	a.randomize()
	playSound()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func playSound():
	var val = a.randi_range(0, 4)
	if val == 1:
		val = a.randi_range(0, sounds.size()-1)    
		sounds[val].play()      
			 
	await get_tree().create_timer(10).timeout            
	playSound()   
