class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception

  before_filter RubyCAS::Filter
  before_filter :create_user
  def current_user
    @current_user ||= User.find_by(email: session[:cas_user]) if session[:cas_user]
  end
  helper_method :current_user
  hide_action :current_user
  private
    def create_user
      cur_user = session[:cas_user]
      user= User.where(email: cur_user)
      if(cur_user && user.count == 0)
        User.create({name:cur_user.split("@").first, email: cur_user})
      end
    end
end
