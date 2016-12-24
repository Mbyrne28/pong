# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Matthew Byrne"
	twitter: ""
	description: "Pong 1.0 - basic Pong using framer.js"


SCREEN_WIDTH = 640
BAT_WIDTH = 200
BAT_Y = 1000
BALL_SIZE = 40

joystick = new Layer
	width:750
	height: 1340
	backgroundColor: "black"
	


left_BTN = new Layer
	width: 300
	height: 100
	y: 1036

right_BTN = new Layer
	width: 300
	height: 100
	y: 1036
	x: 340
	
left_BTN.onClick ->
	print "left"

right_BTN.onClick ->
	print "right"
	
ball = new Layer
	backgroundColor: "rgba(156,211,34,1)"
	borderRadius: 0
	height: BALL_SIZE
	width: BALL_SIZE
	x: SCREEN_WIDTH/2 - BALL_SIZE / 2
	y: 100
	dirX = Utils.randomNumber(0, 10)
	dirY = Utils.randomNumber(0, 6)
	
bat = new Layer
	height: 16
	y: BAT_Y
	x: SCREEN_WIDTH/2 - BAT_WIDTH/2
	width: BAT_WIDTH
	backgroundColor: "rgba(141,206,27,1)"

## Ball
# - bounces off wall
# - bounces off bat
# - spawns at top of screen when passing bat

## Controls
# - left / right buttons

## Gameplay
# - ball speed increases when striking bat
# - score increases when ball hits bat

#layerA = new Layer
#	width: 640
#	height: 1136

gameLoop = false

Utils.interval 0.01, ->
	
	if gameLoop
		
		# --------------------
		# Ball Collision - Bat
		# --------------------
			
		if ball.y + dirY >= BAT_Y - BALL_SIZE
			print "bounce Check"
			if ball.x > bat.x and ball.x < (bat.x + BAT_WIDTH)
				print "bounce"
				dirY = -dirY
			
		# ---------------------
		# Ball Collision - Wall
		# ---------------------
		
		if ball.y < -40
			dirY = - dirY
		if ball.y >  1000
			ball.y = 41
		if ball.x <  0 or ball.x >  610
			dirX = - dirX
			
		# =========
		# Move Ball
		# =========
			
		ball.x = ball.x + dirX
		ball.y = ball.y + dirY

		# =========
		# Move Bat 
		# =========


