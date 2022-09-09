class CompletionsController < ApplicationController
  def undo
    completion = Completion.find(params[:id]).destroy

    redirect_to "#{url_for(root_path)}#main-#{completion.sub_act.main_act.id}"
  end

  def create
    completion = Completion.create!(sub_act_id: params[:sub_act_id])
    redirect_to "#{url_for(root_path)}#main-#{completion.sub_act.main_act.id}"
  end

  def create_with_count
    Completion.create!(sub_act_id: params[:sub_act_id])
    sub_act = SubAct.find(params[:sub_act_id])

    metadata = sub_act.metadata
    metadata["have"] = params[:have].to_i
    metadata["need"] = params[:need].to_i
    metadata["get"] = params[:get].to_i

    sub_act.update!(metadata: metadata)

    redirect_to "#{url_for(root_path)}#main-#{sub_act.main_act.id}"
  end
end
