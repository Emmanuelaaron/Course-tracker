class ProjectsController < ApplicationController
  before_action :authorized

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(
      author_id: current_user.id,
      name: :name,
      amount: :amount
    )

    if @project.save
      redirect_to '/welcome'
    else
      render :new
    end
  end
end
