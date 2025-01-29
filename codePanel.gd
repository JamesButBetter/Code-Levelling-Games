extends Panel

var command_list: Array = []

func _on_block_dropped(block: Control) -> void:
	var command = block.get_meta("command")  # e.g., "forward", "backward"
	command_list.append(command)
	print("Command List: ", command_list)
