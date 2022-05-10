extends KinematicBody2D

var speed = 100
var movement = Vector2(0,0)

func _physics_process(delta):
	if(Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_right2")):
		move_and_collide(Vector2(speed * delta ,0))
	elif(Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_left2")):
		move_and_collide(Vector2(-speed * delta,0))
		
	if(Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_up2")):
		move_and_collide(Vector2(0,-speed * delta))
	elif(Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_down2")):
		move_and_collide(Vector2(0,speed * delta))


#if(Input.is_key_pressed())
#$Player.position.x -= speed
#$Player.position -= Vector2(speed,0)
#movement.y = speed * delta
