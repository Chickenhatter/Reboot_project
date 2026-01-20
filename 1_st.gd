extends Node2D
var v = false
var q = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if v == true:
		if q == true:
			if $Node2D/Path2D/PathFollow2D.progress_ratio < 0.9:
				$Node2D/Path2D/PathFollow2D.progress += 10


func _on_esc_1_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		$"../Character/CharacterBody2D".position = Vector2(-5000,-4800)
		$"../Camera/Camera2D".position = Vector2(-5000,-5000)

func _on_f_1_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		v = true
		print("v")
		$Node2D2/F1/AnimatedSprite2D.play("Fire")


func _on_f_2_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		q = true
		print("q")
		$Node2D2/F2/AnimatedSprite2D.play("Fire")
