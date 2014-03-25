# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

num_sources = 0
start_time = 0
end_time = 0
source_name = ""
depth = 0

ready = ->
	$(".source-btn").click ->
		num_sources += 1
		start_time = new Date().getTime()
		source_name = $(this).attr("id")
		depth = 0

	$(".more_source_info").click ->
		$(this).hide()
		$(this).parents(".modal-body").find(".source_info").slideDown()
		depth = 1
		false

	$(".more_author_info").click ->
		$(this).parent().hide()
		$(this).parents(".modal-body").find(".author_info").slideDown()
		depth = 2
		false

	$(".source_modal_close").click ->
		end_time = new Date().getTime()
		$('#source_evaluation_modal').modal
			backdrop: "static"
			keyboard: false	
		$(this).parents('.modal').modal('hide')


	$(".source_evaluation_modal_close").click ->
		values = get_rating_values()
		if values
			$(this).parents('.modal').modal('hide')
			reset_mm_line()
			time_duration = end_time - start_time

			hidden_inputs = create_nested_attributes(source_name, time_duration, depth, values[0], values[1], values[2], values[3])
			$("#stance_form").append(hidden_inputs)
		else
			alert("You haven't filled everything out yet!")


get_rating_values = ->
	useful = $("#source_evaluation_modal").find(".selected_x").get(0)
	trustworthy = $("#source_evaluation_modal").find(".selected_x").get(1)
	accurate = $("#source_evaluation_modal").find(".selected_x").get(2)
	interesting = $("#source_evaluation_modal").find(".selected_x").get(3)

	if useful && trustworthy && accurate && interesting
		[$(useful).data('value'), $(trustworthy).data('value'), $(accurate).data('value'), $(interesting).data('value')]
	else
		false

reset_mm_line = ->
	$(".selected_x").html(".");
	$(".selected_x").removeClass("selected_x");


create_nested_attributes = (source_name, time_duration, depth, trustworthy, useful, accurate, interesting) ->
	r = create_hidden_field(num_sources, "source_name", source_name)
	r += create_hidden_field(num_sources, "order", num_sources)
	r += create_hidden_field(num_sources, "time_duration", time_duration)
	r += create_hidden_field(num_sources, "depth", depth)
	r += create_hidden_field(num_sources, "trustworthy", trustworthy)
	r += create_hidden_field(num_sources, "useful", useful)
	r += create_hidden_field(num_sources, "accurate", accurate)
	r += create_hidden_field(num_sources, "interesting", interesting)
	num_sources += 1
	return r

create_hidden_field = (num_source, name, value) ->
	'<input name="stance[sources_attributes][' + num_source + '][' + name + ']" type="hidden" value="' + value + '">'

$(document).ready(ready)
$(document).on('page:load', ready)