module UsersHelper
  def has_all_connections?
    true if current_user.facebook &&
            current_user.twitter &&
            current_user.github
  end
end