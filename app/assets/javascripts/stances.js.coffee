# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

num_sources = 0
start_time = 0
end_time = 0
source_name = ""
depth = 0
modal_id = null

ready = ->
	$(".source-btn").click ->
		num_sources += 1
		start_time = new Date().getTime()
		source_name = $(this).attr("id")
		modal_id = $(this).data("textModal")
		depth = 0

	$(".go_to_source").click ->
		pre_reason = $("#source_pre_modal").find('input[name=pre_reason]:checked').val()
		pre_reason_other_text = $("#source_pre_modal").find('input:text[name=pre_reason_other_text]').val()

		if pre_reason && (pre_reason != 8 || pre_reason_other_text)
			$("#stance_form").append(create_hidden_field(num_sources, 'pre_reason', pre_reason))
			$("#stance_form").append(create_hidden_field(num_sources, 'pre_reason_other_text', pre_reason_other_text))

			# Reset state
			$("#source_pre_modal").find('input[name=pre_reason]:checked').prop('checked', false)
			$("#source_pre_modal").find('input:text[name=pre_reason_other_text]').val('')

			$(this).parents('.modal').modal('hide')
			$(modal_id).modal('show')
		else
			alert("You haven't filled everything out yet!")

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

			$("#source_evaluation_modal").find('input[name=post_reason]:checked').prop('checked', false)
			$("#source_evaluation_modal").find('input:text[name=post_reason_other_text]').val('')

			hidden_inputs = create_nested_attributes(source_name, time_duration, depth, values)
			$("#stance_form").append(hidden_inputs)
		else
			alert("You haven't filled everything out yet!")


get_rating_values = ->
	like_text = $("#source_evaluation_modal").find(".selected_x").get(0)
	sentiment = $("#source_evaluation_modal").find(".selected_x").get(1)
	post_reason = $("#source_evaluation_modal").find('input[name=post_reason]:checked').val()
	post_reason_other_text = $("#source_evaluation_modal").find('input:text[name=post_reason_other_text]').val()

	if like_text && sentiment && post_reason && (post_reason != 8 || post_reason_other_text)
		{
			like_text: $(like_text).data('value'),
			sentiment: $(sentiment).data('value'),
			post_reason: post_reason,
			post_reason_other_text: post_reason_other_text
		}
	else
		false

reset_mm_line = ->
	$(".selected_x").html(".");
	$(".selected_x").removeClass("selected_x");


create_nested_attributes = (source_name, time_duration, depth, values) ->
	r = create_hidden_field(num_sources, "source_name", source_name)
	r += create_hidden_field(num_sources, "order", num_sources)
	r += create_hidden_field(num_sources, "time_duration", time_duration)
	r += create_hidden_field(num_sources, "depth", depth)

	for key, value of values
		r += create_hidden_field(num_sources, key, value)

	num_sources += 1
	return r

create_hidden_field = (num_source, name, value) ->
	'<input name="stance[sources_attributes][' + num_source + '][' + name + ']" type="hidden" value="' + value + '">'

$(document).ready(ready)
$(document).on('page:load', ready)
