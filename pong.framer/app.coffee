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
	
bat_speed = 5
bat_x = 0
score = 0


ball_speed = ->
	return Utils.randomNumber(4, 10)



score_board_BG = new Layer
	width: 640
	height: 40
	backgroundColor: "rgba(140,206,53,0.25)"
	
score_board = new Layer
	width: SCREEN_WIDTH
	y: 5
	backgroundColor: "none"


score_board.html = "SCORE "+ score
textStyle = { "text-align":"center", "font-family":"Courier New", "font-size":"40px"}
score_board.style = textStyle

left_BTN = new Layer
	width: 300
	height: 100
	y: 1036

right_BTN = new Layer
	width: 300
	height: 100
	y: 1036
	x: 340
	
left_BTN.onTapStart ->
	bat_x = - bat_speed
left_BTN.onTapEnd ->
	bat_x = 0
right_BTN.onTapStart ->
	bat_x = + bat_speed
right_BTN.onTapEnd ->
	bat_x = 0
	
ball = new Layer
	backgroundColor: "rgba(156,211,34,1)"
	borderRadius: 0
	height: BALL_SIZE
	width: BALL_SIZE
	x: SCREEN_WIDTH/2 - BALL_SIZE / 2
	y: 100
	dirY = Utils.randomNumber(0, 6)
	dirX = ball_speed()
	
bat = new Layer
	height: 16
	y: BAT_Y
	x: SCREEN_WIDTH/2 - BAT_WIDTH/2
	width: BAT_WIDTH
	backgroundColor: "rgba(141,206,27,1)"

gameLoop = false

Utils.interval 0.01, ->
	
	if gameLoop
		
		# --------------------
		# Ball Collision - Bat
		# --------------------
			
		if ball.y + dirY >= BAT_Y - BALL_SIZE
			#print "bounce Check"
			if ball.x > bat.x and ball.x < (bat.x + BAT_WIDTH)
				##print "bounce"
				dirY = -dirY
				print dirX
				score += 1
				if Math.abs(dirX) < 20 
					dirX *= 1.1
			else
				score = 0
				dirX = ball_speed()
				
		score_board.html = "SCORE "+ score	
		# ---------------------
		# Ball Collision - Wall
		# ---------------------
		
		if ball.y + dirY <= BALL_SIZE
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
		if bat.x + bat_x > 0 and bat.x + bat_x + BAT_WIDTH < SCREEN_WIDTH
			bat.x += bat_x
			

		
