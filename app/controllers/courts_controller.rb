class CourtsController < ApplicationController
  def index
    @courts = Court.all
    logger.debug(@courts.class)
    @court = Court.find_by(id: 1)
    logger.debug(@court.class)
    render("home/top")
  end
end
