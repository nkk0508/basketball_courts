class FavoritesController < ApplicationController
  def index
  end

  def create
    @court = Court.find_by(id: params[:id])
    @favorite = Favorite.new(user_id: @current_user.id, court_id: params[:court_id])
    @favorite.save
    redirect_to("/")
  end

  def destroy
    @court = Court.find_by(id: params[:id])
    @favorite = Favorite.find_by(user_id: @current_user.id, court_id: params[:court_id])
    @favorite.destroy
    redirect_to("/")
  end

end
