add_back_red = ->
	$(this).addClass("back-red")

clear_back_red = ->
	$(this).removeClass("back-red")

ready = ->
	$(".hover_to_x").hover add_back_red, clear_back_red
			
	$(".hover_to_x").click ->
		$(this).siblings().html(".")
		$(this).siblings().removeClass("selected_x")
		$(this).html('<span class="red">X</span>')
		$(this).addClass("selected_x")
		$(this).parents(".mmline_value").val $(this).data('value')

$(document).ready(ready)
$(document).on('page:load', ready)