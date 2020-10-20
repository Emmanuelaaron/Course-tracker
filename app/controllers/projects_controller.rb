class ProjectsController < ApplicationController
  before_action :authorized
  before_action :set_internal_project_variables, only: [:add_internal_project]
  before_action :set_show_project_variable, only: [:show]

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects.users_projects
    @days = total_days
  end

  def create
    @project = current_user.projects.create(proj_params)

    if @project.save
      redirect_to projects_path, notice: "Sucessfully created #{@project.name}!"
    else
      render :new
    end
  end

  def show
    @project = current_user.projects.find(@id)
    @coursemodules = current_user.coursemodules.includes(:projects).all
  end

  def add_internal_project
    @project = current_user.projects.find(@project_id)
    @project.internalprojects.create(coursemodule_id: @coursemodule_id)
    redirect_to projects_path
  end

  def internal_projects
    courses = current_user.coursemodules.includes(:projects).all
    @internalprojects = []
    courses.each do |course|
      @internalprojects.push(course.projects)
    end
    @internalprojects
  end

  private

  def proj_params
    params.require(:project).permit(:author_id, :name, :amount)
  end

  def internal_proj_params
    params.require(:project).permit(:project_id, :coursemodule_id)
  end

  def set_internal_project_variables
    @project_id = params[:project_id]
    @coursemodule_id = params[:coursemodule_id]
  end

  def set_show_project_variable
    @id = params[:id]
  end
end
