extends Node3D

@export var modules: Array[PackedScene] = []
@export var player: CharacterBody3D 

var active = PackedScene.new()
var amnt =2
var rng = RandomNumberGenerator.new()
var offset = 30
var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amnt:
		var instance = modules[0].instantiate()
		instance.position.x = n*offset
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ! gameOver:
		_check_inputs()
	
func spawnModule(n):
	rng.randomize()
	var num = rng.randi_range(0, modules.size()-1)
	var instance = modules[num].instantiate()
	instance.position.x = n
	add_child(instance)

func _set_as_active(scene):
	active = scene
	
func _check_inputs():
	if (player._is_turning_allowed()):		
		if Input.is_action_just_pressed("ui_left"):
			active.spin(-90)
		if Input.is_action_just_pressed("ui_right"):
			active.spin(90)	
	else:
		print("not implemented")
		
func _game_over():
	gameOver = true
	active._game_over()
			
