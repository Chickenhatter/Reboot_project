extends Node2D
var chickensthere = 0
var Hidden = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chickensthere > -1:
		if chickensthere == 0:
			$Chicken/Chicken/Chicken.play("First")
		elif chickensthere == 1:
			$Chicken/Chicken/Chicken.play("Undercook")
		elif chickensthere == 2:
			$Chicken/Chicken/Chicken.play("Almost")
		else:
			$Chicken/Chicken/Chicken.play("Done")
	


func _on_chicken_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		chickensthere = chickensthere + 1
		print("Chicken")


func _on_hiddenfire_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		$"Small flame/Hiddenfire/HideFlame".play("On")
		Hidden = true
		print("Hidden")
		
