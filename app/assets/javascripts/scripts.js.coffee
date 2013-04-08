$ ->
	$.localScroll();
	$('.navbar-inner').mouseenter -> 
		$(@).animate 'padding-top': '12px', 200
	$('.navbar-inner').mouseout -> 
		$(@).animate 'padding-top': '0px', 200

	$('.work-img').mouseenter ->

	$('work-img').mouseout ->