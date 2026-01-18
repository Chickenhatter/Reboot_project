extends Area2D
var bookholder = false
var a = false
var fire = false
var sprite = true
var e = false
var call = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _physics_process(delta: float) -> void:
	if fire == true:
		if Input.is_action_just_pressed("ui_f"):
			a = true
	if Input.is_action_pressed("ui_w"):
		$".".rotation_degrees = 0
		if Input.is_action_pressed("ui_d"):
			$".".rotation_degrees = 45
		if Input.is_action_pressed("ui_a"):
			$".".rotation_degrees = -45
		if Input.is_action_pressed("ui_s"):
			a = false
	elif Input.is_action_pressed("ui_d"):
		$".".rotation_degrees = 90
		if Input.is_action_pressed("ui_s"):
			$".".rotation_degrees = 135
		if Input.is_action_pressed("ui_a"):
			a = false
	elif Input.is_action_pressed("ui_s"):
		$".".rotation_degrees = 180
		if Input.is_action_pressed("ui_a"):
			$".".rotation_degrees = -135
	elif Input.is_action_pressed("ui_a"):
		$".".rotation_degrees = -90
	if a == true:
		$Path2D/PathFollow2D.progress += 50
		$Path2D/PathFollow2D/AnimatedSprite2D.play("default")
	
	if a == false:
		$Path2D/PathFollow2D.progress = 0
		$Path2D/PathFollow2D/AnimatedSprite2D.play("No")
	if sprite == false:
		$"../AnimatedSprite2D".play("default")
	if e == true:
		if Input.is_action_just_pressed("ui_e"):
			bookholder = true
			$"../../../House/Pedestal/Pedestal".play("No Book")
			$"../../../House/Pedestal/AnimatedSprite2D".play("Book play")
			$"../../../House/Node2D/Path2D/PathFollow2D".progress_ratio = 0.9999

func _on_fireball_area_entered(area: Area2D) -> void:
	if area.name == "Name":
		print("Its Ok")
		a = false
		$Path2D/PathFollow2D.progress = 0
		$Path2D/PathFollow2D/AnimatedSprite2D.play("No")


func _on_fireball_area_exited(area: Area2D) -> void:
	if area.name == "Name":
		print("Its Ok")
		a = false
		$Path2D/PathFollow2D.progress = 0
		$Path2D/PathFollow2D/AnimatedSprite2D.play("No")


func _on_house_to_shrine_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		sprite = true
		a = false
		if bookholder == true:
			fire = true


func _on_pedestal_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		e = true


func _on_pedestal_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		e = false


func _on_homeward_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		a = false 
		fire = false
		
