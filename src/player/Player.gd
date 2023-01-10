extends KinematicBody2D

export var speed = 200

onready var input := $PlayerInput
onready var body := $Body
onready var arm := $Body/ArmRoot

var velocity = Vector2.ZERO

func _get_motion():
	return Vector2(input.get_action_strength("move_right") - input.get_action_strength("move_left"), 0);

func _physics_process(_delta):
	velocity = _get_motion() * speed
	velocity = move_and_slide(velocity)

	var aim = _get_aim_dir()
	var dot = aim.dot(Vector2.LEFT)
	var flip = sign(dot)
	body.scale.x = flip

	var face_dir = Vector2.LEFT * flip
	var angle = rad2deg(face_dir.angle_to(aim))
	arm.rotation_degrees = angle * flip

func _get_aim_dir():
	return global_position.direction_to(get_global_mouse_position()).normalized()
