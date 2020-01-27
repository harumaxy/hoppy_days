extends Node2D

func _ready():
	$Area2D/AnimationPlayer.play("walk")


func _on_Area2D_body_entered(body):
	get_tree().call_group("GameState", "hurt")
