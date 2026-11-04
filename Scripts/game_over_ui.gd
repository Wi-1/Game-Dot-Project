extends CanvasLayer
class_name GameOverUI


func _ready() -> void:
	hide()


func _show():
	show()


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
