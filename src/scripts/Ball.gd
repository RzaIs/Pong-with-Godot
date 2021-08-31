extends KinematicBody2D

const std_Speed := 400.0

export var speed := std_Speed

var _velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if get_parent().pause == false:
		var collision_obj = move_and_collide(_velocity * speed * delta)
		if collision_obj:
			_velocity = _velocity.bounce(collision_obj.normal)
			$HittSound.play()

func stopBall():
	speed = 0.0
	
func resetBall():
	speed = std_Speed
