class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :current_user
  
  private

  def authenticate_user
    unless logged_in?
      flash[:notice] = "ログインが必要です"
      redirect_to login_url
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to login_url
    end
  end

end
