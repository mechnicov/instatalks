class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.update(online: true)
    stream_from("appearance_channel")
    ActionCable.server.broadcast "appearance_channel",
                                 users: User.online.as_json
  end

  def unsubscribed
    current_user.update(online: false)
    ActionCable.server.broadcast "appearance_channel",
                                 users: User.online.as_json
  end
end
