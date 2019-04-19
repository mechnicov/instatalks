jQuery(document).on 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "AppearanceChannel" },
    connected: ->

    disconnected: ->

    received: (data) ->
      users = data['users']

      names = ""
      for i in users
        names += "#{i['nickname']} "

      $('#users').text(names)
