extends AnimatedSprite


func _on_Player_animate(motion):
	pass # Replace with function body.
	if motion.y < 0:
		play("jump")
	elif motion.x != 0:
		if motion.x > 0:
			play("walk")
			flip_h = false
		else:
			play("walk")
			self.flip_h = true # selfは使っても使わなくてもok
	else:
		play("idle")