module UsersHelper
  def profile_picture(user)
    if user.avatar.present?
      image_tag user.avatar.url(:original), class:"medium-thumbnail img-circle"
    else
      image_tag "default_profile_pic.png", class:"medium-thumbnail img-circle"
    end
  end
  def small_profile_picture(user)
    if user.avatar.present?
      image_tag user.avatar.url(:original), class:"small-thumbnail img-circle pull-left"
    else
      image_tag "default_profile_pic.png", class:"small-thumbnail img-circle pull-left"
    end
  end
end