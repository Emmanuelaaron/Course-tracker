class CoursemodulesController < ApplicationController
  before_action :authorized

  def new
    @coursemodule = Coursemodule.new
  end

  def index
    @coursemodules = current_user.coursemodules.all
  end

  def create
    @coursemodule = current_user.coursemodules.create(coursemodule_params)
    if @coursemodule.save
      redirect_to coursemodules_path
    else
      render :new
    end
  end

  private

  def coursemodule_params
    params.require(:coursemodule).permit(:name, :avatar)
  end
end
