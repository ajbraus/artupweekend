$ ->
	$.localScroll();
	$('.navbar-inner').mouseenter -> 
		$(@).animate 'padding-top': '12px', 200
	$('.navbar-inner').mouseout -> 
		$(@).animate 'padding-top': '0px', 200

	explanation = $('workExplanation')

	$('.work-img').hover(
		-> $(@).find('.work-explanation').fadeToggle();
		-> $(@).find('.work-explanation').fadeToggle();
	)