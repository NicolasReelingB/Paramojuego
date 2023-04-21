extends CanvasLayer

const main_menu = ("res://Stages/main_menu.tscn")
const test_stage = ("res://main.tscn")

func _ready():
	$ColorRect.hide()

func change_stage(stage_path):
	get_tree().paused = true #Optional
	$ColorRect.show()
	$Anim.play("TransIn")
	await $Anim.animation_finished
	get_tree().change_scene_to_file(stage_path)
	$Anim.play("TransOut")
	get_tree().paused = false #Optional
	await $Anim.animation_finished
	$ColorRect.hide()
