sidebar					= document.getElementById 'structure-sidebar'

if typeof Touch == "object"
	sidebar.classList.add 'touch-enabled'
	origin		=
		'x'	: undefined
		'y'	: undefined
		'timestamp'	: undefined

	delta		=
		'x'	: 0
		'y'	: 0
		'timestamp'	: 0

	swipe_length	=
		'x'	: 50
		'y'	: 50

	tap =
		'timeout'	: 300
		'y_threshold'	: 3
		'x_threshold'	: 3

	touch_start = (e) ->
		if e.touches.length is 1
			origin.x = e.touches[0].pageX
			origin.y = e.touches[0].pageY
			origin.timestamp = e.timeStamp


	touch_move = (e) ->
		if e.touches.length is 1
			delta.x = e.touches[0].pageX - origin.x
			delta.y = e.touches[0].pageY - origin.y

	touch_end = (e) ->
		delta.timestamp	= e.timeStamp - origin.timestamp
		if (delta.timestamp < tap.timeout) && (delta.x * delta.x < tap.x_threshold * tap.x_threshold) && (delta.y * delta.y < tap.y_threshold * tap.y_threshold)
			unless sidebar.contains(e.target)
				hide_sidebar(e)
		if (delta.x * delta.x > swipe_length.x * swipe_length.x) || (delta.y * delta.y > swipe_length.y * swipe_length.y)
			# valid swipe
			if delta.x * delta.x > delta.y * delta.y
				# horizontal
				if origin.x < 15 || (origin.x > sidebar.offsetWidth - 50 && origin.x < sidebar.offsetWidth + 20)
					#from edge of sidebar
					if delta.x > 0
						# from left
						show_sidebar(e)
					if delta.x < 0
						# from right
						hide_sidebar(e)
		delta.x = 0
		delta.y = 0

	show_sidebar = (e) ->
		if sidebar.classList.contains 'active'
			return false
		e.preventDefault()
		sidebar.classList.add 'active'
		sidebar_active = true

	hide_sidebar = (e) ->
		unless sidebar.classList.contains 'active'
			return false
		e.preventDefault()
		sidebar.classList.remove 'active'
		sidebar_active = false

	document.addEventListener("touchstart",		touch_start);
	document.addEventListener("touchend",			touch_end);
	document.addEventListener("touchmove",		touch_move);
