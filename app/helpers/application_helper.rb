module ApplicationHelper
  def online_status(user)
    content_tag :span, user.nickname,
                class: "user-#{user.id} online_status #{'online' if user.online?} letter-spacing"
  end
end
