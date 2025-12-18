extends Area2D
class_name SnakeBody

const SPEED = 50
var next_body: SnakeBody = null


func set_next_link(body: SnakeBody) -> void:
    if not body:
        return
    var old_body = next_body
    next_body = body
    body.set_next_link(old_body)


func move(new_position, _parent_position):
    var old_position = position
    position = new_position
    if next_body:
        next_body.move(old_position, position)
