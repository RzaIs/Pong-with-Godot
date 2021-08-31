extends Plate

var Ball : KinematicBody2D

func _ready():
	Ball = get_parent().find_node("Ball")
	

func _physics_process(_delta) -> void:
	if get_parent().pause == false:
		move_and_slide(Vector2(0.0 , get_direction() * speed))


func get_direction() -> int:	
	if abs(Ball.position.y - position.y) > 10:
		if Ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0
