extends SnakeBody

var grid_size = 50

func move(new_position, parent_position):
    position = new_position
    set_animation(parent_position - position)

func set_animation(direction: Vector2) -> void:
    var degrees = direction.x / grid_size * 90 + direction.y / grid_size * 180
    if direction.y < 0:
        degrees = 0
    $Sprite.set_global_rotation_degrees(degrees)
