extends SnakeBody

var speed = 50

func set_speed(new_speed):
    speed = new_speed


func move(new_position, parent_position):
    position = new_position
    set_animation(parent_position - position)

func set_animation(direction: Vector2) -> void:
    var degrees = direction.x / speed * 90 + direction.y / speed * 180
    if direction.y < 0:
        degrees = 0
    $Sprite.set_global_rotation_degrees(degrees)
