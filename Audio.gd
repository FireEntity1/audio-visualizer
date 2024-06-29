extends AudioStreamPlayer2D

var beat = 0
var beatOdd = 0
var bpm = 143
var measure = 0


var vol = 0


func _ready():
	var path = OS.get_executable_path().get_base_dir() + "/song.ogg"
	$CustomPlayer.stream = AudioStreamOggVorbis.load_from_file(path)
	$CustomPlayer.play()
	

func _physics_process(delta):
	vol = AudioServer.get_bus_peak_volume_right_db(0,0)
	beat += float(bpm)/60/60
	$"Rotating Lights"
	if beat > 1:
		beat = 0
		$"Rotating Lights".play("default")
		$Glow.play("default")
		measure += 1
		beatOdd += 1
	print(str(vol))


	if beatOdd == 2:
		$Bars2.play("default")
		$Camera2D.position.x = 920
		$Camera2D.rotation_degrees = 5
		$Camera2D.position.y = 480
		$OuterGlow.play("default")

		beatOdd = 0
	elif beatOdd == 1:
		$Bars.play("default")
		$Camera2D.position.x = 1000
		$Camera2D.rotation_degrees = -5

	if measure == 3:
		measure = 0
		$Camera2D.position.y = 600
		

	$Visualizer3.value = vol
	$Visualizer10.value = vol
	
