extends CharacterBody3D

@export var inventory_data: InventoryData

const SPEED = 5.0
const RUN_SPEED = 10.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

signal toggle_inventory()

@onready var camera: Camera3D = $Camera3D
@onready var interact_ray: RayCast3D = $Camera3D/InteractRay

@onready var air = $"../UI/Air"

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * .005)
		camera.rotate_x(-event.relative.y * .005)
		camera.rotation.x = clamp(camera.rotation.x, -PI/4, PI/4)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory.emit()
		
	if Input.is_action_just_pressed("interact"):
		interact()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

	if not Input.is_action_pressed("run"):
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	else:
		
		air.value -= 0.05
		
		if direction:
			velocity.x = direction.x * RUN_SPEED
			velocity.z = direction.z * RUN_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, RUN_SPEED)
			velocity.z = move_toward(velocity.z, 0, RUN_SPEED)

	move_and_slide()

func interact() -> void:
	if interact_ray.is_colliding():
		var interactedItem = interact_ray.get_collider().slot_data
		if interactedItem is SlotData:
			if inventory_data.pick_up_item(interactedItem):
				interact_ray.get_collider().queue_free()
