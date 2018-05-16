extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

#jump timer

var timer = null
var can_jump = true
var jump_delay = 0.5


func _ready():
	#Timer for jump delay
	timer = Timer.new()
	timer.set_wait_time(jump_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
func on_timeout_complete():
	can_jump = true

func _physics_process(delta):
	motion.y +=10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 44
		#rotate(1)
    
		
	if Input.is_action_pressed("ui_left"):
		motion.x = -44
		
	motion = move_and_slide(motion, UP)
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -200
			
			

#koiro2 own movements
	if Input.is_action_pressed("D"):
		motion.x = 100
		#rotate(1)
    
		
	if Input.is_action_pressed("A"):
		motion.x = -100
		
	motion = move_and_slide(motion, UP)
	
	
	if Input.is_action_just_pressed("W") && can_jump:
		motion.y = -200
		timer.start()
		can_jump = false
	
		

	
	pass