class PerksController < ApplicationController
  def index
    @title = "Perks"
  end

  def show
    @perk = Perk.find_by_slug(params[:id])
    @title = @perk.name
  end
end
