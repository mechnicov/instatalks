jQuery(document).on 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "AppearanceChannel" },
    connected: ->

    disconnected: ->

    received: (data) ->
      user = $(".user-#{data['user_id']}")
      user.toggleClass 'online', data['online']
      $("#users").load(" #users")
