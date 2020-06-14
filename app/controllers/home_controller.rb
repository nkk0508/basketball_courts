class HomeController < ApplicationController
  def top
    @courts = Court.all.includes(:favorites)
    @favorites = Favorite.all.includes(:user, :court)
    @favorited = false
  end
end
