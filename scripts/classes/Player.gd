class_name Player
extends CharacterBody2D

@export var base_stats: WarriorBaseStats # Atualmente fixo nos stats do Warrior
@export var modifiers: Array[StatsModifier] = [] # Lista de modificadores ativos (itens? livros?)
var stats: PlayerStats
var movement: PlayerMovement
@export var current_health: int


func _ready(): # Chama quando o obj fica prontos
	stats = PlayerStats.new(self)
	movement = PlayerMovement.new(self)
	stats.recalculate_stats()

func _physics_process(delta): # Faz handle da movimentacao 
	movement.tick(delta)

func add_modifier(modifier: StatsModifier) -> void: # Add modificador pra run do player (item? livro?)
	modifiers.append(modifier)
	stats.recalculate_stats()
