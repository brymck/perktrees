class SkillsController < ApplicationController
  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = Skill.find_by_slug(params[:id])
    @title = @skill.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end
end
