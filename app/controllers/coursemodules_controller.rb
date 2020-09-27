class CoursemodulesController < ApplicationController
  before_action :authorized

  def new
    @coursemodule = Coursemodule.new
  end

  def index
    @coursemodules = Coursemodule.all
  end

  def create
    @coursemodule = Coursemodule.create(coursemodule_params)
    if @coursemodule.save
      redirect_to '/profile'
    else
      render :new
    end
  end

  private

  def coursemodule_params
    params.require(:coursemodule).permit(:name, :avatar)
  end
end
