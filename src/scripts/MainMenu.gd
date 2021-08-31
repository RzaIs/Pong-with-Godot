extends Control

export var multiPath : PackedScene
export var singlePath : PackedScene

var information := "For singleplayer, in order to move use [w] and [s].\nFor multiplayer in order to move left player uses [w] ans [s],\nright player uses [up] and [down] arrow keys.\n [P] for pause [R] for resume."

func _ready():
	$Closer.visible = false
	$instruction.visible = false
	$instruction.text = information

func _on_MultiButton_pressed():
	get_tree().change_scene_to(multiPath)


func _on_SingleButton_pressed():
	get_tree().change_scene_to(singlePath)


func _on_Info_pressed():
	$instruction.visible = true
	$Closer.visible = true


func _on_Closer_pressed():
	$instruction.visible = false
	$Closer.visible = false
	
