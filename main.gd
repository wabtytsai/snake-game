extends Node

@export var tail_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var tail = tail_scene.instantiate()
    $Snake.set_next_link(tail)
    add_child(tail)
