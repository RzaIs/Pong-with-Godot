extends Node2D

var score1 := 0
var score2 := 0

var pause := false

func _on_Right_body_entered(_body):
	score2 = ScoreAchieved(score2)
	
func _on_Left_body_entered(_body):
	score1 = ScoreAchieved(score1)

func _ready():
	$Ball.position = Vector2(512.0 , 300.0)
	get_tree().call_group("BallGroup","stopBall")
	$Timer.start()
	$Control.get_node("TimerLabel").visible = true

func reset():
	randomize()	
	$Ball._velocity.x = [-1.0 , 1.0][randi() % 2]
	$Ball._velocity.y = [-0.8 , 0.8][randi() % 2]

func _process(_delta):
	if Input.is_action_pressed("pause"):
		pause = true
	if Input.is_action_pressed("resume"):
		pause = false

	$Control.get_node("Score1").text = str(score1)
	$Control.get_node("Score2").text = str(score2)
	$Control.get_node("TimerLabel").text= str(($Timer.time_left as int)+1)

func _on_Timer_timeout():
	get_tree().call_group("BallGroup","resetBall")
	reset()
	$Control.get_node("TimerLabel").visible = false

func ScoreAchieved(score: int):
	score += 1
	$Ball.position = Vector2(512.0 , 300.0)
	get_tree().call_group("BallGroup","stopBall")
	$Timer.start()
	$Control.get_node("TimerLabel").visible = true
	$ScoreSound.play()
	$Player1.position.x = 35
	$Player2.position.x = 989
	return score
