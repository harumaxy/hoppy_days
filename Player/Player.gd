extends KinematicBody2D

export var SPEED = 1000
export var JUMP_SPEED = 3000
export var GRAVITY = 200 
export var WORLD_LIMIT = 6000

const UP = Vector2(0, -1.0) # 下方向が正


var lives = 3

var motion = Vector2(0, 0)

# Inputはグローバルなシングルトンオブジェクトで、どのスクリプトからもアクセスできる
func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState", "end_game")
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	if is_on_ceiling() and motion.y < 0:
		motion.y = 1
	else:
		motion.y += GRAVITY
		
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		# 滑る動き
		motion.x = 0

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()

signal animate

func animate():
	emit_signal("animate", motion)
	
func hurt():
	# GameStateから呼ばれるので、呼び出し遅延のせいでうまく行かない可能性がある。idle_frameを駆使してプロパティが変わらないようにする。
	yield(get_tree(), "idle_frame")
	position.y -= 10
	yield(get_tree(), "idle_frame")
	motion.y = -(JUMP_SPEED)
	$PainSFX.play()


export var boost_multipliyer = 1.5

func boost():
	position.y -= 10
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED * boost_multipliyer
	


