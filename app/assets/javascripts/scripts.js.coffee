$ ->
	$.localScroll();
	
	explanation = $('workExplanation')

	$('.work-img').hover(
		-> $(@).find('.work-explanation').fadeToggle();
		-> $(@).find('.work-explanation').fadeToggle();
	)