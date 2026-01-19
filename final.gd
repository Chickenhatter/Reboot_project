extends Node2D
var v = false
var q = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if v == true:
		if Input.is_action_pressed("ui_e"):
			q = true
	if q == true:
		$Leave/AnimatedSprite2D.play("White")
		$Leave/CollisionShape2D.scale += 1
		$Leave/AnimatedSprite2D.scale += 1


func _on_leave_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		v = true


func _on_leave_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		v = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://Start.tscn")
