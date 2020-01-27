extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/LifeCount.text = "3"
	add_to_group("GUI")
	
	
func update_gui(lives_left, coins):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)