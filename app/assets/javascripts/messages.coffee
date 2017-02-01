submit_message = () ->
  $('#new_message').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      submit_form(event)

  $('#submit').on 'click', (event) ->
    submit_form(event)

submit_form = () ->
  $('input').click()
  event.target.value = ''
  event.preventDefault()

$(document).on 'turbolinks:load', ->
  submit_message()
