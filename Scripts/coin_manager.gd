extends Node
class_name CoinManager

signal update_coin_UI(value)

var coins: int = 0


func _ready() -> void:
	for apple in get_tree().get_nodes_in_group("Collectable"):
		apple.collected.connect(_on_collected)


func _on_collected(points):
	coins += points
	print(coins)
	update_coin_UI.emit(coins)
