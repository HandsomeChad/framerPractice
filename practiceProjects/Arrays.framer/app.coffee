# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Chad Smith"
	twitter: ""
	description: ""



circle = new Layer
	borderRadius: 100
	clip: true
	name: 'circle'
		
	
class Card extends Layer
	constructor: (options={}) ->
		options.width = 100*2
		options.height = 100*2
		options.backgroundColor = "#ff3232"
		options.borderRadius = 200
		options.opacity = 0.1
		options.parent = circle
		#options.y = options.y
		super options

myArray = [new Card, new Card];

print myArray

circle.onClick (event, layer) ->
	#push a class to an array
	myArray.push(card = new Card)
	circle.animate
		properties:
			x: Utils.randomNumber 15, 300
		ease: "ease-in-out"
		time: 0.3
	#kill elements from the DOM
	if circle.x > 100
		circle.destroy()
	
Animation2 = new Animation
	layer: circle
		
	
circle.on(Events.AnimationEnd, Animaton2.start)

