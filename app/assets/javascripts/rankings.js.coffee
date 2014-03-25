# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$("input").click ->
		$("input."+this.className).not($(this)).each ->
			this.checked = false
			return

$(document).ready(ready)
$(document).on('page:load', ready)