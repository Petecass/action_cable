App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages').append data.message
      scroll_bottom()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)

$(document).on 'turbolinks:load', ->
  scroll_bottom()
