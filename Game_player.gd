extends CharacterBody2D

var vert = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var movement = Vector2.ZERO
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
		$"../../Camera/Camera2D".position = $".".position


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://Game.tscn")
