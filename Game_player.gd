extends CharacterBody2D

var vert = false
var four = false
var twojump = true
var e = false
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


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://Game.tscn")






func _on_house_to_shrine_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		vert = true
		four = true
		twojump = false
		$".".position = Vector2(2000,0)
		$"../../Camera/Camera2D".position = Vector2(2000,0)


func _on_homeward_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		vert = false
		four = false
		twojump = true
		$"../../Camera/Camera2D".position = Vector2(0,0)
		$".".position = Vector2(500,0)
