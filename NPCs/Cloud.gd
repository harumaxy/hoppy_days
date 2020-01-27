extends Node2D

var timeout = false
var Lightning = load("res://NPCs/Lightning.tscn")

func _process(delta):
	if 	$Sprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not timeout:
		$Sprite/RayCast2D.add_child(Lightning.instance())
		$Timer.start()
		timeout = true

func _on_Timer_timeout():
	timeout = false
