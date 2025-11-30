class_name Enemy
extends CharacterBody2D

@export var base_stats: Resource # Recebe um tipo de inimigo (evil skull, ...)
@export var current_stats: EnemyStats
var enemy_ai: EnemyAI
var can_attack := true


func _ready():
	current_stats = EnemyStats.new(self)
	current_stats.recalculate_stats()

func attack(player: Player):
	if not can_attack:
		return
	
	can_attack = false
	player.take_damage(current_stats.damage)
	await get_tree().create_timer(current_stats.attack_speed).timeout
	can_attack = true

func take_damage(amount: float):
	current_stats.current_health -= amount
	current_stats.current_health = floor(current_stats.health) # Arredonda pra baixo
	if current_stats.current_health <= 0.0:
		queue_free() # morre/exclui
