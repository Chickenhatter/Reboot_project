extends Node2D
var s1 = 1
var s2 = 2
var s3 = 3
var s4 = 1
var s5 = 1
var up = false
var down = false
var left = false
var right = false
var softlockable = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if up == true:
		$Moveable/Path2D/PathFollow2D/Path2D/PathFollow2D.progress += 5
	if down == true:
		$Moveable/Path2D/PathFollow2D/Path2D/PathFollow2D.progress -= 5
	if left == true:
		$Moveable/Path2D/PathFollow2D.progress += 5
	if right == true:
		$Moveable/Path2D/PathFollow2D.progress -= 5
	if softlockable == true:
		if Input.is_action_pressed("ui_e"):
				$"../Character/CharacterBody2D".position = Vector2(5977.0,-6323)
				up = true
				down = false
				left = false
				right = false
				$Moveable/Path2D/PathFollow2D.progress_ratio = 0.5
				$Moveable/Path2D/PathFollow2D/Path2D/PathFollow2D.progress_ratio = 0.0471

	






func _on_change_1_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s1 == 1:
			left = true
		if s1 == 2:
			right = true
		if s1 == 3:
			down = true


func _on_change_2_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s2 == 1:
			up = true
		if s2 == 2:
			down = true
		if s2 == 3:
			right = true

func _on_change_3_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s3 == 1:
			up = true
		if s3 == 2:
			down = true
		if s3 == 3:
			left = true


func _on_change_4_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s4 == 1:
			left = true
		if s4 == 2:
			left = true
		if s4 == 3:
			down = true


func _on_change_5_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s5 == 1:
			down = true
		if s5 == 2:
			right = true
		if s5 == 3:
			right = true

func _on_change_6_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s3 == 1:
			up = true
		if s3 == 2:
			right = true
		if s3 == 3:
			left = true


func _on_change_7_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = false
		if s1 == 1:
			up = true
		if s1 == 2:
			right = true
		if s1 == 3:
			right = true


func _on_switch_1_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		if s1 < 3:
			s1 = s1 + 1
		else:
			s1 = 1

func _on_switch_2_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		if s2 < 3:
			s2 = s2 + 1
		else:
			s2 = 1


func _on_switch_3_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		if s3 < 3:
			s3 = s3 + 1
		else:
			s3 = 1


func _on_switch_4_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		if s4 < 3:
			s4 = s4 + 1
		else:
			s4 = 1

func _on_switch_5_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		if s5 < 3:
			s5 = s5 + 1
		else:
			s5 = 1


func _on_landing_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		$"../Character/CharacterBody2D".position = Vector2(6043.0,-8269.0)
		softlockable = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		$"../Character/CharacterBody2D".position = Vector2(5977.0,-6323)
		softlockable = true
		up = true


func _on_auhhih_2_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = true
		down = false

func _on_auhhih_1_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = false
		up = false
		down = true
		


func _on_auhhih_3_area_entered(area: Area2D) -> void:
	if area.name == "Pathmove":
		left = false
		right = true
		up = true
		down = false
