extends Node2D
const VIEWPORT_WIDTH=960
const VIEWPORT_HEIGHT=640
const GRID_ROWS=10
const GRID_COLUMNS=15

var cell_width:float
var cell_height:float


var grid_data=[]


func _ready() -> void:
	setup_grid()
	draw_grid_lines()
	
func setup_grid():
	
	cell_width=float(VIEWPORT_WIDTH)/GRID_COLUMNS
	cell_height=float(VIEWPORT_HEIGHT)/GRID_ROWS
	
	grid_data.resize(GRID_ROWS)
	
	for row in range(GRID_ROWS):
		grid_data[row]=[]
		grid_data[row].resize(GRID_COLUMNS)
		
		for col in range(GRID_COLUMNS):
			grid_data[row][col]=null
			
			
			
			
func draw_grid_lines():
	
	for col in range(GRID_COLUMNS+1):
		
		var line=Line2D.new()
		line.add_point(Vector2(col*cell_width,0))
		line.add_point(Vector2(col*cell_width,VIEWPORT_HEIGHT))
		
		line.default_color=Color.WHITE
		line.width=1.0
		add_child(line)
		
	for row in range(GRID_ROWS+1):
		
		var line=Line2D.new()
		line.add_point(Vector2(0,row*cell_height))
		line.add_point(Vector2(VIEWPORT_WIDTH,row*cell_height))
		
		line.default_color=Color.WHITE
		line.width=1.0
		add_child(line)
		
		
		
		
