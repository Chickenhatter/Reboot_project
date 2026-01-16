extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rooms_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		$"../Camera/Camera2D".position = Vector2(-1150,0)


func _on_rooms_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		$"../Camera/Camera2D".position = Vector2(0,0)


func _on_house_to_shrine_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
