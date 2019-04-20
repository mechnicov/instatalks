class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.update(online: true)
    stream_from("appearance_channel")
    broadcast_online_users
  end

  def unsubscribed
    current_user.update(online: false)
    broadcast_online_users
  end

  private

  def broadcast_online_users
    ActionCable.server.broadcast "appearance_channel",
                                 users: User.online.as_json
  end
end
