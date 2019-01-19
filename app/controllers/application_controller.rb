class ApplicationController < ActionController::Base

  def set_project
    name = params[:name]
    @project = Project.find_by(name: name)
  end

end
