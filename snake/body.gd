extends Area2D
class_name SnakeBody

var next_body: SnakeBody = null


func add_next_body(body: SnakeBody) -> void:
    if not body:
        return
    var old_body = next_body
    next_body = body
    body.add_next_body(old_body)


func move(new_position, _parent_position):
    var old_position = position
    position = new_position
    if next_body:
        next_body.move(old_position, position)
