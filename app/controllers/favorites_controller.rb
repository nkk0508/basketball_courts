class FavoritesController < ApplicationController
  def create
    @court = Court.find(params[:court_id])
    @favorite = Favorite.new(user: @current_user, court: @court)

    respond_to do |format|
      if @favorite.save
        format.js
      else
        format.js { render json: { errors: @court.errors.full_messages } }
      end
    end
  end

  def destroy
    @court = Court.find(params[:court_id])
    @favorite = @current_user&.favorites&.find_by(court_id: @court.id)

    respond_to do |format|
      if @favorite&.destroy
        format.js
      else
        format.js { render json: { errors: @court.errors.full_messages } }
      end
    end
  end
end
