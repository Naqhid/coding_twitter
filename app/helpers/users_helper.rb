module UsersHelper
  def follower_check(current_user, user)
    if user.id != current_user.id
      concat(content_tag(:div, class: 'd-flex border-top') do
        concat(content_tag(:div, class: 'pt-2 pr-2') do
          image_check_right(user.photo)
        end)
        concat(content_tag(:div, class: 'follower-name') do
          concat(content_tag(:h4, (link_to user.fullname, user_path(user.id))))
        end)
      end)
    end
  end

  def follow_unfollow_links(current_user, user)
    if user.id != current_user.id
      if user.follower?(current_user, user.id)
        link_to "<i class='text-warning fas fa-minus-circle fa-2x'></i>".html_safe, following_path(followed_id: user.id), method: :delete
      else
        link_to "<i class='text-success fas fa-plus-circle fa-2x'></i>".html_safe, followings_path(followed_id: user.id), method: :post
      end
    end
  end

  def followed_by(current_user, user)
    if user.id != current_user.id
      if !user.follower?(current_user, user.id)       
          concat(content_tag(:div, class: 'd-flex border-top') do
            concat(content_tag(:div, class: '') do
              image_check_right(user.photo)
            end)
            concat(content_tag(:div, class: 'follower-name') do
              concat(content_tag(:h4, (link_to user.fullname, user_path(user.id))))
            end)
          end)
          link_to "<i class='text-success fas fa-plus-circle fa-2x d-flex justify-content-end'></i>".html_safe, followings_path(followed_id: user.id), method: :post
      end
    end
  end
end
