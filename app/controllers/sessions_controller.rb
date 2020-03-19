class SessionsController < ApplicationController
  def index
  end

  def new
    if @current_user
      redirect_to("/")
    end
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      remember user
      redirect_to root_url, notice: 'ログインしました'
    else
      flash.now[:notice_form] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, notice: 'ログアウトしました'
  end

  def logout
    unless @current_user
      redirect_to("/login")
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
