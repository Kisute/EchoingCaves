extends Node3D

@export var modules: Array[PackedScene] = []

var active = PackedScene.new()
var amnt =2
var rng = RandomNumberGenerator.new()
var offset = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amnt:
		spawnModule(n*offset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_inputs()
	
func spawnModule(n):
	rng.randomize()
	var num = rng.randi_range(0, modules.size()-1)
	var instance = modules[num].instantiate()
	instance.position.x = n
	add_child(instance)

func setAsActive(scene):
	active = scene
	
func check_inputs():
	if Input.is_action_just_pressed("ui_left"):
		active.spin(-90)
	if Input.is_action_just_pressed("ui_right"):
		active.spin(90)	
		
			
