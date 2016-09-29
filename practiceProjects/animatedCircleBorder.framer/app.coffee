# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Chad Smith"
	twitter: ""
	description: ""


#circle settings
radius  = 150
stroke  = 12
viewBox = (radius * 2) + stroke

#container layer
circle = new Layer
  width:  viewBox
  height: viewBox
  backgroundColor: ''

#perimeter formula 2*PI*radius
circle.pathLength = 2 * Math.PI * radius

#svg element
circle.html = """
  <svg viewBox='-#{stroke/2} -#{stroke/2} #{viewBox} #{viewBox}'>
    <circle fill='none' stroke='#fc245c'
      stroke-width      = '#{stroke}'
      stroke-dasharray  = '#{circle.pathLength}'
      stroke-dashoffset = '0'
      cx = '#{radius}'
      cy = '#{radius}'
      r  = '#{radius}'
      stroke-linecap = 'round'
      >
  </svg>"""
  
#get a reference after the render  
Utils.domComplete ->
	circle.path = document.querySelector('svg circle')
  
#object that we track for modulate animation  
proxy = new Layer
	backgroundColor: null
proxy.on 'change:x', ->
	offset = Utils.modulate(@.x, [0, 100], [circle.pathLength, 200])
	circle.path.setAttribute 'stroke-dashoffset', offset

#animate after render	
Utils.domComplete ->
	proxy.animate
		properties:
			 x: 100