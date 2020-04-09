class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user, { only: [:show] }
  before_action :forbid_login_user, { only: [:new, :create, :login_form, :login] }
  before_action :ensure_correct_user, { only: [:show] }

  def show
    @favorites = Favorite.where(user_id: @current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: '登録完了'
    else
      flash.now[:notice_form] = '登録に失敗しました'
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = '権限がありません'
      redirect_to login_url
    end
  end
end
