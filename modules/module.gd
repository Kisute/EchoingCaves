extends Node3D

@onready var level = $"../"
var speed = 6
var rotation_speed = 90
var target_rotation = 0  
var current_rotation = 0
var rotating = false
var rotatingToLeft = false

func _ready():
	target_rotation = rotation_degrees
	
func _process(delta):
	position.x -=speed * delta
	if position.x < -30:
		level.spawnModule((level.amnt-1)*level.offset)
		queue_free()
		
	if position.x < 10:
		level.setAsActive(self)
		
	if rotating:
		if !rotatingToLeft:
			var rotation_step = rotation_speed * delta
			if current_rotation + rotation_step > target_rotation:
				rotation_step = target_rotation - current_rotation 
			current_rotation += rotation_step
			rotate_y(deg_to_rad(rotation_step))
			if current_rotation >= target_rotation:
				rotating = false
		else :
			var rotation_step = -rotation_speed * delta
			if current_rotation + rotation_step < target_rotation:
				rotation_step = target_rotation - current_rotation 
			current_rotation += rotation_step
			rotate_y(deg_to_rad(rotation_step))
			if current_rotation <= target_rotation:
				rotating = false
				rotatingToLeft = false
			  

func spin(degrees):
	target_rotation = current_rotation + degrees
	rotating = true
	if degrees<0: 
		rotatingToLeft = true
