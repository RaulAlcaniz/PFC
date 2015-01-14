class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :set_user
  #
  # private
  # def set_user
  #   if params[:controller] == 'people' and params[:id]
  #     @user_to_watch = params[:id] if User.find(current_user).admin?
  #   end
  #   # puts params[:id]
  #   # puts 'asd', Rails.application.routes.recognize_path('/people/')[:controller]
  #   # @user_to_watch = params[:user_id] if params[:user_id] and User.find(current_user).admin?
  #   puts 'user', #@user_to_watch
  # end

end
