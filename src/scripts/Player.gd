extends Plate

export var playerNumber: int

var up: String
var down: String

func _ready():
	if(playerNumber == 1):
		up = "move_up_l"
		down = "move_down_l"
	elif(playerNumber == 2):
		up = "move_up_r"
		down = "move_down_r"
	
func _physics_process(_delta: float) -> void:
	var direction := get_direction()
	_velocity.y = speed * direction.y
	if get_parent().pause == false:
		move_and_slide(_velocity)

func get_direction() -> Vector2:
	var Y := Input.get_action_strength(down) - Input.get_action_strength(up)
	return Vector2(0.0 , Y)
