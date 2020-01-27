extends Node2D

const SPEED = 200

func _ready():
	set_as_toplevel(true)  # 親から位置を受け継がない
	# Node.get_parent() : 親Nodeを取得
	# Node.global_position : グローバル座標プロパティ Vector2D
	#	set, get できる
	global_position = get_parent().global_position

func _process(delta):
	position.y += SPEED * delta
	manage_collision()



func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()		# 重なっているPhysicsBody2D (とそれを継承したオブジェクト) を Listで返す。
	for object in collider:
		if object.name == "Player": 	# あたったのがPlayerのとき
			print("ouch")
			get_tree().call_group("GameState", "hurt")
		queue_free()	# あたったのがPlayerであろうがTerrainであろうが、何かと重なったら消滅
				


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
