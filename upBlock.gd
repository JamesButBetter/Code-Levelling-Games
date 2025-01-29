extends TextureButton

var is_dragging := false
var start_position: Vector2

func _ready() -> void:
	# Store initial position for resetting if dropped outside the target area
	start_position = position
	# Connect signals
	connect("button_down", Callable(self, "_on_button_down"))
	connect("button_up", Callable(self, "_on_button_up"))

func _on_button_down() -> void:
	print("Button down!")
	is_dragging = true

func _on_button_up() -> void:
	print("Button up!")
	is_dragging = false
	# Snap to target area if hovering over it, else reset position
	if get_global_rect().intersects($CodeBox.get_global_rect()):
		position = get_global_mouse_position() - size / 2
	else:
		position = start_position

func _process(_delta: float) -> void:
	if is_dragging:
		position = get_global_mouse_position() - size / 2
