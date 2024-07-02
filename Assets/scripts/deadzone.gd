extends Node3D

@export var sounds: Array[AudioStreamPlayer3D] = []
var a = RandomNumberGenerator.new()

func _ready():
	
	a.randomize()
	playSound()

func playSound():
	var val = a.randi_range(0, sounds.size()-1)    
	sounds[val].play()      
