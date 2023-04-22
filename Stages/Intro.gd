extends Node2D

signal intro_finished

func _ready():
	$Anim.play("FadeIn")
	await $Anim.animation_finished
	$Anim.play("FadeOut")
	await $Anim.animation_finished
	hide()
	intro_finished.emit()
