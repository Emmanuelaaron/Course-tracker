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

  def show
    @project = current_user.projects.find(params[:id])
    @coursemodules = current_user.coursemodules.all
  end

  def add_internal_project
    @project = current_user.projects.find(params[:project_id])
    @project.internalprojects.create(coursemodule_id: params[:coursemodule_id])
    render :new
  end

  private

  def proj_params
    params.require(:project).permit(:author_id, :name, :amount)
  end
end
