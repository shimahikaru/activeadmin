class ProjectsController < ApplicationController
  before_action :set_project only: %i[show]

  def index
    @prosects = Project.all
  end

  def show
  end

end
