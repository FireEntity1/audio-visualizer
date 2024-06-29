extends AudioStreamPlayer2D

var beat = 0
var beatOdd = 0
var bpm = 143

var vol = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var path = OS.get_executable_path().get_base_dir() + "/song.ogg"
	$CustomPlayer.stream = AudioStreamOggVorbis.load_from_file(path)
	$CustomPlayer.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vol = AudioServer.get_bus_peak_volume_right_db(0,0)
	beat += float(bpm)/60/60
	$"Rotating Lights"
	if beat > 1:
		beat = 0
		print("BEAT")
		$"Rotating Lights".play("default")

		beatOdd += 1
		if beatOdd == 2:
			$Bars2.play("default")
			beatOdd = 0
		elif beatOdd == 1:
			$Bars.play("default")
		
	$Visualizer3.value = vol
	$Visualizer10.value = vol
	
