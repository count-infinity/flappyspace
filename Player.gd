extends CharacterBody2D

@export var is_gravity = true

@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0

var state = "alive"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal dead

func _ready():
    position.x = 399
    position.y = 300
    velocity.x = SPEED

func _physics_process(delta):
    # Add the gravity.
    if state == "dead": return
    if is_on_floor() or is_on_wall():
        state ="dead"
        dead.emit()
        return
        
    if is_on_wall():
        velocity.x = 0
    else:
        velocity.x = move_toward(velocity.x,SPEED,SPEED/10)
        
    if not is_on_floor() and is_gravity:
        velocity.y += gravity * delta

    # Handle Jump.
    if Input.is_action_just_pressed("ui_accept"):
        velocity.y = JUMP_VELOCITY

    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    #var direction = Input.get_axis("ui_left", "ui_right")
    #if direction:
    #velocity.x = SPEED
    #else:
    #    velocity.x = move_toward(velocity.x, 0, SPEED)
        
   # var ydir = Input.get_axis("ui_up", "ui_down")
   # if ydir:
   #     velocity.y = ydir * SPEED
   # elif not is_gravity:
   #     velocity.y = move_toward(velocity.y, 0, SPEED)

    move_and_slide()
