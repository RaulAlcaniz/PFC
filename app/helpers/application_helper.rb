module ApplicationHelper
  def admins_only
    yield if current_user.try :admin?
  end

  def users_only
    yield if !(current_user.try :admin?)
  end

end
