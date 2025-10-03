extends CharacterBody2D

# --- Tunables ---
const GRAVITY := 1800.0
const JUMP_FORCE := 700.0          # positive; we apply as negative on jump
const RUN_SPEED := 300.0
const MAX_FALL_SPEED := 1400.0

func _physics_process(delta: float) -> void:
	# Auto-run to the right
	velocity.x = RUN_SPEED

	# Gravity
	if not is_on_floor():
		velocity.y = min(velocity.y + GRAVITY * delta, MAX_FALL_SPEED)
	else:
		# small snap helps consistent jumps
		velocity.y = 0.0

	# Jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_FORCE

	move_and_slide()


func _on_item_collected() -> void:
	pass # Replace with function body.


func _on_item_2_collected() -> void:
	pass # Replace with function body.
