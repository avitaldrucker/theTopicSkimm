class CitiesController < ApplicationController

  def capitals
    @cities = City.state_capitals
    render :index
  end

end
