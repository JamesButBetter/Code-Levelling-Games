extends RichTextLabel

# Configuration variables
@export var max_font_size: int = 100  # Maximum font size (starting point)
@export var min_font_size: int = 1    # Minimum font size (can be very small)

func _ready():
	pass

func scale_text_to_fit():
	# Start with the maximum font size
	add_theme_font_size_override("normal_font_size", max_font_size)

	# Calculate the ideal font size using binary search for smooth scaling
	var low = min_font_size
	var high = max_font_size
	var best_font_size = high

	while low <= high:
		var mid = (low + high) / 2
		add_theme_font_size_override("normal_font_size", mid)

		# Check if the text fits within the label's bounds
		if get_content_height() <= size.y and get_content_width() <= size.x:
			best_font_size = mid
			low = mid + 1  # Try a larger font size
		else:
			high = mid - 1  # Try a smaller font size

	# Set the final font size
	add_theme_font_size_override("normal_font_size", best_font_size)

# Optional: Call this function if the label's size changes
func _notification(what):
	pass
