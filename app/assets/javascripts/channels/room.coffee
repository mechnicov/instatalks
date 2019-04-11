jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if messages.length > 0
    createRoomChannel messages.data('room-id')
    scroll_bottom()

  $(document).on 'keypress', '#message_body', (event) ->
    message = event.target.value
    if event.keyCode is 13
      if message != ""
        App.room.speak(message)
        event.target.value = ""
        event.preventDefault()
      else
        event.preventDefault()

scroll_bottom = () ->
  messages.scrollTop = messages.scrollHeight

createRoomChannel = (roomId) ->
  App.room = App.cable.subscriptions.create {channel: "RoomChannel", roomId: roomId},
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log('Connected to RoomChannel')

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log('Disconnected from RoomChannel')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Received message: ' + data['message'])
      $('#messages').append data['message']
      scroll_bottom()

    speak: (message) ->
      @perform 'speak', message: message
