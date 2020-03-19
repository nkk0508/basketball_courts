class HomeController < ApplicationController
  def top
    @courts = Court.all
  end
end
