extends CharacterBody2D

var vert = false
var kurt = false
var four = true
var twojump = false
var e = false
var portal = false
var vtv = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var movement = Vector2.ZERO
	if twojump == true:
		if not is_on_floor():
			velocity += get_gravity() * delta
		if Input.is_action_just_pressed("ui_w") and is_on_floor():
			velocity.y = JUMP_VELOCITY*1
		var direction := Input.get_axis("ui_a", "ui_d")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	if four == true:
		if Input.is_action_pressed("ui_w"):
			movement.y -= 1
		if Input.is_action_pressed("ui_d"):
			movement.x += 1
		if Input.is_action_pressed("ui_s"):
			movement.y += 1
		if Input.is_action_pressed("ui_a"):
			movement.x -= 1
		velocity = movement * 300
	move_and_slide()
	if vert == true:
		$"../../Camera/Camera2D".position.y = $".".position.y
	if kurt == true:
		$"../../Camera/Camera2D".position.x = $".".position.x
	if portal == true:
		if Input.is_action_just_pressed("ui_e"):
			vtv = true
			four = false
			$"../../HtoS/Portal/AnimatedSprite2D".play("Portal")


func _on_quandevesk_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://Game.tscn")
