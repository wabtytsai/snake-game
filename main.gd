extends Node

@export var tail_scene: PackedScene
@export var fruit_scene: PackedScene
@export var body_scene: PackedScene
const grid_size = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var tail = tail_scene.instantiate()
    $Snake.add_next_body(tail)
    tail.set_speed(grid_size)
    $Snake.set_speed(grid_size)
    add_child(tail)
    $FruitTimer.start()


func _on_fruit_eaten() -> void:
    var body = body_scene.instantiate()
    $Snake.add_next_body(body)
    add_child(body)
    $FruitTimer.start()

func _on_fruit_timer_timeout() -> void:
    var screen_size = get_viewport().get_visible_rect().size
    var x = randi_range(0, screen_size.x) / grid_size * grid_size
    var y = randi_range(0, screen_size.y) / grid_size * grid_size
    var fruit = fruit_scene.instantiate()
    fruit.position.x = x
    fruit.position.y = y
    add_child(fruit)
    fruit.fruit_eaten.connect(_on_fruit_eaten)
    $FruitTimer.stop()
