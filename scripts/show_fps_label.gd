extends Label

func _process(_delta) -> void:
	text = "fps: %s" % [Engine.get_frames_per_second()]
