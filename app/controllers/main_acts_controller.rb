class MainActsController < ApplicationController
  def create
    permitted_params = params.permit(:user_id, :name)
    MainAct.create!(permitted_params)

    redirect_back fallback_location: root_path
  end

  def destroy
    MainAct.find(params[:id]).destroy

    redirect_back fallback_location: root_path
  end
end
