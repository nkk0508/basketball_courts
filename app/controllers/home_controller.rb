class HomeController < ApplicationController
  def index
  end

  def top
    @courts = Court.all
  end
end
