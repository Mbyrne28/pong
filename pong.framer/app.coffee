# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Matthew Byrne"
	twitter: ""
	description: ""


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
	y: 1318
	backgroundColor: "rgba(141,206,27,1)"

bat.draggable.horizontal = true
bat.draggable.vertical = false

gameLoop = true

Utils.interval 0.01, ->
	
	if gameLoop
		if bat.y < 0
			bay.y = 0
		#print "yo"
		ball.x = ball.x + dirX
		ball.y = ball.y + dirY
		if ball.x <  0 or ball.x >  730
			dirX = - dirX
			
		if ball.y >= 1300
			#print "bounce Check"
			if ball.x > bat.x and ball.x < (bat.x + 200)
				#print "bounce"
				dirY = -dirY
		if ball.y < -40
			dirY = -dirY
		if ball.y >  1334
			ball.y = 41
