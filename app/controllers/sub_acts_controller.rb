class SubActsController < ApplicationController
  def create
    permitted_params = params.permit(:name, :main_act_id, metadata: {})
    metadata = permitted_params.delete :metadata

    metadata["have"] = metadata["have"].to_i
    metadata["need"] = metadata["need"].to_i
    metadata["get"] = metadata["get"].to_i
    sub_act = SubAct.new(permitted_params)
    sub_act.metadata = metadata

    sub_act.save!

    redirect_back fallback_location: root_path
  end

  def destroy
    SubAct.find(params[:id]).destroy
  
    redirect_back fallback_location: root_path
  end
end
