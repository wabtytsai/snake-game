extends SnakeBody


func move(new_position, parent_position):
    position = new_position
    set_animation(parent_position - position)

func set_animation(direction: Vector2) -> void:
    print(direction)
    var degrees = direction.x / SPEED * 90 + direction.y / SPEED * 180
    if direction.y < 0:
        degrees = 0
    $Sprite.set_global_rotation_degrees(degrees)
