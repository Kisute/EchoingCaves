extends CharacterBody3D

@onready var level = $"../"
var turning_allowed = false;

func _on_area_3d_area_entered(area):
	print ("HIT " + area.name + ", " + area.get_parent().name + ", " + area.get_parent().get_parent().name )
	if (area.get_parent().name != "areaToTurn" ):
		level._game_over()
	else:
		print("kukkuu")
		turning_allowed = true;
	
	
func _on_area_3d_area_exited(area):
	if (area.get_parent().name == "areaToTurn" ):
		turning_allowed = false;

func _is_turning_allowed():
	return turning_allowed
