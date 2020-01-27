extends Node2D

export var lives = 3
export var WORLD_LIMIT = 6000
export var target_coins_number = 3
var coins = 0


func update_GUI(lives_left, coins):
	get_tree().call_group("GUI", "update_gui", lives, coins)

func hurt():
	$Player.hurt()
	lives -= 1
	update_GUI(lives, coins)
	if lives <= 0 :
		end_game()

func end_game():
	get_tree().change_scene("res://Levels/EndGame.tscn")

func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
	

func coin_up():
	coins += 1
	update_GUI(lives, coins)
	
	var is_multiple_of_target = (coins % target_coins_number) == 0
	if is_multiple_of_target:
		life_up()
		
func life_up():
	lives += 1

	

