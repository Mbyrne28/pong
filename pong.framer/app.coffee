# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Matthew Byrne"
	twitter: ""
	description: "Pong 1.0 - basic Pong using framer.js"


joystick = new Layer
	width:750
	height: 1340
	backgroundColor: "black"
	
ball = new Layer
	backgroundColor: "rgba(156,211,34,1)"
	borderRadius: 0
	height: 42
	width: 42
	x: 354
	y: 259
	dirX = Utils.randomNumber(0, 10)
	dirY = Utils.randomNumber(0, 6)
	
bat = new Layer
	height: 16
	y: 1000
	x: 220
	backgroundColor: "rgba(141,206,27,1)"


	
	
#joystick.onTouchMove (event, layer) ->
#	print event.x
#	bat.x = (event.x-88)*2
    

#bat.draggable.horizontal = true
#bat.draggable.vertical = false


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

Utils.interval 0.1, ->
	
	if gameLoop
		#if bat.y < 0
		#	bay.y = 0
		
		# --------------------
		# Ball Collision - Bat
		# --------------------
			
		if ball.y + dirY >= 960
			print "bounce Check"
			if ball.x > bat.x and ball.x < (bat.x + 200)
				print "bounce"
				dirY = -dirY
		
		
		# =========
		# Move Ball
		# =========
			
		ball.x = ball.x + dirX
		ball.y = ball.y + dirY
		
		# ==============
		# Ball Collision
		# ==============
			
		# ---------------------
		# Ball Collision - Wall
		# ---------------------
		
		if ball.y < -40
			dirY = - dirY
		if ball.y >  1000
			ball.y = 41
		if ball.x <  0 or ball.x >  610
			dirX = - dirX



