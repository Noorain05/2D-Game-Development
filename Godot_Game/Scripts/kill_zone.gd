extends Area2D
@onready var game_manager = %GameManager



func _on_body_entered(_body):
	game_manager.damage_player(game_manager.killzone_damage)
	
