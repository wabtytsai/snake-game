extends Area2D

var speed = 50
var last_velocity = Vector2(0, -1)
var is_moving = false
var move_delay = 0.2
var next_body: SnakeBody = null

func _ready() -> void:
    is_moving = false
    $Head.play()

func set_speed(new_speed):
    speed = new_speed


func add_next_body(body: SnakeBody) -> void:
    body.position = position + last_velocity * -speed
    var old_body = next_body
    next_body = body
    body.add_next_body(old_body)


func _process(_delta: float) -> void:
    var velocity = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    elif Input.is_action_pressed("move_left"):
        velocity.x -= 1
    elif Input.is_action_pressed("move_down"):
        velocity.y += 1
    elif Input.is_action_pressed("move_up"):
        velocity.y -= 1

    if velocity.length() > 0:
        last_velocity = velocity

    if is_moving == false:
        var old_position = position
        position += last_velocity * speed
        next_body.move(old_position, position)
        set_animation(last_velocity)
        
        is_moving = true
        await get_tree().create_timer(move_delay).timeout
        is_moving = false

func set_animation(direction: Vector2) -> void:
    var degrees = direction.x * 90 + direction.y * 180
    if direction.y == -1:
        degrees = 0
    $Head.set_global_rotation_degrees(degrees)
        


func _on_area_entered(area: Area2D) -> void:
    print("snake")
    #if area.is_in_group("snake_bodies"):
        #get_tree().call_group("snake_bodies", "queue_free")
