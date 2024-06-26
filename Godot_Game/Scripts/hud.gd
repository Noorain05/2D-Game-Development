extends CanvasLayer

@onready var label = $Label
@onready var game_manager = %GameManager
@onready var health_bar = $HealthBar
@onready var timer = $HealthBar/Timer

@onready var damage_bar = $HealthBar/DamageBar


func _ready():
	init_player_health()


func _process(_delta):
	label.modulate = Color.RED
	label.text = "Score: " + str(game_manager.score)


func init_player_health():
	health_bar.max_value = game_manager.max_player_health
	health_bar.value = game_manager.max_player_health
	damage_bar.max_value = game_manager.max_player_health
	damage_bar.value = game_manager.max_player_health
	

func change_health(new_health):
	if(new_health <= 0 ):
		game_manager.kill_player()
	if(new_health < game_manager.previous_player_health):
		health_bar.value = new_health
		timer.start()
	else:
		health_bar.value = new_health
		damage_bar.value = new_health


#func damage_player(damage_to_player : float ):
	#game_manager.previous_player_health = game_manager.current_player_health
	#game_manager.current_player_health -= damage_to_player 
	#change_health(game_manager.current_player_health) 






func _on_timer_timeout():
	damage_bar.value = game_manager.current_player_health
