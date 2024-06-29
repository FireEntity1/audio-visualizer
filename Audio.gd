extends AudioStreamPlayer2D

var beat = 0

var vol = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vol = AudioServer.get_bus_peak_volume_right_db(0,0)
	beat += 0.03972166667
	if beat > 1:
		beat = 0
		print("BEAT")
		$Visualizer2.play("default")
	
	$Visualizer3.value = vol+1
	$Visualizer4.value = vol+2
	$Visualizer5.value = vol+3
	$Visualizer6.value = vol+4
	$Visualizer7.value = vol+4
	$Visualizer8.value = vol+3
	$Visualizer9.value = vol+2
	$Visualizer10.value = vol+1
	
