class PerksController < ApplicationController
  before_filter :add_breadcrumbs
  caches_page except: []

  def index
    @skills = Skill.all
    @title = "Perks"
  end

  def show
    @perk = Perk.find_by_slug(params[:id])
    @title = @perk.name
    @breadcrumbs << [@perk.name, @perk]
  end

  private

  def add_breadcrumbs
    @breadcrumbs << ["Perks", perks_path]
  end
end
