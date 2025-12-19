extends Area2D

signal fruit_eaten


func _on_area_entered(area: Area2D) -> void:
    if area.is_in_group("snake_bodies"):
        queue_free()
        fruit_eaten.emit()
