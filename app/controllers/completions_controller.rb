class CompletionsController < ApplicationController
  def undo
    Completion.find(params[:id]).destroy

    redirect_back fallback_location: root_path
  end

  def create
    Completion.create!(sub_act_id: params[:sub_act_id])
    redirect_back fallback_location: root_path
  end

  def create_with_count
    Completion.create!(sub_act_id: params[:sub_act_id])
    sub_act = SubAct.find(params[:sub_act_id])

    metadata = sub_act.metadata
    metadata["have"] = params[:have].to_i
    metadata["need"] = params[:need].to_i
    metadata["get"] = params[:get].to_i

    sub_act.update!(metadata: metadata)

    redirect_back fallback_location: root_path
  end
end
