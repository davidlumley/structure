sidebar					= document.getElementById 'structure-sidebar'

if typeof Touch == "object"
	sidebar.classList.add 'touch-enabled'
	origin		=
		'x'	: undefined
		'y'	: undefined

	delta		=
		'x'	: 0
		'y'	: 0

	swipe_length	=
		'x'	: 100
		'y'	: 100

	touch_start = (e) ->
		if e.touches.length is 1
			origin.x = e.touches[0].pageX
			origin.y = e.touches[0].pageY


	touch_move = (e) ->
		if e.touches.length is 1
			delta.x = e.touches[0].pageX - origin.x
			delta.y = e.touches[0].pageY - origin.y

	touch_end = (e) ->
		if (delta.x * delta.x > swipe_length.x * swipe_length.x) || (delta.y * delta.y > swipe_length.y * swipe_length.y)
			# valid swipe
			if delta.x * delta.x > delta.y * delta.y
				# horizontal
				if origin.x < 10 || (origin.x > sidebar.offsetWidth - 10 && origin.x < sidebar.offsetWidth + 10)
					#from edge of sidebar
					if delta.x > 0 && !sidebar.classList.contains 'active'
						# from left
						sidebar.classList.add 'active'
						sidebar_active = true
					if delta.x < 0 && sidebar.classList.contains 'active'
						# from right
						sidebar.classList.remove 'active'
						sidebar_active = false

	document.addEventListener("touchstart",		touch_start);
	document.addEventListener("touchend",			touch_end);
	document.addEventListener("touchmove",		touch_move);
