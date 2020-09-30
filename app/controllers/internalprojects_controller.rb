class InternalprojectsController < ApplicationController
  def create
    # @module = Coursemodule.find(params[:id])
    @project = Internalproject.create(internalproject_params)
  end

  private

  def internalproject_params
    params.permit(:project_id, :coursemodule_id)
  end
end
