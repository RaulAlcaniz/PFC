class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  protect_from_forgery with: :exception

  private
  def record_not_found
    flash[:alert] = '404 Not Found'
    redirect_to root_path
  end
end
