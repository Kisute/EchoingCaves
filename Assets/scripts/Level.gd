extends Node3D

@export var modules: Array[PackedScene] = []
@export var player: CharacterBody3D 
@export var score: Label
@export var blackScreen: MeshInstance2D


var active = PackedScene.new()
var amnt =2
var rng = RandomNumberGenerator.new()
var offset = 30
var gameOver = false
var gameOverAnimationReady = true

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amnt:
		var instance = modules[0].instantiate()
		instance.position.x = n*offset
		add_child(instance)
		blackScreen.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
		
	if ! gameOver:
		if Input.is_action_just_pressed("ui_left"):
			if (player._is_turning_allowed()):	
				active.spin(-90)
			else:	
				print("not implemented")
		if Input.is_action_just_pressed("ui_right"):
			if (player._is_turning_allowed()):	
				active.spin(90)	
			else:	
				print("not implemented")	

func _game_over():
	gameOver = true
	active._game_over()
	score._stop()
	blackScreen.visible = true
	
func _is_game_over():
	return gameOver
			
