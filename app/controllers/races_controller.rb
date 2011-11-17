class RacesController < ApplicationController
  before_filter :add_breadcrumbs

  def index
    @races = Race.all
    @title = "Races"
  end

  def show
    @race = Race.find_by_slug(params[:id])
    @title = @race.name
    @breadcrumbs << [@race.name, @race]
  end

  private

  def add_breadcrumbs
    @breadcrumbs << ["Races", races_path]
  end
end
