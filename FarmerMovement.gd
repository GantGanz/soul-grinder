extends KinematicBody2D

export var speed = 100 #export?
var movement = Vector2(0,0)
const accel = 50
const max_speed = 100
const gravity = 10
const jump_force = -300 #y keatas negatif
const max_jump = 2
var jump_count = 0

func _physics_process(delta):
	if(not is_on_floor()):
		movement.y += gravity
	else :
		movement.y = 0
		jump_count = 0
		movement.x = lerp(movement.x, 0, 0.1) #perlambatan sebesar 0.1 setiap kali proses dipanggil
	
	if(Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_right2")):
		movement.x += accel
		movement.x = min(movement.x, max_speed)
	elif(Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_left2")):
		movement.x -= accel
		movement.x = max(movement.x, -max_speed)
		
	if(Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_up2")):
		movement.y = max(movement.y - accel, max_speed)
	elif(Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_down2")):
		movement.y = min(movement.y + accel, max_speed)

	if(Input.is_action_just_pressed("ui_jump") and (is_on_floor() or (jump_count < max_jump))):
		movement.y = jump_force
		jump_count += 1
		
	if(is_on_ceiling()): #how to know its celling or not?
		movement.y = 0
	elif(is_on_wall()):
		pass
	
	move_and_slide(movement, Vector2(0,-1))

#if(Input.is_key_pressed())
#$Player.position.x -= speed
#$Player.position -= Vector2(speed,0)
#movement.y = speed * delta
#move_and_collide(Vector2(speed * delta ,0))
