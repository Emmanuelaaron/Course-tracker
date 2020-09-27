class ProjectsController < ApplicationController
  before_action :authorized

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects.all
    @days = total_days
  end

  def create
    @project = current_user.projects.create(proj_params)

    if @project.save
      redirect_to '/profile'
    else
      render :new
    end
  end

  private

  def proj_params
    params.require(:project).permit(:author_id, :name, :amount)
  end
end
