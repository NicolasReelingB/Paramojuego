extends Control

func _on_start_pressed():
	$BackgroundMusic.stop()
	StageManager.change_stage(StageManager.test_stage)

func _on_node_2d_intro_finished():
	$Control.show()
