class RacesController < ApplicationController
  def index
    @title = "Races"
  end

  def show
    @race = Race.find_by_slug(params[:id])
    @title = @race.name
  end
end
