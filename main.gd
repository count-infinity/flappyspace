extends Node2D


@onready var player = $Player
@onready var pipes = $pipes
@onready var ground = load("res://ground.tscn")
@onready var explosion: PackedScene = load("res://explosion.tscn")

var grounds = []
var last_position = 0

func _ready():
    
    Globals.score = 0
    
    var g1 = ground.instantiate()
    var g2 = ground.instantiate()
        
    g1.position.y = 628
    g2.position.y = 628
    
    self.add_child(g1)
    self.add_child(g2)
        
    g2.position.x = g1.width
    
    grounds = [g1,g2]    
    pipes.player_passed.connect($HUD/score_label.increase_score)    
    pipes.player_passed.connect($HUD/high_score_label._check_score)    
    
    player.dead.connect(player_dead)

func player_dead():
    var ex = explosion.instantiate()    
    ex.position = player.position
    player.hide()        
    add_child(ex)            
    ex.explode()   
    game_over_screen()
    pipes.reset()  
    Globals.save()
    
func game_over_screen():    
    await get_tree().create_timer(2).timeout
    # Code to execute after the delay
    get_tree().change_scene_to_file("res://game_over.tscn")
    
    
func _process(delta):
        
    var to_remove=[]
    for idx in range(pipes.pipe_pairs.size()):
        var pipe_pair = pipes.pipe_pairs[idx]
        var pipe = pipe_pair[0]
        if (player.position.x-pipe.position.x) > 20:
            to_remove.append(idx)            
        else:
            break
    for pair_idx in to_remove:
        pipes.remove_pair(pair_idx)            
            
    var g1 = grounds[0]
    var g2 = grounds[1]
            
    if player.position.x-g1.position.x > 1800:
        g1.position.x = g2.position.x + g2.width
    if player.position.x-g2.position.x > 1800:
        g2.position.x = g1.position.x + g1.width
           
    if int(player.position.x) > last_position+200:
        pipes.generate_obs(player.position.x+600)
        last_position = player.position.x

    
    
    
