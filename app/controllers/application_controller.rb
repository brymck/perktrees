class ApplicationController < ActionController::Base
  before_filter :create_breadcrumbs
  caches_page except: []
  protect_from_forgery

  private

  def create_breadcrumbs
    @breadcrumbs = [["Main", root_path]]
  end
end
