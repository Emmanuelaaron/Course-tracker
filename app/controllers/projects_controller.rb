class ProjectsController < ApplicationController
  before_action :authorized

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(proj_params)

    if @project.save
      redirect_to '/welcome'
    else
      render :new
    end
  end

  private

  def proj_params
    params.require(:project).permit(:author_id, :name, :amount)
  end
end
