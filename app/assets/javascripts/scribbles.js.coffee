# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


watch_form = () ->
  input = $($('#scribble_text')[0])
  save_indicator = $($('#save_indicator')[0])
  if input.val() != input.attr('data')
    body_was = input.val()
    set_saving(save_indicator)
    input.attr('data', input.val())
    form = input.parentsUntil('form').parent()[0]
    $.ajax(form.action + '.json', {type: 'PUT', data: $(form).serialize(), success: () -> set_saved(save_indicator, body_was)})

set_saving = (save_indicator) ->
  save_indicator.removeClass('label-success').addClass('label-info').text('saving...')
set_saved = (save_indicator) ->
  save_indicator.removeClass('label-info').addClass('label-success').text('saved.')

setInterval(watch_form, 50)