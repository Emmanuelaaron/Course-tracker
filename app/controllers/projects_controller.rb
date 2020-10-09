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
    redirect_to projects_path
  end

  def internal_projects
    courses = current_user.coursemodules
    @internalprojects = []
    courses.each do |course|
      @internalprojects.push(course.projects) unless @internalprojects.include? course
    end
    @internalprojects
  end

  private

  def proj_params
    params.require(:project).permit(:author_id, :name, :amount)
  end
end
