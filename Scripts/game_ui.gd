extends Control
class_name GameUI

@onready var health_label = $HealthLabel
@onready var coins_label = $CoinsLabel


func _update_coins(value):
	coins_label.text = "Яблоки: " + str(value)


func _update_health(current_health, max_health):
	health_label.text = "Жизни: " + str(int(current_health)) + "/" + str(int(max_health))
