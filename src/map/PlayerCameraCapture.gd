extends Area2D

var logger = Logger.new("PlayerCameraCapture")

func _on_PlayerCameraCapture_body_entered(body):
	body.camera_point = null
#	body.stop_capture = true
	logger.debug("Captured: %s" % self)
