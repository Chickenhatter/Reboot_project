extends Node2D
var chickensthere = 0
var Hidden = false
var pillarthere = 0
var tekau = false
var toru = false
var v = true
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
			toru = true
	if pillarthere > -1:
		if pillarthere == 0:
			$Chicken/Chicken2/Chicken.play("First")
		elif pillarthere == 1:
			$Chicken/Chicken2/Chicken.play("Undercook")
		elif pillarthere == 2:
			$Chicken/Chicken2/Chicken.play("Almost")
		else:
			$Chicken/Chicken2/Chicken.play("Done")
			tekau = true
	if v == false:
		$TnT/TnT.play("No")
		$TnT/TnT2.play("No")
		$TnT/TnT3.play("No")
		$TnT/TnT4.play("No")
		$TnT/TnT5.play("No")
		$TnT/TnT6.play("No")
	if tekau == true:
		if toru == true:
			if v == true:
				$TnT/TnT.play("Yes")
				$TnT/TnT2.play("Yes")
				$TnT/TnT3.play("Yes")
				$TnT/TnT4.play("Yes")
				$TnT/TnT5.play("Yes")
				$TnT/TnT6.play("Yes")



func _on_chicken_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		chickensthere = chickensthere + 1
		print("Chicken")


func _on_hiddenfire_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		$"Small flame/Hiddenfire/HideFlame".play("On")
		Hidden = true
		print("Hidden")
		$TnT/Lever/lol.play("Up")

func _on_chicken_2_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		pillarthere = pillarthere + 1
		


func _on_lever_area_entered(area: Area2D) -> void:
	if area.name == "Fireball":
		if Hidden == true:
			if toru == true:
				if tekau == true:
					$Door/Pile/PathFollow2D.progress_ratio = 0.9
					$TnT/Lever/lol.play("Down")
					v = false
					$Door/Explode.play("Explo")
