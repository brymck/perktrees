class SkillsController < ApplicationController
  caches_page except: []

  def index
    @skills = Skill.all
    @races = Race.all
    @title = "Skyrim Character Creation"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  def show
    @skill = Skill.find_by_slug(params[:id])
    @title = @skill.name
    @breadcrumbs << [@skill.name, @skill]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end
end
