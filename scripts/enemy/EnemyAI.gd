class_name EnemyAI
extends Node

var enemy: Enemy
@onready var player: Player = get_node("/root/GamePrototype/Player")


func _ready():
	enemy = get_parent() # o pai é Enemy

func _physics_process(_delta):
	chase_player()

func chase_player(): # Persegue o jogador
	var enemy_ms = enemy.current_stats.move_speed
	var direction = (player.global_position - enemy.global_position).normalized()
	enemy.velocity = direction * enemy_ms
	enemy.move_and_slide()
