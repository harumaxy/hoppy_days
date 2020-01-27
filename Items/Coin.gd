extends Node2D

var is_taken = false

func _on_Area2D_body_entered(body):
	if not is_taken:
		is_taken = true
		get_tree().call_group("GameState", "coin_up")
		$AnimationPlayer.play("die")
		$AudioStreamPlayer2D.play()


func die():
	queue_free()