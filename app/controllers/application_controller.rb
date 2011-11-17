class ApplicationController < ActionController::Base
  before_filter :create_breadcrumbs
  protect_from_forgery

  private

  def create_breadcrumbs
    @breadcrumbs = [["Main", root_path]]
  end
end
