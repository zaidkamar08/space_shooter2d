extends Node2D

var enemy_scene = preload("res://enemies/enemy.tscn")

func _ready():
	var timer = Timer.new()
	add_child(timer)

	timer.wait_time = 1.5
	timer.timeout.connect(_create_enemy)
	timer.start()

func _create_enemy():
	var enemy = enemy_scene.instantiate()

	enemy.position.x = randi_range(50, 700)
	enemy.position.y = -50

	get_node("../Enemies").add_child(enemy)

	print("enemy spawned")

func _on_area_entered(area):
	print("collision happened")

	if area.name == "BulletArea":
		area.queue_free()
		queue_free()
