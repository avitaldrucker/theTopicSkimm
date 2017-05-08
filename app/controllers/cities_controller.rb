class CitiesController < ApplicationController

  def capitals
    @cities = City.capitals
    render :index
  end

end
