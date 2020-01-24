extends Node2D

export var lives = 3
export var WORLD_LIMIT = 6000


func hurt():
	$Player.hurt()
	lives -= 1
	if lives <= 0:
		end_game()

func end_game():
	get_tree().change_scene("res://Levels/EndGame.tscn") 
	
