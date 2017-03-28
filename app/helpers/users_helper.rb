module UsersHelper
  def dev_level_icon
    level = @user.profile.dev_level

    if level == "Beginner"
      "<i class='fa fa-code'></i>".html_safe
    elsif level == "Intermediate"
      "<i class='fa fa-code-fork'></i>".html_safe
    elsif level == "Advanced"
      "<i class='fa fa-cog'></i>".html_safe
    end
  end
end
