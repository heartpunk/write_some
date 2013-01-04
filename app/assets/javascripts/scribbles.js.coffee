# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


watch_form = () ->
  input = $($('#scribble_text')[0])
  if input.val() != input.attr('data')
    input.attr('data', input.val())
    form = input.parentsUntil('form').parent()[0]
    $.ajax(form.action + '.json?' + $(form).serialize(), {type: 'PUT'})

setInterval(watch_form, 50)