extends Sprite2D

var speed = 300
var boost = 2
var turn_speed = 10


func _ready():
	print("скорость: ", speed)


func _process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		direction.y -= 1

	if direction != Vector2.ZERO:
		var current_speed = speed
		# с шифтом быстрее
		if Input.is_key_pressed(KEY_SHIFT):
			current_speed = speed * boost
		position += direction.normalized() * current_speed * delta
		# картинка смотрит вверх, поэтому + PI / 2
		rotation = lerp_angle(rotation, direction.angle() + PI / 2, turn_speed * delta)

	stay_on_screen()


func _input(event):
	# пробел - вернуться в центр
	if event.is_action_pressed("ui_accept"):
		position = get_viewport_rect().size / 2
		rotation = 0


func stay_on_screen():
	var screen = get_viewport_rect().size
	position.x = clamp(position.x, 40, screen.x - 40)
	position.y = clamp(position.y, 40, screen.y - 40)
