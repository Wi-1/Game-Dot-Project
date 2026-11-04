extends Area2D

@export var points: int = 1

signal collected(points)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		set_deferred("monitoring", false)
		emit_signal("collected", points)
		$AnimatedSprite2D.play("collected")
		await $AnimatedSprite2D.animation_finished
		queue_free()
